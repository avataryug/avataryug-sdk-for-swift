import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct RegisterUserRequest: Codable, JSONEncodable, Hashable {

    /** User email address attached to their account. */
    public var emailID: String
    /** Password for the AvatarYug account (6-100 characters). */
    public var password: String
    /** An optional parameter for setting the display name for this Project (3-25 characters). */
    public var displayName: String?

    public init(emailID: String, password: String, displayName: String? = nil) {
        self.emailID = emailID
        self.password = password
        self.displayName = displayName
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case emailID = "EmailID"
        case password = "Password"
        case displayName = "DisplayName"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(emailID, forKey: .emailID)
        try container.encode(password, forKey: .password)
        try container.encodeIfPresent(displayName, forKey: .displayName)
    }
}

