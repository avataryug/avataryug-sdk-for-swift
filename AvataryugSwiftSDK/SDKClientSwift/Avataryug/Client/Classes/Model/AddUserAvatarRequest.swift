import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct AddUserAvatarRequest: Codable, JSONEncodable, Hashable {

    /** Data related to the user's Avatar */
    public var avatarData: String

    public init(avatarData: String) {
        self.avatarData = avatarData
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case avatarData = "AvatarData"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(avatarData, forKey: .avatarData)
    }
}

