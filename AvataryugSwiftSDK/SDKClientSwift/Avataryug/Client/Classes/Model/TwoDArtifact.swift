import Foundation

public struct TwoDArtifact: Codable, JSONEncodable, Hashable {

    /// Gets or Sets device
    let device: Int?
    
    /// Gets or Sets format
    let format: Int?
    
    /// Gets or Sets link
    let link: String?
    
    /// Gets or Sets lod
    let lod: Int?
    
    /// Gets or Sets normals
    let normals: Int?
    
    /// Gets or Sets rig
    let rig: Int?
    
    /// Gets or Sets selected
    let selected: Bool?
    
    /// Gets or Sets textureSize
    let textureSize: Int?

    public init(device: Int? = nil, format: Int? = nil, link: String? = nil, lod: Int? = nil, normals: Int? = nil, rig: Int? = nil, selected: Bool? = nil, textureSize: Int? = nil) {
        self.device = device
        self.format = format
        self.link = link
        self.lod = lod
        self.normals = normals
        self.rig = rig
        self.selected = selected
        self.textureSize = textureSize
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case device = "device"
        case format = "format"
        case link = "link"
        case lod = "lod"
        case normals = "normals"
        case rig = "rig"
        case selected = "selected"
        case textureSize = "textureSize"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(device, forKey: .device)
        try container.encodeIfPresent(format, forKey: .format)
        try container.encodeIfPresent(link, forKey: .link)
        try container.encodeIfPresent(lod, forKey: .lod)
        try container.encodeIfPresent(normals, forKey: .normals)
        try container.encodeIfPresent(rig, forKey: .rig)
        try container.encodeIfPresent(selected, forKey: .selected)
        try container.encodeIfPresent(textureSize, forKey: .textureSize)
    }
}

