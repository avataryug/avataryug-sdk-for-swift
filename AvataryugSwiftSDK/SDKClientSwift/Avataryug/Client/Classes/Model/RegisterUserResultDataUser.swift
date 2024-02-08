import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct RegisterUserResultDataUser: Codable, JSONEncodable, Hashable {

    /// Gets or Sets userID
    public var userID: String?
    
    /// Gets or Sets displayName
    public var displayName: String?
    
    /// Gets or Sets createdAt
    public var createdAt: String?
    
    /// Gets or Sets verified
    public var verified: Int?

    public init(userID: String? = nil, displayName: String? = nil, createdAt: String? = nil, verified: Int? = nil) {
        self.userID = userID
        self.displayName = displayName
        self.createdAt = createdAt
        self.verified = verified
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case userID = "UserID"
        case displayName = "DisplayName"
        case createdAt = "CreatedAt"
        case verified = "Verified"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(userID, forKey: .userID)
        try container.encodeIfPresent(displayName, forKey: .displayName)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(verified, forKey: .verified)
    }
}

