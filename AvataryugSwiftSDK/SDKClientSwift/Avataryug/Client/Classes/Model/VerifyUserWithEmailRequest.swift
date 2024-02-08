import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct VerifyUserWithEmailRequest: Codable, JSONEncodable, Hashable {

    /** Unique AvatarYug assigned ID of the user on whom the operation will be performed. */
    public var userID: String
    /** Verification Code received on email. */
    public var verificationCode: String

    public init(userID: String, verificationCode: String) {
        self.userID = userID
        self.verificationCode = verificationCode
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case userID = "UserID"
        case verificationCode = "VerificationCode"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userID, forKey: .userID)
        try container.encode(verificationCode, forKey: .verificationCode)
    }
}

