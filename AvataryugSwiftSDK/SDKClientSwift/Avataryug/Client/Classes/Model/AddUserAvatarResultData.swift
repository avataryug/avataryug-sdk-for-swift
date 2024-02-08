import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct AddUserAvatarResultData: Codable, JSONEncodable, Hashable {

    ///Gets or Sets AvatarID
    public var avatarID: String?

    public init(avatarID: String? = nil) {
        self.avatarID = avatarID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case avatarID = "AvatarID"
    }

    // Encodable protocol methods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(avatarID, forKey: .avatarID)
    }
}

