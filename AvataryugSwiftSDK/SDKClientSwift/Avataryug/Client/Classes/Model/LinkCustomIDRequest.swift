import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LinkCustomIDRequest: Codable, JSONEncodable, Hashable {

    /** If another user is already linked to the custom ID, unlink the other user and re-link. */
    public var forceLink: Bool?
    /** Custom unique identifier for the user. */
    public var customID: String

    public init(forceLink: Bool? = nil, customID: String) {
        self.forceLink = forceLink
        self.customID = customID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case forceLink = "ForceLink"
        case customID = "CustomID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(forceLink, forKey: .forceLink)
        try container.encode(customID, forKey: .customID)
    }
}

