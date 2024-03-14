import Foundation

public struct TwoDArtifact: Codable, JSONEncodable, Hashable {

    /// Gets or Sets device
    let device: Int?
    
    /// Gets or Sets format
    let format: Int?
    
    /// Gets or Sets lod
    let lod: Int?
    
    /// Gets or Sets normals
    let normals: Int?
    
    /// Gets or Sets textureSize
    let textureSize: Int?
    
    /// Gets or Sets link
    let url: String?
    

    public init(device: Int? = nil, format: Int? = nil, url: String? = nil, lod: Int? = nil, normals: Int? = nil,   textureSize: Int? = nil) {
        self.device = device
        self.format = format
        self.url = url
        self.lod = lod
        self.normals = normals
        self.textureSize = textureSize
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case device = "device"
        case format = "format"
        case url = "url"
        case lod = "lod"
        case normals = "normals"
        case textureSize = "textureSize"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(device, forKey: .device)
        try container.encodeIfPresent(format, forKey: .format)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(lod, forKey: .lod)
        try container.encodeIfPresent(normals, forKey: .normals)
        try container.encodeIfPresent(textureSize, forKey: .textureSize)
    }
}

