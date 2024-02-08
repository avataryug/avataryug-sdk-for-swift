import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetUserProfileResultDataDefaultAvatar: Codable, JSONEncodable, Hashable {

    ///Get or Set AvatarID
    public var avatarID: String?
    
    ///Get or Set AvatarUrl
    public var avatarUrl: String?
    
    ///Get or Set ThumbUrl
    public var thumbUrl: String?
    
    ///Get or Set AvatarData
    public var avatarData: String?
    
    ///Get or Set CreatedAt
    public var createdAt: String?

    public init(avatarID: String? = nil, avatarUrl: String? = nil, thumbUrl: String? = nil, avatarData: String? = nil, createdAt: String? = nil) {
        self.avatarID = avatarID
        self.avatarUrl = avatarUrl
        self.thumbUrl = thumbUrl
        self.avatarData = avatarData
        self.createdAt = createdAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case avatarID = "AvatarID"
        case avatarUrl = "AvatarUrl"
        case thumbUrl = "ThumbUrl"
        case avatarData = "AvatarData"
        case createdAt = "CreatedAt"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(avatarID, forKey: .avatarID)
        try container.encodeIfPresent(avatarUrl, forKey: .avatarUrl)
        try container.encodeIfPresent(thumbUrl, forKey: .thumbUrl)
        try container.encodeIfPresent(avatarData, forKey: .avatarData)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
    }
}

