import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UpdateImageAvatarUrlRequest: Codable, JSONEncodable, Hashable {

    /** Avatar Image Url for the user. */
    public var imageUrl: String

    public init(imageUrl: String) {
        self.imageUrl = imageUrl
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case imageUrl = "ImageUrl"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(imageUrl, forKey: .imageUrl)
    }
}

