import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LinkIOSDeviceIDRequest: Codable, JSONEncodable, Hashable {

    /** If another user is already linked to the device, unlink the other user and re-link. */
    public var forceLink: Bool?
    /**  iOS device identifier for the user's device. */
    public var deviceID: String

    public init(forceLink: Bool? = nil, deviceID: String) {
        self.forceLink = forceLink
        self.deviceID = deviceID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case forceLink = "ForceLink"
        case deviceID = "DeviceID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(forceLink, forKey: .forceLink)
        try container.encode(deviceID, forKey: .deviceID)
    }
}

