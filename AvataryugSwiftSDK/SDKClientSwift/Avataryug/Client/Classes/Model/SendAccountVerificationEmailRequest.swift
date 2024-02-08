import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SendAccountVerificationEmailRequest: Codable, JSONEncodable, Hashable {

    /** Email address which is being verified. */
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

