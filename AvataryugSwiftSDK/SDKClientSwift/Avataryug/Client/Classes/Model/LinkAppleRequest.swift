import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LinkAppleRequest: Codable, JSONEncodable, Hashable {

    /** If another user is already linked to a specific Apple account, unlink the other user and re-link. */
    public var forceLink: Bool?
    /** Apple ID provided by Apple. */
    public var appleID: String
    /** The JSON Web token (JWT) returned by Apple after login. Represented as the identityToken field in the authorization credential payload. Used to validate the request and find the user ID (Apple subject) to link with. */
    public var identityToken: String?

    public init(forceLink: Bool? = nil, appleID: String, identityToken: String? = nil) {
        self.forceLink = forceLink
        self.appleID = appleID
        self.identityToken = identityToken
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case forceLink = "ForceLink"
        case appleID = "AppleID"
        case identityToken = "IdentityToken"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(forceLink, forKey: .forceLink)
        try container.encode(appleID, forKey: .appleID)
        try container.encodeIfPresent(identityToken, forKey: .identityToken)
    }
}

