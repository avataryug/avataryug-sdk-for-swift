import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
///
extension Bool: JSONEncodable {
    func encodeToJSON() -> Any { self }
}

extension Float: JSONEncodable {
    func encodeToJSON() -> Any { self }
}

extension Int: JSONEncodable {
    func encodeToJSON() -> Any { self }
}

extension Int32: JSONEncodable {
    func encodeToJSON() -> Any { self }
}

extension Int64: JSONEncodable {
    func encodeToJSON() -> Any { self }
}

extension Double: JSONEncodable {
    func encodeToJSON() -> Any { self }
}

extension Decimal: JSONEncodable {
    func encodeToJSON() -> Any { self }
}

extension String: JSONEncodable {
    func encodeToJSON() -> Any { self }
}

extension URL: JSONEncodable {
    func encodeToJSON() -> Any { self }
}

extension UUID: JSONEncodable {
    func encodeToJSON() -> Any { self }
}

extension RawRepresentable where RawValue: JSONEncodable {
    func encodeToJSON() -> Any { return self.rawValue }
}

private func encodeIfPossible<T>(_ object: T) -> Any {
    if let encodableObject = object as? JSONEncodable {
        return encodableObject.encodeToJSON()
    } else {
        return object
    }
}

extension Array: JSONEncodable {
    func encodeToJSON() -> Any {
        return self.map(encodeIfPossible)
    }
}

extension Set: JSONEncodable {
    func encodeToJSON() -> Any {
        return Array(self).encodeToJSON()
    }
}

extension Dictionary: JSONEncodable {
    func encodeToJSON() -> Any {
        var dictionary = [AnyHashable: Any]()
        for (key, value) in self {
            dictionary[key] = encodeIfPossible(value)
        }
        return dictionary
    }
}

extension Data: JSONEncodable {
    func encodeToJSON() -> Any {
        return self.base64EncodedString(options: Data.Base64EncodingOptions())
    }
}

extension Date: JSONEncodable {
    func encodeToJSON() -> Any {
        return CodableHelper.dateFormatter.string(from: self)
    }
}

extension JSONEncodable where Self: Encodable {
    func encodeToJSON() -> Any {
        guard let data = try? CodableHelper.jsonEncoder.encode(self) else {
            fatalError("Could not encode to json: \(self)")
        }
        return data.encodeToJSON()
    }
}

extension String: CodingKey {

    public var stringValue: String {
        return self
    }

    public init?(stringValue: String) {
        self.init(stringLiteral: stringValue)
    }

    public var intValue: Int? {
        return nil
    }

    public init?(intValue: Int) {
        return nil
    }

}

extension KeyedEncodingContainerProtocol {

    public mutating func encodeArray<T>(_ values: [T], forKey key: Self.Key) throws where T: Encodable {
        var arrayContainer = nestedUnkeyedContainer(forKey: key)
        try arrayContainer.encode(contentsOf: values)
    }

    public mutating func encodeArrayIfPresent<T>(_ values: [T]?, forKey key: Self.Key) throws where T: Encodable {
        if let values = values {
            try encodeArray(values, forKey: key)
        }
    }

    public mutating func encodeMap<T>(_ pairs: [Self.Key: T]) throws where T: Encodable {
        for (key, value) in pairs {
            try encode(value, forKey: key)
        }
    }

    public mutating func encodeMapIfPresent<T>(_ pairs: [Self.Key: T]?) throws where T: Encodable {
        if let pairs = pairs {
            try encodeMap(pairs)
        }
    }

    public mutating func encode(_ value: Decimal, forKey key: Self.Key) throws {
        var mutableValue = value
        let stringValue = NSDecimalString(&mutableValue, Locale(identifier: "en_US"))
        try encode(stringValue, forKey: key)
    }

    public mutating func encodeIfPresent(_ value: Decimal?, forKey key: Self.Key) throws {
        if let value = value {
            try encode(value, forKey: key)
        }
    }
}

extension KeyedDecodingContainerProtocol {

    public func decodeArray<T>(_ type: T.Type, forKey key: Self.Key) throws -> [T] where T: Decodable {
        var tmpArray = [T]()

        var nestedContainer = try nestedUnkeyedContainer(forKey: key)
        while !nestedContainer.isAtEnd {
            let arrayValue = try nestedContainer.decode(T.self)
            tmpArray.append(arrayValue)
        }

        return tmpArray
    }

    public func decodeArrayIfPresent<T>(_ type: T.Type, forKey key: Self.Key) throws -> [T]? where T: Decodable {
        var tmpArray: [T]?

        if contains(key) {
            tmpArray = try decodeArray(T.self, forKey: key)
        }

        return tmpArray
    }

    public func decodeMap<T>(_ type: T.Type, excludedKeys: Set<Self.Key>) throws -> [Self.Key: T] where T: Decodable {
        var map: [Self.Key: T] = [:]

        for key in allKeys {
            if !excludedKeys.contains(key) {
                let value = try decode(T.self, forKey: key)
                map[key] = value
            }
        }

        return map
    }

    public func decode(_ type: Decimal.Type, forKey key: Self.Key) throws -> Decimal {
        let stringValue = try decode(String.self, forKey: key)
        guard let decimalValue = Decimal(string: stringValue) else {
            let context = DecodingError.Context(codingPath: [key], debugDescription: "The key \(key) couldn't be converted to a Decimal value")
            throw DecodingError.typeMismatch(type, context)
        }

        return decimalValue
    }

    public func decodeIfPresent(_ type: Decimal.Type, forKey key: Self.Key) throws -> Decimal? {
        guard let stringValue = try decodeIfPresent(String.self, forKey: key) else {
            return nil
        }
        guard let decimalValue = Decimal(string: stringValue) else {
            let context = DecodingError.Context(codingPath: [key], debugDescription: "The key \(key) couldn't be converted to a Decimal value")
            throw DecodingError.typeMismatch(type, context)
        }

        return decimalValue
    }

}

extension HTTPURLResponse {
    var isStatusCodeSuccessful: Bool {
        return Configuration.successfulStatusCodeRange.contains(statusCode)
    }
}
