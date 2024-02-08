import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ChangePasswordRequest: Codable, JSONEncodable, Hashable {

    /** Current Password of the users account. */
    public var oldPassword: String
    /** New password which needs to be updated. */
    public var newPassword: String

    public init(oldPassword: String, newPassword: String) {
        self.oldPassword = oldPassword
        self.newPassword = newPassword
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case oldPassword = "OldPassword"
        case newPassword = "NewPassword"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(oldPassword, forKey: .oldPassword)
        try container.encode(newPassword, forKey: .newPassword)
    }
}

