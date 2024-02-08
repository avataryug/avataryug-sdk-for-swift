import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct AddVirtualCurrencyToUserRequest: Codable, JSONEncodable, Hashable {

    /** Name of the virtual currency which is to be added. */
    public var virtualCurrency: String
    /** Amount to be added to the user balance of the specified virtual currency. */
    public var amount: Int

    public init(virtualCurrency: String, amount: Int) {
        self.virtualCurrency = virtualCurrency
        self.amount = amount
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case virtualCurrency = "VirtualCurrency"
        case amount = "Amount"
    }

    // Encodable protocol methods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(virtualCurrency, forKey: .virtualCurrency)
        try container.encode(amount, forKey: .amount)
    }
}

