import Foundation

struct Expression: Codable
{
    /// Gets or Sets DisplayName
    var DisplayName:String = ""
    
    /// Gets or Sets Description
    var  Description:String = ""
    
    /// Gets or Sets Category
    var  Category:String = ""
    
    /// Gets or Sets CustomMetaData
    var  CustomMetaData:String = ""
    
    /// Gets or Sets Tags
    var  Tags:String = ""
    
    /// Gets or Sets Color
    var  Color:String = ""
    
    /// Gets or Sets Metadata
    var  Metadata:String = ""
    
    /// Gets or Sets Status
    var  Status:Int = 0
    
    /// Gets or Sets ID
    var  ID:String = ""
    
    /// Gets or Sets BlendshapeKeys
    var  BlendshapeKeys:[ExpressionBlendshape] = []
    
    /// Gets or Sets ThumbnailsUrl
    var  ThumbnailsUrl : [ExpressionThumbnailUrl] = []
    
    public init(DisplayName: String, Description: String, Category: String, CustomMetaData: String, Tags: String, Color: String, Metadata: String, Status: Int, ID: String, BlendshapeKeys: [ExpressionBlendshape], ThumbnailsUrl: [ExpressionThumbnailUrl]) {
        self.DisplayName = DisplayName
        self.Description = Description
        self.Category = Category
        self.CustomMetaData = CustomMetaData
        self.Tags = Tags
        self.Color = Color
        self.Metadata = Metadata
        self.Status = Status
        self.ID = ID
        self.BlendshapeKeys = BlendshapeKeys
        self.ThumbnailsUrl = ThumbnailsUrl
    }
    
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case DisplayName = "DisplayName"
        case Description = "Description"
        case Category = "Category"
        case CustomMetaData = "CustomMetaData"
        case Tags = "Tags"
        case Color = "Color"
        case Metadata = "Metadata"
        case Status = "Status"
        case ID = "ID"
        case BlendshapeKeys = "BlendshapeKeys"
        case ThumbnailsUrl = "ThumbnailsUrl"
    }
    
    
    // Encodable protocol methods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.DisplayName, forKey: .DisplayName)
        try container.encode(self.Description, forKey: .Description)
        try container.encode(self.Category, forKey: .Category)
        try container.encode(self.CustomMetaData, forKey: .CustomMetaData)
        try container.encode(self.Tags, forKey: .Tags)
        try container.encode(self.Color, forKey: .Color)
        try container.encode(self.Metadata, forKey: .Metadata)
        try container.encode(self.Status, forKey: .Status)
        try container.encode(self.ID, forKey: .ID)
        try container.encode(self.BlendshapeKeys, forKey: .BlendshapeKeys)
        try container.encode(self.ThumbnailsUrl, forKey: .ThumbnailsUrl)
    }
}
