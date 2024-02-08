import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetAllUserAvatarResultDataInner: Codable, JSONEncodable, Hashable {

    ///Get or Set AvatarID
    public var avatarID: String
    
    ///Get or Set DisplayID
    public var displayID: String
    
    ///Get or Set AvatarUrl
    public var avatarUrl: String
    
    ///Get or Set ThumbUrl
    public var thumbUrl: String

    public init(avatarID: String, displayID: String, avatarUrl: String, thumbUrl: String) {
        self.avatarID = avatarID
        self.displayID = displayID
        self.avatarUrl = avatarUrl
        self.thumbUrl = thumbUrl
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case avatarID = "AvatarID"
        case displayID = "DisplayID"
        case avatarUrl = "AvatarUrl"
        case thumbUrl = "ThumbUrl"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(avatarID, forKey: .avatarID)
        try container.encode(displayID, forKey: .displayID)
        try container.encode(avatarUrl, forKey: .avatarUrl)
        try container.encode(thumbUrl, forKey: .thumbUrl)
    }
}

