import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SyncAvatarsRequest: Codable, JSONEncodable, Hashable {

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
    /** Name of the platform i.e. Android, IOS */
    public var platform: Platform
    /** 3D Mesh generation is required or not */
    public var mesh: Bool
    /** Render of the image is required or not */
    public var image: Bool

    public init(platform: Platform, mesh: Bool, image: Bool) {
        self.platform = platform
        self.mesh = mesh
        self.image = image
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case platform = "Platform"
        case mesh = "Mesh"
        case image = "Image"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(platform, forKey: .platform)
        try container.encode(mesh, forKey: .mesh)
        try container.encode(image, forKey: .image)
    }
}

