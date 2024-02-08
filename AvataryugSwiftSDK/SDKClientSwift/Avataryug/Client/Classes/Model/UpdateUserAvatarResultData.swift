import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UpdateUserAvatarResultData: Codable, JSONEncodable, Hashable {

    /// Gets or Sets avatarID
    public var avatarID: String?
    
    /// Gets or Sets displayID
    public var displayID: String?
    
    /// Gets or Sets avatarUrl
    public var avatarUrl: String?
    
    /// Gets or Sets thumbUrl
    public var thumbUrl: String?

    public init(avatarID: String? = nil, displayID: String? = nil, avatarUrl: String? = nil, thumbUrl: String? = nil) {
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
        try container.encodeIfPresent(avatarID, forKey: .avatarID)
        try container.encodeIfPresent(displayID, forKey: .displayID)
        try container.encodeIfPresent(avatarUrl, forKey: .avatarUrl)
        try container.encodeIfPresent(thumbUrl, forKey: .thumbUrl)
    }
}

