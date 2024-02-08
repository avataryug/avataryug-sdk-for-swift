import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct RenderAvatarImageResultData: Codable, JSONEncodable, Hashable {

    /// Gets or Sets platform
    public var platform: String?
    
    /// Gets or Sets imageURL
    public var imageURL: String?

    public init(platform: String? = nil, imageURL: String? = nil) {
        self.platform = platform
        self.imageURL = imageURL
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case platform = "Platform"
        case imageURL = "ImageURL"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(platform, forKey: .platform)
        try container.encodeIfPresent(imageURL, forKey: .imageURL)
    }
}

