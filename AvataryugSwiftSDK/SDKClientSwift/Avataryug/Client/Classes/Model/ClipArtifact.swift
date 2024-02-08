import Foundation

struct ClipArtifact : Codable
{
    /// Gets or Sets device
    public var device : Int = 0
    
    /// Gets or Sets format
    public var format : Int = 0
    
    /// Gets or Sets characterpose
    public var characterpose :Int = 0
    
    /// Gets or Sets normals
    public var normals :Int = 0
    
    /// Gets or Sets mesh_url
    public var mesh_url :String = ""
    
    /// Gets or Sets selected
    public var selected :Bool = false
    
    init(device: Int, format: Int, characterpose: Int, normals: Int, mesh_url: String, selected: Bool) {
        self.device = device
        self.format = format
        self.characterpose = characterpose
        self.normals = normals
        self.mesh_url = mesh_url
        self.selected = selected
    }
    
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case device = "device"
        case format = "format"
        case characterpose = "characterpose"
        case normals = "normals"
        case mesh_url = "mesh_url"
        case selected = "selected"
    }
    
    
    ///Encodable protocol methods
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.device, forKey: .device)
        try container.encode(self.format, forKey: .format)
        try container.encode(self.characterpose, forKey: .characterpose)
        try container.encode(self.normals, forKey: .normals)
        try container.encode(self.mesh_url, forKey: .mesh_url)
        try container.encode(self.selected, forKey: .selected)
    }
    
    
}
