import Foundation

struct AvatarMeshURLData : Codable
{
    /// Get or set Platform
      public var Platform: String?
    
    /// Get or set MeshURL
      public var MeshURL: String?
    
    public init( Platform: String?, MeshURL: String?) {
        self.Platform = Platform
        self.MeshURL = MeshURL
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case Platform = "Platform"
        case MeshURL = "MeshURL"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(Platform, forKey: .Platform)
        try container.encodeIfPresent(MeshURL, forKey: .MeshURL)
    }
}
