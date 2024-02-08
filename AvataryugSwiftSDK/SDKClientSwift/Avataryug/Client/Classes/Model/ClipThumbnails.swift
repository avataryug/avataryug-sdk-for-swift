import Foundation

struct ClipThumbnails : Codable
{
    ///Get or Set Device
    public var device : Int = 0
    
    ///Get or Set texture_size
    public var texture_size : Int = 0
    
    ///Get or Set thumbnail_url
    public var thumbnail_url :String = ""
    
    public init(device: Int, texture_size: Int, thumbnail_url: String) {
        self.device = device
        self.texture_size = texture_size
        self.thumbnail_url = thumbnail_url
    }
    
    public enum CodingKeys: CodingKey {
        case device
        case texture_size
        case thumbnail_url
    }
    
    ///Encodable protocol methods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.device, forKey: .device)
        try container.encode(self.texture_size, forKey: .texture_size)
        try container.encode(self.thumbnail_url, forKey: .thumbnail_url)
    }
}
