import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetClipsByIDResultData: Codable, JSONEncodable, Hashable {

    ///Get or Set DisplayName
    public var displayName: String?
    
    ///Get or Set Description
    public var description: String?
    
    ///Get or Set Category
    public var category: String?
    
    ///Get or Set CustomMetaData
    public var customMetaData:String?
    
    ///Get or Set ThumbnailsUrl
    public var thumbnailsUrl: String?
    
    ///Get or Set Artifacts
    public var artifacts: String?
    
    ///Get or Set Tags
    public var tags: String?
    
    ///Get or Set Color
    public var color: String?
    
    ///Get or Set Metadata
    public var metadata: String?
    
    ///Get or Set Status
    public var status: Int?
    
    ///Get or Set ClipType
    public var clipType: Int?
    
    ///Get or Set ID
    public var ID: String?
    
    ///Get or Set ClipTemplateID
    public var clipTemplateID : String?

    public init(displayName: String? = nil, description: String? = nil, category: String? = nil, customMetaData: String? = nil, thumbnailsUrl: String? = nil, artifacts: String? = nil, tags: String? = nil, color: String? = nil, metadata: String? = nil, status: Int? = nil, clipType: Int? = nil, ID: String? = nil,clipTemplateID:String? = nil) {
        self.displayName = displayName
        self.description = description
        self.category = category
        self.customMetaData = customMetaData
        self.thumbnailsUrl = thumbnailsUrl
        self.artifacts = artifacts
        self.tags = tags
        self.color = color
        self.metadata = metadata
        self.status = status
        self.clipType = clipType
        self.ID = ID
        self.clipTemplateID = clipTemplateID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case displayName = "DisplayName"
        case description = "Description"
        case category = "Category"
        case customMetaData = "CustomMetaData"
        case thumbnailsUrl = "ThumbnailsUrl"
        case artifacts = "Artifacts"
        case tags = "Tags"
        case color = "Color"
        case metadata = "Metadata"
        case status = "Status"
        case clipType = "ClipType"
        case ID = "ID"
        case clipTemplateID = "ClipTemplateID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(displayName, forKey: .displayName)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(category, forKey: .category)
        try container.encodeIfPresent(customMetaData, forKey: .customMetaData)
        try container.encodeIfPresent(thumbnailsUrl, forKey: .thumbnailsUrl)
        try container.encodeIfPresent(artifacts, forKey: .artifacts)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(color, forKey: .color)
        try container.encodeIfPresent(metadata, forKey: .metadata)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(clipType, forKey: .clipType)
        try container.encodeIfPresent(ID, forKey: .ID)
        try container.encodeIfPresent(clipTemplateID, forKey: .clipTemplateID)
    }
}
