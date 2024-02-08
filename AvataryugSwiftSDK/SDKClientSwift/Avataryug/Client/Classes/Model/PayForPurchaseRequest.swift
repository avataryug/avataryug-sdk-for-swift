import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct PayForPurchaseRequest: Codable, JSONEncodable, Hashable {

    /// Gets or Sets userID
    public var userID: String?
    
    /// Gets or Sets transactionID
    public var transactionID: String?
    
    /// Gets or Sets paymentProvider
    public var paymentProvider: String?
    
    /// Gets or Sets metadata
    public var metadata: String?
    
    /// Gets or Sets currencyCode
    public var currencyCode: String?

    public init(userID: String? = nil, transactionID: String? = nil, paymentProvider: String? = nil, metadata: String? = nil, currencyCode: String? = nil) {
        self.userID = userID
        self.transactionID = transactionID
        self.paymentProvider = paymentProvider
        self.metadata = metadata
        self.currencyCode = currencyCode
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case userID = "UserID"
        case transactionID = "TransactionID"
        case paymentProvider = "PaymentProvider"
        case metadata = "Metadata"
        case currencyCode = "CurrencyCode"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(userID, forKey: .userID)
        try container.encodeIfPresent(transactionID, forKey: .transactionID)
        try container.encodeIfPresent(paymentProvider, forKey: .paymentProvider)
        try container.encodeIfPresent(metadata, forKey: .metadata)
        try container.encodeIfPresent(currencyCode, forKey: .currencyCode)
    }
}

