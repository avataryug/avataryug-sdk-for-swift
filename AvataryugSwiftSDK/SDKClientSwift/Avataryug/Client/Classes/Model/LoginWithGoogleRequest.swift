import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LoginWithGoogleRequest: Codable, JSONEncodable, Hashable {

    /** Identifier provided by Google for this users Google ID */
    public var googleID: String
    /** OAuth 2.0 server authentication code obtained on the client by calling the getServerAuthCode() (https://developers.google.com/identity/sign-in/android/offline-access) Google client API. */
    public var googleServerAuthCode: String
    /** Automatically create a AvatarYug account if one is not currently linked to this ID. */
    public var createAccount: Bool?

    public init(googleID: String, googleServerAuthCode: String, createAccount: Bool? = nil) {
        self.googleID = googleID
        self.googleServerAuthCode = googleServerAuthCode
        self.createAccount = createAccount
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case googleID = "GoogleID"
        case googleServerAuthCode = "GoogleServerAuthCode"
        case createAccount = "CreateAccount"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(googleID, forKey: .googleID)
        try container.encode(googleServerAuthCode, forKey: .googleServerAuthCode)
        try container.encodeIfPresent(createAccount, forKey: .createAccount)
    }
}

