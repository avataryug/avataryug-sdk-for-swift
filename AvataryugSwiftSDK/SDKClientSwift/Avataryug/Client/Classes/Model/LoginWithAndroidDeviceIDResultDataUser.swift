import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LoginWithAndroidDeviceIDResultDataUser: Codable, JSONEncodable, Hashable {

    /// Gets or Sets userID
    public var userID: String?
    
    /// Gets or Sets displayName
    public var displayName: String?
    
    /// Gets or Sets createdAt
    public var createdAt: String?

    public init(userID: String? = nil, displayName: String? = nil, createdAt: String? = nil) {
        self.userID = userID
        self.displayName = displayName
        self.createdAt = createdAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case userID = "UserID"
        case displayName = "DisplayName"
        case createdAt = "CreatedAt"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(userID, forKey: .userID)
        try container.encodeIfPresent(displayName, forKey: .displayName)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
    }
}

