import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ConfirmPurchaseResultData: Codable, JSONEncodable, Hashable {

    ///Get or set owner
    public var owner: String?
    
    ///Get or set TransactionID
    public var transactionID: String?
    
    ///Get or set PaymentProvider
    public var paymentProvider: String?
    
    ///Get or set TransactionStatus
    public var transactionStatus: String?
    
    ///Get or set InstanceID
    public var instanceID: String?
    
    ///Get or set InstanceType
    public var instanceType: String?
    
    ///Get or set Metadata
    public var metadata: String?
    
    ///Get or set CurrencyCode
    public var currencyCode: String?
    
    ///Get or set CurrencyAmount
    public var currencyAmount: String?
    
    ///Get or set CurrencyAmountUsd
    public var currencyAmountUsd: Int?
    
    ///Get or set ID
    public var ID: String?

    public init(owner: String? = nil, transactionID: String? = nil, paymentProvider: String? = nil, transactionStatus: String? = nil, instanceID: String? = nil, instanceType: String? = nil, metadata: String? = nil, currencyCode: String? = nil, currencyAmount: String? = nil, currencyAmountUsd: Int? = nil, ID: String? = nil) {
        self.owner = owner
        self.transactionID = transactionID
        self.paymentProvider = paymentProvider
        self.transactionStatus = transactionStatus
        self.instanceID = instanceID
        self.instanceType = instanceType
        self.metadata = metadata
        self.currencyCode = currencyCode
        self.currencyAmount = currencyAmount
        self.currencyAmountUsd = currencyAmountUsd
        self.ID = ID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case owner = "Owner"
        case transactionID = "TransactionID"
        case paymentProvider = "PaymentProvider"
        case transactionStatus = "TransactionStatus"
        case instanceID = "InstanceID"
        case instanceType = "InstanceType"
        case metadata = "Metadata"
        case currencyCode = "CurrencyCode"
        case currencyAmount = "CurrencyAmount"
        case currencyAmountUsd = "CurrencyAmountUsd"
        case ID = "ID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(owner, forKey: .owner)
        try container.encodeIfPresent(transactionID, forKey: .transactionID)
        try container.encodeIfPresent(paymentProvider, forKey: .paymentProvider)
        try container.encodeIfPresent(transactionStatus, forKey: .transactionStatus)
        try container.encodeIfPresent(instanceID, forKey: .instanceID)
        try container.encodeIfPresent(instanceType, forKey: .instanceType)
        try container.encodeIfPresent(metadata, forKey: .metadata)
        try container.encodeIfPresent(currencyCode, forKey: .currencyCode)
        try container.encodeIfPresent(currencyAmount, forKey: .currencyAmount)
        try container.encodeIfPresent(currencyAmountUsd, forKey: .currencyAmountUsd)
        try container.encodeIfPresent(ID, forKey: .ID)
    }
}

