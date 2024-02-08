import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SubtractUserVirtualCurrencyRequest: Codable, JSONEncodable, Hashable {

    /** Name of the virtual currency which is to be decremented. */
    public var virtualCurrency: String
    /** Amount to be subtracted from the user balance of the specified virtual currency. */
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

