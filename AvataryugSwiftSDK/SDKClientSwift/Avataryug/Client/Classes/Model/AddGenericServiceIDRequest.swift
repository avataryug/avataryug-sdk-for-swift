import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct AddGenericServiceIDRequest: Codable, JSONEncodable, Hashable {

    /** Generic service identifier to add to the users account. */
    public var genericServiceID: String

    public init(genericServiceID: String) {
        self.genericServiceID = genericServiceID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case genericServiceID = "GenericServiceID"
    }

    // Encodable protocol methods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(genericServiceID, forKey: .genericServiceID)
    }
}

