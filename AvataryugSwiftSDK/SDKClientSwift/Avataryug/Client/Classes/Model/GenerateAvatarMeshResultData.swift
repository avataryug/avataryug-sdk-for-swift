import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GenerateAvatarMeshResultData: Codable, JSONEncodable, Hashable {

    // Get or Set platform
    public var platform: String?
    
    //Get or Set meshurl
    public var meshURL: String?

    public init(platform: String? = nil, meshURL: String? = nil) {
        self.platform = platform
        self.meshURL = meshURL
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case platform = "Platform"
        case meshURL = "MeshURL"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(platform, forKey: .platform)
        try container.encodeIfPresent(meshURL, forKey: .meshURL)
    }
}

