import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetUserProfileResultData: Codable, JSONEncodable, Hashable {
    
    ///Get or Set ID
    public var ID: String?
    
    ///Get or Set DisplayName
    public var displayName: String?
    
    ///Get or Set DefaultAvatar
    public var defaultAvatar: GetUserProfileResultDataDefaultAvatar?
    
    ///Get or Set UpdatedAt
    public var updatedAt: String?

    public init(ID: String? = nil, displayName: String? = nil, defaultAvatar: GetUserProfileResultDataDefaultAvatar? = nil, updatedAt: String? = nil) {
        self.ID = ID
        self.displayName = displayName
        self.defaultAvatar = defaultAvatar
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case ID = "ID"
        case displayName = "DisplayName"
        case defaultAvatar = "DefaultAvatar"
        case updatedAt = "UpdatedAt"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(ID, forKey: .ID)
        try container.encodeIfPresent(displayName, forKey: .displayName)
        try container.encodeIfPresent(defaultAvatar, forKey: .defaultAvatar)
        try container.encodeIfPresent(updatedAt, forKey: .updatedAt)
    }
}

