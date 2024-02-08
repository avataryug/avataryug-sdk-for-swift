import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UnlockContainerInstanceRequest: Codable, JSONEncodable, Hashable {

    /** ItemInstanceId of the container to unlock. */
    public var containerInstanceID: String
    /** ItemID (from Economy) of the key that will be consumed by unlocking this container. */
    public var keyInstanceID: String

    public init(containerInstanceID: String, keyInstanceID: String) {
        self.containerInstanceID = containerInstanceID
        self.keyInstanceID = keyInstanceID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case containerInstanceID = "ContainerInstanceID"
        case keyInstanceID = "KeyInstanceID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(containerInstanceID, forKey: .containerInstanceID)
        try container.encode(keyInstanceID, forKey: .keyInstanceID)
    }
}

