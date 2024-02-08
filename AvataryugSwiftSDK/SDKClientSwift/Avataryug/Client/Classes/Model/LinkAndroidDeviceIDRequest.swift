import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LinkAndroidDeviceIDRequest: Codable, JSONEncodable, Hashable {

    /** If another user is already linked to the device, unlink the other user and re-link. */
    public var forceLink: Bool?
    /** Android device identifier for the user's device. */
    public var androidDeviceID: String

    public init(forceLink: Bool? = nil, androidDeviceID: String) {
        self.forceLink = forceLink
        self.androidDeviceID = androidDeviceID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case forceLink = "ForceLink"
        case androidDeviceID = "AndroidDeviceID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(forceLink, forKey: .forceLink)
        try container.encode(androidDeviceID, forKey: .androidDeviceID)
    }
}

