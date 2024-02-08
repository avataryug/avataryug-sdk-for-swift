import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ConfirmPurchaseRequest: Codable, JSONEncodable, Hashable {

    /** ID of Transaction. */
    public var transactionID: String

    public init(transactionID: String) {
        self.transactionID = transactionID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case transactionID = "TransactionID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(transactionID, forKey: .transactionID)
    }
}

