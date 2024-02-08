import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LoginWithEmailAddressRequest: Codable, JSONEncodable, Hashable {

    /** Email address for the account. */
    public var emailID: String
    /** Password for the AvatarYug account (6-100 characters) */
    public var password: String

    public init(emailID: String, password: String) {
        self.emailID = emailID
        self.password = password
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case emailID = "EmailID"
        case password = "Password"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(emailID, forKey: .emailID)
        try container.encode(password, forKey: .password)
    }
}

