import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LinkGoogleAccountRequest: Codable, JSONEncodable, Hashable {

    /** If another user is already linked to the account, unlink the other user and re-link. If the current user is already linked, link both accounts. */
    public var forceLink: Bool?
    /** Google ID provided by Google. */
    public var googleID: String?
    /** Server authentication code obtained on the client by calling getServerAuthCode() (https://developers.google.com/identity/sign-in/android/offline-access) from Google Play for the user. */
    public var googleServerAuthCode: String?

    public init(forceLink: Bool? = nil, googleID: String? = nil, googleServerAuthCode: String? = nil) {
        self.forceLink = forceLink
        self.googleID = googleID
        self.googleServerAuthCode = googleServerAuthCode
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case forceLink = "ForceLink"
        case googleID = "GoogleID"
        case googleServerAuthCode = "GoogleServerAuthCode"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(forceLink, forKey: .forceLink)
        try container.encodeIfPresent(googleID, forKey: .googleID)
        try container.encodeIfPresent(googleServerAuthCode, forKey: .googleServerAuthCode)
    }
}

