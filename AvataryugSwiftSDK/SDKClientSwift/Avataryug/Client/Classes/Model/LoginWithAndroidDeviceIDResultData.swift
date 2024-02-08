import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LoginWithAndroidDeviceIDResultData: Codable, JSONEncodable, Hashable {

    /// Gets or Sets accessToken
    public var accessToken: String?
    
    /// Gets or Sets user
    public var user: LoginWithAndroidDeviceIDResultDataUser?
    
    /// Gets or Sets linkedAccounts
    public var linkedAccounts: String?

    public init(accessToken: String? = nil, user: LoginWithAndroidDeviceIDResultDataUser? = nil, linkedAccounts: String? = nil) {
        self.accessToken = accessToken
        self.user = user
        self.linkedAccounts = linkedAccounts
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case accessToken = "AccessToken"
        case user = "User"
        case linkedAccounts = "LinkedAccounts"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(accessToken, forKey: .accessToken)
        try container.encodeIfPresent(user, forKey: .user)
        try container.encodeIfPresent(linkedAccounts, forKey: .linkedAccounts)
    }
}

