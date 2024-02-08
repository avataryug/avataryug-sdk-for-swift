import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetClipsByIDResultDataCustomMetaDataInner: Codable, JSONEncodable, Hashable {

    ///Get or Set Key
    public var key: String
    
    ///Get or Set Selected
    public var selected: Bool
    
    ///Get or Set Value
    public var value: String

    public init(key: String, selected: Bool, value: String) {
        self.key = key
        self.selected = selected
        self.value = value
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case key = "Key"
        case selected = "Selected"
        case value = "Value"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(key, forKey: .key)
        try container.encode(selected, forKey: .selected)
        try container.encode(value, forKey: .value)
    }
}

