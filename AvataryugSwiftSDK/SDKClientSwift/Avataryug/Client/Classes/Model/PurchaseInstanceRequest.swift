import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct PurchaseInstanceRequest: Codable, JSONEncodable, Hashable {

    public enum InstanceType: String, Codable, CaseIterable {
        case item = "Item"
        case bundle = "Bundle"
        case container = "Container"
    }
    /** Unique identifier of the item to purchase. */
    public var instanceID: String
    /** Type of the instance i.e item,bundle,container. */
    public var instanceType: InstanceType
    /** Price the client expects to pay for the item. */
    public var price: Int
    /** Virtual currency to use to purchase the item. */
    public var virtualCurrency: String
    /** Store to buy this item through. If not set, prices default to those in the items catalog. */
    public var storeID: String?

    public init(instanceID: String, instanceType: InstanceType, price: Int, virtualCurrency: String, storeID: String? = nil) {
        self.instanceID = instanceID
        self.instanceType = instanceType
        self.price = price
        self.virtualCurrency = virtualCurrency
        self.storeID = storeID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case instanceID = "InstanceID"
        case instanceType = "InstanceType"
        case price = "Price"
        case virtualCurrency = "VirtualCurrency"
        case storeID = "StoreID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(instanceID, forKey: .instanceID)
        try container.encode(instanceType, forKey: .instanceType)
        try container.encode(price, forKey: .price)
        try container.encode(virtualCurrency, forKey: .virtualCurrency)
        try container.encodeIfPresent(storeID, forKey: .storeID)
    }
}

