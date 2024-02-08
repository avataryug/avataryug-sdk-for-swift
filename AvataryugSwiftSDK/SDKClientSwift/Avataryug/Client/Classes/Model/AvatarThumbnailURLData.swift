import Foundation

struct AvatarThumbnailURLData: Codable
   {
    
    /// Get or set Platform
    public var  Platform: String?
    
    /// Get or set ImageURL
    public var  ImageURL: String?
    
    public init( Platform: String?, ImageURL: String?) {
        self.Platform = Platform
        self.ImageURL = ImageURL
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case Platform = "Platform"
        case ImageURL = "ImageURL"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(Platform, forKey: .Platform)
        try container.encodeIfPresent(ImageURL, forKey: .ImageURL)
    }
}
