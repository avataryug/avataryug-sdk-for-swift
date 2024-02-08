import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetExpressionsResultDataInner: Codable, JSONEncodable, Hashable {

    ///Get or Set DisplayName
    public var displayName: String
    
    ///Get or Set Description
    public var description: String
    
    ///Get or Set Category
    public var category: String
    
    ///Get or Set CustomMetaData
    public var customMetaData: String
    
    ///Get or Set ThumbnailUrl
    public var thumbnailUrl: String
    
    ///Get or Set BlendshapeKeys
    public var blendshapeKeys: String
    
    ///Get or Set Tags
    public var tags: String
    
    ///Get or Set Color
    public var color: String
    
    ///Get or Set Metadata
    public var metadata: String
    
    ///Get or Set Status
    public var status: Int
    
    ///Get or Set ID
    public var ID: String

    public init(displayName: String, description: String, category: String, customMetaData: String, thumbnailUrl: String, blendshapeKeys: String, tags: String, color: String, metadata: String, status: Int, ID: String) {
        self.displayName = displayName
        self.description = description
        self.category = category
        self.customMetaData = customMetaData
        self.thumbnailUrl = thumbnailUrl
        self.blendshapeKeys = blendshapeKeys
        self.tags = tags
        self.color = color
        self.metadata = metadata
        self.status = status
        self.ID = ID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case displayName = "DisplayName"
        case description = "Description"
        case category = "Category"
        case customMetaData = "CustomMetaData"
        case thumbnailUrl = "ThumbnailUrl"
        case blendshapeKeys = "BlendshapeKeys"
        case tags = "Tags"
        case color = "Color"
        case metadata = "Metadata"
        case status = "Status"
        case ID = "ID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(displayName, forKey: .displayName)
        try container.encode(description, forKey: .description)
        try container.encode(category, forKey: .category)
        try container.encode(customMetaData, forKey: .customMetaData)
        try container.encode(thumbnailUrl, forKey: .thumbnailUrl)
        try container.encode(blendshapeKeys, forKey: .blendshapeKeys)
        try container.encode(tags, forKey: .tags)
        try container.encode(color, forKey: .color)
        try container.encode(metadata, forKey: .metadata)
        try container.encode(status, forKey: .status)
        try container.encode(ID, forKey: .ID)
    }
}

