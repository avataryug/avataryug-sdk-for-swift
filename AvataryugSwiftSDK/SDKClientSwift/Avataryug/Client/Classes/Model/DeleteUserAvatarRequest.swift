import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct DeleteUserAvatarRequest: Codable, JSONEncodable, Hashable {

    /** Unique identifier for the avatar being deleted */
    public var avatarID: String

    public init(avatarID: String) {
        self.avatarID = avatarID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case avatarID = "AvatarID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(avatarID, forKey: .avatarID)
    }
}

