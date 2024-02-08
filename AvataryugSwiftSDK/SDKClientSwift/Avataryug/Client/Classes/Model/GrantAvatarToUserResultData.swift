import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GrantAvatarToUserResultData: Codable, JSONEncodable, Hashable {

    ///Get or Set AvatarID
    public var avatarID: String?
    
    ///Get or Set AvatarUrl
    public var avatarUrl: String?
    
    ///Get or Set ThumbUrl
    public var thumbUrl: String?
    
    ///Get or Set AvatarData
    public var avatarData: String?

    public init(avatarID: String? = nil, avatarUrl: String? = nil, thumbUrl: String? = nil, avatarData: String? = nil) {
        self.avatarID = avatarID
        self.avatarUrl = avatarUrl
        self.thumbUrl = thumbUrl
        self.avatarData = avatarData
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case avatarID = "AvatarID"
        case avatarUrl = "AvatarUrl"
        case thumbUrl = "ThumbUrl"
        case avatarData = "AvatarData"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(avatarID, forKey: .avatarID)
        try container.encodeIfPresent(avatarUrl, forKey: .avatarUrl)
        try container.encodeIfPresent(thumbUrl, forKey: .thumbUrl)
        try container.encodeIfPresent(avatarData, forKey: .avatarData)
    }
}

