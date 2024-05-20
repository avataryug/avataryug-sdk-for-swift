
import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct CreateAvatarRequest: Codable, JSONEncodable, Hashable {

    public var Platform: String
    public var AvatarData: String

    public init(platform: String, avatarData: String ) {
        self.Platform = platform
        self.AvatarData = avatarData
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case Platform = "Platform"
        case AvatarData = "AvatarData"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Platform, forKey: .Platform)
        try container.encode(AvatarData, forKey: .AvatarData)
    }
}

