import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UpdateUserAvatarRequest: Codable, JSONEncodable, Hashable {

    /** Identifier for the user's avatar */
    public var avatarID: String
    /** Data related to the AvatarID */
    public var avatarData: String

    public init(avatarID: String, avatarData: String) {
        self.avatarID = avatarID
        self.avatarData = avatarData
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case avatarID = "AvatarID"
        case avatarData = "AvatarData"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(avatarID, forKey: .avatarID)
        try container.encode(avatarData, forKey: .avatarData)
    }
}

