import Foundation

struct ThreeDArtifact : Codable , Hashable
{
    /// Gets or Sets device
    let device: Int?
    
    /// Gets or Sets format
    let format: Int?
    
    /// Gets or Sets lod
    let lod: Int?
    
    /// Gets or Sets normals
    let normals: Int?
    
    /// Gets or Sets texture_size
    let texture_size: Int?
    
    
    /// Gets or Sets mesh_url
    let url: String?
    
    
    public init( device: Int? = nil,format: Int? = nil, lod: Int? = nil, url: String? = nil, normals: Int? = nil,  texture_size: Int? = nil) {
        self.device = device
        self.format = format
        self.lod = lod
        self.url = url
        self.normals = normals
        self.texture_size = texture_size
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case device = "device"
        case format = "format"
        case lod = "lod"
        case url = "url"
        case normals = "normals"
        case texture_size = "texture_size"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(device, forKey: .device)
        try container.encodeIfPresent(format, forKey: .format)
        try container.encodeIfPresent(lod, forKey: .lod)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(normals, forKey: .normals)
        try container.encodeIfPresent(texture_size, forKey: .texture_size)
    }
}
