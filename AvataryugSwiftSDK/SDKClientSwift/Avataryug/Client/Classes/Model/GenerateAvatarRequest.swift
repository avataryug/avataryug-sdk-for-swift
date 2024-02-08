import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GenerateAvatarRequest: Codable, JSONEncodable, Hashable {

    ///Get or Set Meta
    public var meta: String?
    
    ///Get or Set Colors
    public var colors: String?
    
    ///Get or Set BlendShapes
    public var blendShapes: String?
    
    ///Get or Set BucketData
    public var bucketData: String?

    public init(meta: String? = nil, colors: String? = nil, blendShapes: String? = nil, bucketData: String? = nil) {
        self.meta = meta
        self.colors = colors
        self.blendShapes = blendShapes
        self.bucketData = bucketData
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case meta = "Meta"
        case colors = "Colors"
        case blendShapes = "BlendShapes"
        case bucketData = "BucketData"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(meta, forKey: .meta)
        try container.encodeIfPresent(colors, forKey: .colors)
        try container.encodeIfPresent(blendShapes, forKey: .blendShapes)
        try container.encodeIfPresent(bucketData, forKey: .bucketData)
    }
}

