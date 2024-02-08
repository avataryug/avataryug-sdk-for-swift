import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SendAccountRecoveryEmailRequset: Codable, JSONEncodable, Hashable {

    /** User's email address attached to their account. */
    public var emailID: String

    public init(emailID: String) {
        self.emailID = emailID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case emailID = "EmailID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(emailID, forKey: .emailID)
    }
}

