import Foundation

struct AvatarClip : Codable
{
    ///Get or set clip displayname
    public var displayName: String = ""
    
    ///Get or set clip description
    public var description: String = ""
    
    ///Get or set clip category
    public var category: String = ""
    
    ///Get or set clip customMetaData
    public var customMetaData: String = ""
    
    ///Get or set clip thumbnailsUrl
    public var thumbnailsUrl: [ClipThumbnails] = []
    
    ///Get or set clip artifacts
    public var artifacts: [ClipArtifact] = []
    
    ///Get or set clip tags
    public var tags: String = ""
    
    ///Get or set clip color
    public var color: String = ""
    
    ///Get or set clip metadata
    public var metadata: String = ""
    
    ///Get or set clip status
    public var status: Int = 0
    
    ///Get or set clip clipType
    public var clipType: Int = 0
    
    ///Get or set clip ID
    public var ID: String = ""
    
    ///Get or set clip ClipTemplateID
    public var ClipTemplateID: String = ""
    
    public init(displayName: String, description: String, category: String, customMetaData: String, thumbnailsUrl: [ClipThumbnails], artifacts: [ClipArtifact], tags: String, color: String, metadata: String, status: Int, clipType: Int, ID: String, ClipTemplateID: String) {
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
        self.ClipTemplateID = ClipTemplateID
    }
    
   public enum CodingKeys:  String, CodingKey, CaseIterable  {
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
        case ClipTemplateID = "ClipTemplateId"
    }
    
    // Encodable protocol method
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.displayName, forKey: .displayName)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.category, forKey: .category)
        try container.encode(self.customMetaData, forKey: .customMetaData)
        try container.encode(self.thumbnailsUrl, forKey: .thumbnailsUrl)
        try container.encode(self.artifacts, forKey: .artifacts)
        try container.encode(self.tags, forKey: .tags)
        try container.encode(self.color, forKey: .color)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.clipType, forKey: .clipType)
        try container.encode(self.ID, forKey: .ID)
        try container.encode(self.ClipTemplateID, forKey: .ClipTemplateID)
    }
    
}
