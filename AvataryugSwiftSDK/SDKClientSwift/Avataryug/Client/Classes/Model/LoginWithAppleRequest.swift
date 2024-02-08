import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LoginWithAppleRequest: Codable, JSONEncodable, Hashable {

    /** Identifier provided by Apple for this users AppleID. */
    public var appleID: String?
    /** Automatically create a AvatarYug account if one is not currently linked to this ID. */
    public var createAccount: Bool?
    /** The JSON Web token (JWT) returned by Apple after login. Represented as the identityToken field in the authorization credential payload. */
    public var appleIdentityToken: String

    public init(appleID: String? = nil, createAccount: Bool? = nil, appleIdentityToken: String) {
        self.appleID = appleID
        self.createAccount = createAccount
        self.appleIdentityToken = appleIdentityToken
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case appleID = "AppleID"
        case createAccount = "CreateAccount"
        case appleIdentityToken = "AppleIdentityToken"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(appleID, forKey: .appleID)
        try container.encodeIfPresent(createAccount, forKey: .createAccount)
        try container.encode(appleIdentityToken, forKey: .appleIdentityToken)
    }
}

