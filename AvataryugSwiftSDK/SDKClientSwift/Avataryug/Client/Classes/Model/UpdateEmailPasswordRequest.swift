import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UpdateEmailPasswordRequest: Codable, JSONEncodable, Hashable {

    /** User email address attached to their account */
    public var emailID: String
    /** Password for the AvatarYug account (6-100 characters) */
    public var password: String
    /** Verification Code received on email */
    public var verificationCode: String

    public init(emailID: String, password: String, verificationCode: String) {
        self.emailID = emailID
        self.password = password
        self.verificationCode = verificationCode
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case emailID = "EmailID"
        case password = "Password"
        case verificationCode = "VerificationCode"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(emailID, forKey: .emailID)
        try container.encode(password, forKey: .password)
        try container.encode(verificationCode, forKey: .verificationCode)
    }
}

