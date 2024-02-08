import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GrantAvatarToUserRequest: Codable, JSONEncodable, Hashable {

    ///Get or Set UserID
    public var userID: String?
    
    ///Get or Set AvatarUrl
    public var avatarUrl: String?
    
    ///Get or Set ThumbUrl
    public var thumbUrl: String?
    
    ///Get or Set AvatarData
    public var avatarData: String?

    public init(userID: String? = nil, avatarUrl: String? = nil, thumbUrl: String? = nil, avatarData: String? = nil) {
        self.userID = userID
        self.avatarUrl = avatarUrl
        self.thumbUrl = thumbUrl
        self.avatarData = avatarData
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case userID = "UserID"
        case avatarUrl = "AvatarUrl"
        case thumbUrl = "ThumbUrl"
        case avatarData = "AvatarData"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(userID, forKey: .userID)
        try container.encodeIfPresent(avatarUrl, forKey: .avatarUrl)
        try container.encodeIfPresent(thumbUrl, forKey: .thumbUrl)
        try container.encodeIfPresent(avatarData, forKey: .avatarData)
    }
}

