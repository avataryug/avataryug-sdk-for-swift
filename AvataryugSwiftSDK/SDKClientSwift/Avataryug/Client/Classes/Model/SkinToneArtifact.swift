import Foundation

struct SkinToneArtifact : Codable , Hashable
{
    /// Gets or Sets body_path
    let body_path: String!
    
    /// Gets or Sets device
    let device: Int!
    
    /// Gets or Sets face_path
    let face_path: String!
    
    /// Gets or Sets selected
    let selected: Bool!
    
    /// Gets or Sets textureSize
    let textureSize: Int!
    
    public init(body_path: String? = nil, device: Int? = nil ,face_path: String! = nil, selected: Bool! = nil , textureSize: Int! = nil) {
        self.body_path = body_path
        self.device = device
        self.face_path = face_path
        self.selected = selected
        self.textureSize = textureSize
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case body_path = "body_path"
        case device = "device"
        case face_path = "face_path"
        case selected = "selected"
        case textureSize = "textureSize"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(body_path, forKey: .body_path)
        try container.encode(device, forKey: .device)
        try container.encode(face_path, forKey: .face_path)
        try container.encode(selected, forKey: .selected)
        try container.encode(textureSize, forKey: .textureSize)
    }
}
