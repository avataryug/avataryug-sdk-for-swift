import Foundation

struct ExpressionThumbnailUrl :Codable
{
    /// Gets or Sets device
    var  device:Int = 0
    
    /// Gets or Sets textureLODSize
    var textureLODSize:Int = 0
    
    /// Gets or Sets thumbnail_url
    var thumbnail_url:String = ""
    
    /// Gets or Sets selected
    var  selected:Bool = false
    
    public init(device: Int, textureLODSize: Int, thumbnail_url: String, selected: Bool) {
        self.device = device
        self.textureLODSize = textureLODSize
        self.thumbnail_url = thumbnail_url
        self.selected = selected
    }
    
    public enum CodingKeys: String,CodingKey,CaseIterable{
        case device = "device"
        case textureLODSize = "textureLODSize"
        case thumbnail_url = "thumbnail_url"
        case selected = "selected"
    }
    
    ///Encodable protocol methods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.device, forKey: .device)
        try container.encode(self.textureLODSize, forKey: .textureLODSize)
        try container.encode(self.thumbnail_url, forKey: .thumbnail_url)
        try container.encode(self.selected, forKey: .selected)
    }
}
