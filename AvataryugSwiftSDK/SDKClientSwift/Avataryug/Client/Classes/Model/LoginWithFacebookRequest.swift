import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LoginWithFacebookRequest: Codable, JSONEncodable, Hashable {

    /** Identifier provided by Facebook for this users FacebookID. */
    public var facebookID: String
    /** Unique identifier from Facebook for the user. */
    public var fbAccessToken: String
    /** Automatically create a AvatarYug account if one is not currently linked to this ID. */
    public var createAccount: Bool?

    public init(facebookID: String, fbAccessToken: String, createAccount: Bool? = nil) {
        self.facebookID = facebookID
        self.fbAccessToken = fbAccessToken
        self.createAccount = createAccount
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case facebookID = "FacebookID"
        case fbAccessToken = "FbAccessToken"
        case createAccount = "CreateAccount"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(facebookID, forKey: .facebookID)
        try container.encode(fbAccessToken, forKey: .fbAccessToken)
        try container.encodeIfPresent(createAccount, forKey: .createAccount)
    }
}

