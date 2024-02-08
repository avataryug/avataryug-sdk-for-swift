import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetUsersAllAvatarsResultDataInner: Codable, JSONEncodable, Hashable {

    ///Get or Set AvatarID
    public var avatarID: String
    
    ///Get or Set AvatarUrl
    public var avatarUrl: String
    
    ///Get or Set ThumbUrl
    public var thumbUrl: String
    
    ///Get or Set AvatarData
    public var avatarData: String

    public init(avatarID: String, avatarUrl: String, thumbUrl: String, avatarData: String) {
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
        try container.encode(avatarID, forKey: .avatarID)
        try container.encode(avatarUrl, forKey: .avatarUrl)
        try container.encode(thumbUrl, forKey: .thumbUrl)
        try container.encode(avatarData, forKey: .avatarData)
    }
}

