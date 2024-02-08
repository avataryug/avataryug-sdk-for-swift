import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetUserAccountInfoResultData: Codable, JSONEncodable, Hashable {

    ///Get or Set UserID
    public var userID: String?
    
    ///Get or Set DisplayName
    public var displayName: String?
    
    ///Get or Set DefaultAvatarID
    public var defaultAvatarID: String?
    
    ///Get or Set Location
    public var location: String?
    
    ///Get or Set Wallet
    public var wallet: String?
    
    ///Get or Set UpdatedAt
    public var updatedAt: String?

    public init(userID: String? = nil, displayName: String? = nil, defaultAvatarID: String? = nil, location: String? = nil, wallet: String? = nil, updatedAt: String? = nil) {
        self.userID = userID
        self.displayName = displayName
        self.defaultAvatarID = defaultAvatarID
        self.location = location
        self.wallet = wallet
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case userID = "UserID"
        case displayName = "DisplayName"
        case defaultAvatarID = "DefaultAvatarID"
        case location = "Location"
        case wallet = "Wallet"
        case updatedAt = "UpdatedAt"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(userID, forKey: .userID)
        try container.encodeIfPresent(displayName, forKey: .displayName)
        try container.encodeIfPresent(defaultAvatarID, forKey: .defaultAvatarID)
        try container.encodeIfPresent(location, forKey: .location)
        try container.encodeIfPresent(wallet, forKey: .wallet)
        try container.encodeIfPresent(updatedAt, forKey: .updatedAt)
    }
}

