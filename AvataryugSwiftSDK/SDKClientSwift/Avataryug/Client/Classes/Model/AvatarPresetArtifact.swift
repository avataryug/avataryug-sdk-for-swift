import Foundation

struct AvatarPresetArtifact :Codable
{

    ///Get or set device
    var device : Int
    
    ///Get or set format
    var format : Int
    
    /// Get or set lod
    var lod : Int
    
    /// Get or set normals
    var normals : Int
    
    /// Get or set texture
    var texture : Int
    
    /// Get or set texture_size
    var url : String
    


 

    
    public init(device: Int, format: Int, lod: Int,  normals: Int, texture: Int,  url: String) {
        self.device = device
        self.format = format
        self.lod = lod
        self.normals = normals
        self.texture = texture
        self.url = url
    }
        
    
    public enum CodingKeys: String, CodingKey, CaseIterable
    {
        case device = "device"
        case format = "format"
        case lod = "lod"
        case normals = "normals"
        case texture = "texture"
        case url = "url"
        
    }
    
    /// Encodable protocol methods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.device, forKey: .device)
        try container.encode(self.format, forKey: .format)
        try container.encode(self.lod, forKey: .lod)
        try container.encodeIfPresent(self.normals, forKey: .normals)
        try container.encode(self.texture, forKey: .texture)
        try container.encode(self.url, forKey: .url)
    }
    
}
