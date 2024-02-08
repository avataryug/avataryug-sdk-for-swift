import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LoginWithCustomIDRequest: Codable, JSONEncodable, Hashable {

    /** Custom unique identifier for the user sent from the client. */
    public var customID: String
    /** Automatically create a AvatarYug account if one is not currently linked to this ID. */
    public var createAccount: Bool?

    public init(customID: String, createAccount: Bool? = nil) {
        self.customID = customID
        self.createAccount = createAccount
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case customID = "CustomID"
        case createAccount = "CreateAccount"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(customID, forKey: .customID)
        try container.encodeIfPresent(createAccount, forKey: .createAccount)
    }
}

