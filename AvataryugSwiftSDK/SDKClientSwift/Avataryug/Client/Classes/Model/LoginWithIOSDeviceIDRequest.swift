import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LoginWithIOSDeviceIDRequest: Codable, JSONEncodable, Hashable {

    /** iOS device identifier for the user's device. */
    public var iOSDeviceID: String
    /** Automatically create a AvatarYug account if one is not currently linked to this ID. */
    public var createAccount: Bool?

    public init(iOSDeviceID: String, createAccount: Bool? = nil) {
        self.iOSDeviceID = iOSDeviceID
        self.createAccount = createAccount
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case iOSDeviceID = "IOSDeviceID"
        case createAccount = "CreateAccount"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(iOSDeviceID, forKey: .iOSDeviceID)
        try container.encodeIfPresent(createAccount, forKey: .createAccount)
    }
}

