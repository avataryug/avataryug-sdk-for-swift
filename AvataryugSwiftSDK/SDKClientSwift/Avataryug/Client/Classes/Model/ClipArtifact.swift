import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ClipArtifact :Codable, JSONEncodable, Hashable
{
    /// Gets or Sets device
    public var device : Int?
    
    /// Gets or Sets format
    public var format : Int?
    
    /// Gets or Sets mesh_url
    public var url :String?
    
    
    init(device: Int? = nil, format: Int? = nil,  url: String? = nil ) {
        self.device = device
        self.format = format
        self.url = url
    }
    
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case device = "device"
        case format = "format"
        case url = "url"
    }
    
    
    ///Encodable protocol methods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.device, forKey: .device)
        try container.encode(self.format, forKey: .format)
        try container.encode(self.url, forKey: .url)
    }
    
    
}
