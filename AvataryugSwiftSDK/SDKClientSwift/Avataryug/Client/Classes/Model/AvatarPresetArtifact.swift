import Foundation

struct AvatarPresetArtifact
{
    ///Get or set device
    var device : Int
    
    ///Get or set format
    var format : Int
    
    /// Get or set texture_size
    var texture_size : Int
    
    /// Get or set lod
    var lod : Int
    
    /// Get or set normals
    var normals : Int
    
    /// Get or set mesh_url
    var mesh_url : String
    
    /// Get or set selected
    var selected : Bool
    
    /// Get or set meta
    var meta : String
    
    
    public init(device: Int, format: Int, texture_size: Int, lod: Int, normals: Int, mesh_url: String, selected: Bool, meta: String) {
        self.device = device
        self.format = format
        self.texture_size = texture_size
        self.lod = lod
        self.normals = normals
        self.mesh_url = mesh_url
        self.selected = selected
        self.meta = meta
    }
        
    
    public enum CodingKeys: String, CodingKey, CaseIterable
    {
        case device = "device"
        case format = "format"
        case texture_size = "texture_size"
        case lod = "lod"
        case normals = "normals"
        case mesh_url = "mesh_url"
        case selected = "selected"
        case meta = "meta"
        
    }
    
    /// Encodable protocol methods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.device, forKey: .device)
        try container.encode(self.format, forKey: .format)
        try container.encode(self.texture_size, forKey: .texture_size)
        try container.encode(self.lod, forKey: .lod)
        try container.encode(self.normals, forKey: .normals)
        try container.encodeIfPresent(self.mesh_url, forKey: .mesh_url)
        try container.encode(self.selected, forKey: .selected)
        try container.encode(self.meta, forKey: .meta)
    }
    
}
