import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetEconomyBundlesResultDataInner: Codable, JSONEncodable, Hashable {

    ///Get or Set BundleCategory
    public var bundleCategory: String
    
    ///Get or Set DisplayName
    public var displayName: String
    
    ///Get or Set Description
    public var description: String
    
    ///Get or Set VirtualCurrency
    public var virtualCurrency: String
    
    ///Get or Set RealCurrency
    public var realCurrency: Int
    
    ///Get or Set Tags
    public var tags: String
    
    ///Get or Set Entitlement
    public var entitlement: String
    
    ///Get or Set IsStackable
    public var isStackable: Int
    
    ///Get or Set BundleImageUrl
    public var bundleImageUrl: String
    
    ///Get or Set IsLimitedEdition
    public var isLimitedEdition: Int
    
    ///Get or Set LimitedEditionIntialCount
    public var limitedEditionIntialCount: Int
    
    ///Get or Set CustomMetaData
    public var customMetaData: String
    
    ///Get or Set BundleContents
    public var bundleContents: String
    
    ///Get or Set Status
    public var status: Int
    
    ///Get or Set ID
    public var ID: String

    public init(bundleCategory: String, displayName: String, description: String, virtualCurrency: String, realCurrency: Int, tags: String, entitlement: String, isStackable: Int, bundleImageUrl: String, isLimitedEdition: Int, limitedEditionIntialCount: Int, customMetaData: String, bundleContents: String, status: Int, ID: String) {
        self.bundleCategory = bundleCategory
        self.displayName = displayName
        self.description = description
        self.virtualCurrency = virtualCurrency
        self.realCurrency = realCurrency
        self.tags = tags
        self.entitlement = entitlement
        self.isStackable = isStackable
        self.bundleImageUrl = bundleImageUrl
        self.isLimitedEdition = isLimitedEdition
        self.limitedEditionIntialCount = limitedEditionIntialCount
        self.customMetaData = customMetaData
        self.bundleContents = bundleContents
        self.status = status
        self.ID = ID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case bundleCategory = "BundleCategory"
        case displayName = "DisplayName"
        case description = "Description"
        case virtualCurrency = "VirtualCurrency"
        case realCurrency = "RealCurrency"
        case tags = "Tags"
        case entitlement = "Entitlement"
        case isStackable = "IsStackable"
        case bundleImageUrl = "BundleImageUrl"
        case isLimitedEdition = "IsLimitedEdition"
        case limitedEditionIntialCount = "LimitedEditionIntialCount"
        case customMetaData = "CustomMetaData"
        case bundleContents = "BundleContents"
        case status = "Status"
        case ID = "ID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(bundleCategory, forKey: .bundleCategory)
        try container.encode(displayName, forKey: .displayName)
        try container.encode(description, forKey: .description)
        try container.encode(virtualCurrency, forKey: .virtualCurrency)
        try container.encode(realCurrency, forKey: .realCurrency)
        try container.encode(tags, forKey: .tags)
        try container.encode(entitlement, forKey: .entitlement)
        try container.encode(isStackable, forKey: .isStackable)
        try container.encode(bundleImageUrl, forKey: .bundleImageUrl)
        try container.encode(isLimitedEdition, forKey: .isLimitedEdition)
        try container.encode(limitedEditionIntialCount, forKey: .limitedEditionIntialCount)
        try container.encode(customMetaData, forKey: .customMetaData)
        try container.encode(bundleContents, forKey: .bundleContents)
        try container.encode(status, forKey: .status)
        try container.encode(ID, forKey: .ID)
    }
}

