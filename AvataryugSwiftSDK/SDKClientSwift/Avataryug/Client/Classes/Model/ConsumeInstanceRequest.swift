import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ConsumeInstanceRequest: Codable, JSONEncodable, Hashable {

    /** Unique identier of the instance  */
    public var instanceID: String
    /** Number of uses to consume from the instance. */
    public var instanceCount: Int

    public init(instanceID: String, instanceCount: Int) {
        self.instanceID = instanceID
        self.instanceCount = instanceCount
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case instanceID = "InstanceID"
        case instanceCount = "InstanceCount"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(instanceID, forKey: .instanceID)
        try container.encode(instanceCount, forKey: .instanceCount)
    }
}

