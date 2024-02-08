import Foundation

struct UserAllAvatar: Codable
{
    /// Gets or Sets avatarID
    public var avatarID: String?
    
    /// Gets or Sets avatarUrl
    public var avatarUrl: [AvatarMeshURLData]?
    
    /// Gets or Sets thumbUrl
    public var thumbUrl: [AvatarThumbnailURLData]?
    
    /// Gets or Sets avatardata
    public var avatardata : AvatarData?
    
    public init( avatarID: String?, avatarUrl: [AvatarMeshURLData]?, thumbUrl: [AvatarThumbnailURLData]?, avatardata : AvatarData?) {
        self.avatarID = avatarID
        self.avatarUrl = avatarUrl
        self.thumbUrl = thumbUrl
        self.avatardata = avatardata
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case avatarID = "avatarID"
        case avatarUrl = "avatarUrl"
        case thumbUrl = "thumbUrl"
        case avatardata = "avatardata"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(avatarID, forKey: .avatarID)
        try container.encodeIfPresent(avatarUrl, forKey: .avatarUrl)
        try container.encodeIfPresent(thumbUrl, forKey: .thumbUrl)
        try container.encodeIfPresent(avatardata, forKey: .avatardata)
    }
}
