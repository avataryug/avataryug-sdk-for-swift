import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LoginWithAndroidDeviceIDRequest: Codable, JSONEncodable, Hashable {

    /** Android device identifier for the user's device. */
    public var androidDeviceID: String
    /** Automatically create a AvatarYug account if one is not currently linked to this ID. */
    public var createAccount: Bool?

    public init(androidDeviceID: String, createAccount: Bool? = nil) {
        self.androidDeviceID = androidDeviceID
        self.createAccount = createAccount
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case androidDeviceID = "AndroidDeviceID"
        case createAccount = "CreateAccount"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(androidDeviceID, forKey: .androidDeviceID)
        try container.encodeIfPresent(createAccount, forKey: .createAccount)
    }
}

