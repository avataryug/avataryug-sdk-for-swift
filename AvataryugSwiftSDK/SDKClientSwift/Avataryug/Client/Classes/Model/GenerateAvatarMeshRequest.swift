import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GenerateAvatarMeshRequest: Codable, JSONEncodable, Hashable {

    public enum Platform: String, Codable, CaseIterable {
        case android = "Android"
        case ios = "iOS"
        case web = "Web"
        case steam = "Steam"
        case windows = "Windows"
        case meta = "Meta"
        case xbox = "Xbox"
        case playstation = "Playstation"
        case custom = "Custom"
    }
    /** Unique identifier for the generated avatar */
    public var avatarID: String
    /** Name of the platform i.e. Android, iOS */
    public var platform: Platform

    public init(avatarID: String, platform: Platform) {
        self.avatarID = avatarID
        self.platform = platform
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case avatarID = "AvatarID"
        case platform = "Platform"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(avatarID, forKey: .avatarID)
        try container.encode(platform, forKey: .platform)
    }
}

