import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GenerateAvatarResultData: Codable, JSONEncodable, Hashable {

    ///Get or Set ID
    public var ID: String?
    
    ///Get or Set ThumbnailUrl
    public var thumbnailUrl: String?
    
    ///Get or Set MeshUrl
    public var meshUrl: String?

    public init(ID: String? = nil, thumbnailUrl: String? = nil, meshUrl: String? = nil) {
        self.ID = ID
        self.thumbnailUrl = thumbnailUrl
        self.meshUrl = meshUrl
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case ID = "ID"
        case thumbnailUrl = "ThumbnailUrl"
        case meshUrl = "MeshUrl"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(ID, forKey: .ID)
        try container.encodeIfPresent(thumbnailUrl, forKey: .thumbnailUrl)
        try container.encodeIfPresent(meshUrl, forKey: .meshUrl)
    }
}

