import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GrantInstanceToUserRequestInstanceIDsInner: Codable, JSONEncodable, Hashable {

    public enum InstanceType: String, Codable, CaseIterable {
        case item = "Item"
        case bundle = "Bundle"
        case container = "Container"
    }
    /** Idenfier for the instance which needs to be granted */
    public var instanceID: String
    /** Type of the instance which needs to be granted */
    public var instanceType: InstanceType
    /** Number of quanity to be granted for the instance */
    public var quantity: Int

    public init(instanceID: String, instanceType: InstanceType, quantity: Int) {
        self.instanceID = instanceID
        self.instanceType = instanceType
        self.quantity = quantity
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case instanceID = "InstanceID"
        case instanceType = "InstanceType"
        case quantity = "Quantity"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(instanceID, forKey: .instanceID)
        try container.encode(instanceType, forKey: .instanceType)
        try container.encode(quantity, forKey: .quantity)
    }
}

