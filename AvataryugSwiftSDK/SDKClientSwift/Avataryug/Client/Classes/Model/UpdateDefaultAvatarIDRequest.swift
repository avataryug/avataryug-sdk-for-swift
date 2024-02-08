import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UpdateDefaultAvatarIDRequest: Codable, JSONEncodable, Hashable {

    /** ID of the Avatar which needs to be set as Default */
    public var defaultAvatarID: String

    public init(defaultAvatarID: String) {
        self.defaultAvatarID = defaultAvatarID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case defaultAvatarID = "DefaultAvatarID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(defaultAvatarID, forKey: .defaultAvatarID)
    }
}

