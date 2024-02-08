import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetExpressionByIDResultData: Codable, JSONEncodable, Hashable {

    ///Get or Set DisplayName
    public var displayName: String?
    
    ///Get or Set Description
    public var description: String?
    
    ///Get or Set Category
    public var category: String?
    
    ///Get or Set CustomMetaData
    public var customMetaData: String?
    
    ///Get or Set ThumbnailUrl
    public var thumbnailUrl: String?
    
    ///Get or Set BlendshapeKeys
    public var blendshapeKeys: String?
    
    ///Get or Set Tags
    public var tags: String?
    
    ///Get or Set Color
    public var color: String?
    
    ///Get or Set Metadata
    public var metadata: String?
    
    ///Get or Set Status
    public var status: Int?
    
    ///Get or Set ID
    public var ID: String?

    public init(displayName: String? = nil, description: String? = nil, category: String? = nil, customMetaData: String? = nil, thumbnailUrl: String? = nil, blendshapeKeys: String? = nil, tags: String? = nil, color: String? = nil, metadata: String? = nil, status: Int? = nil, ID: String? = nil) {
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
        try container.encodeIfPresent(displayName, forKey: .displayName)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(category, forKey: .category)
        try container.encodeIfPresent(customMetaData, forKey: .customMetaData)
        try container.encodeIfPresent(thumbnailUrl, forKey: .thumbnailUrl)
        try container.encodeIfPresent(blendshapeKeys, forKey: .blendshapeKeys)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(color, forKey: .color)
        try container.encodeIfPresent(metadata, forKey: .metadata)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(ID, forKey: .ID)
    }
}

