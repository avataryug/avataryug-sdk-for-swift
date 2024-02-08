import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LinkFacebookAccountRequest: Codable, JSONEncodable, Hashable {

    /** If another user is already linked to the account, unlink the other user and re-link. */
    public var forceLink: Bool?
    /** Unique identifier from Facebook for the user. */
    public var accessToken: String?
    /** Facebook ID provided by Facebook. */
    public var facebookID: String

    public init(forceLink: Bool? = nil, accessToken: String? = nil, facebookID: String) {
        self.forceLink = forceLink
        self.accessToken = accessToken
        self.facebookID = facebookID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case forceLink = "ForceLink"
        case accessToken = "AccessToken"
        case facebookID = "FacebookID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(forceLink, forKey: .forceLink)
        try container.encodeIfPresent(accessToken, forKey: .accessToken)
        try container.encode(facebookID, forKey: .facebookID)
    }
}

