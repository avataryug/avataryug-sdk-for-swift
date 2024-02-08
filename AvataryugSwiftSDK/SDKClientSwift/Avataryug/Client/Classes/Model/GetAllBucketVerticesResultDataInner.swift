import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetAllBucketVerticesResultDataInner: Codable, JSONEncodable, Hashable {

    ///Get or Set BucketName
    public var bucketName: String
    
    ///Get or Set MainCatID
    public var mainCatID: String
    
    ///Get or Set Platform
    public var platform: String
    
    ///Get or Set VertexArray
    public var vertexArray: String
    
    ///Get or Set Meta
    public var meta: String
    
    ///Get or Set ID
    public var ID: String

    public init(bucketName: String, mainCatID: String, platform: String, vertexArray: String, meta: String, ID: String) {
        self.bucketName = bucketName
        self.mainCatID = mainCatID
        self.platform = platform
        self.vertexArray = vertexArray
        self.meta = meta
        self.ID = ID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case bucketName = "BucketName"
        case mainCatID = "MainCatID"
        case platform = "Platform"
        case vertexArray = "VertexArray"
        case meta = "Meta"
        case ID = "ID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(bucketName, forKey: .bucketName)
        try container.encode(mainCatID, forKey: .mainCatID)
        try container.encode(platform, forKey: .platform)
        try container.encode(vertexArray, forKey: .vertexArray)
        try container.encode(meta, forKey: .meta)
        try container.encode(ID, forKey: .ID)
    }
}

