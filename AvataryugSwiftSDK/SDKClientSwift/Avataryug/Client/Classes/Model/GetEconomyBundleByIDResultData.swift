import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetEconomyBundleByIDResultData: Codable, JSONEncodable, Hashable {

    ///Get or Set BundleCategory
    public var bundleCategory: String?
    
    ///Get or Set DisplayName
    public var displayName: String?
    
    ///Get or Set Description
    public var description: String?
    
    ///Get or Set VirtualCurrency
    public var virtualCurrency: String?
    
    ///Get or Set RealCurrency
    public var realCurrency: Int?
    
    ///Get or Set Tags
    public var tags: String?
    
    ///Get or Set Entitlement
    public var entitlement: String?
    
    ///Get or Set IsStackable
    public var isStackable: Int?
    
    ///Get or Set BundleImageUrl
    public var bundleImageUrl: String?
    
    ///Get or Set IsLimitedEdition
    public var isLimitedEdition: Int?
    
    ///Get or Set LimitedEditionIntialCount
    public var limitedEditionIntialCount: Int?
    
    ///Get or Set CustomMetaData
    public var customMetaData: String?
    
    ///Get or Set BundleContents
    public var bundleContents: String?
    
    ///Get or Set Status
    public var status: Int?
    
    ///Get or Set ID
    public var ID: String?

    public init(bundleCategory: String? = nil, displayName: String? = nil, description: String? = nil, virtualCurrency: String? = nil, realCurrency: Int? = nil, tags: String? = nil, entitlement: String? = nil, isStackable: Int? = nil, bundleImageUrl: String? = nil, isLimitedEdition: Int? = nil, limitedEditionIntialCount: Int? = nil, customMetaData: String? = nil, bundleContents: String? = nil, status: Int? = nil, ID: String? = nil) {
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
        try container.encodeIfPresent(bundleCategory, forKey: .bundleCategory)
        try container.encodeIfPresent(displayName, forKey: .displayName)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(virtualCurrency, forKey: .virtualCurrency)
        try container.encodeIfPresent(realCurrency, forKey: .realCurrency)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(entitlement, forKey: .entitlement)
        try container.encodeIfPresent(isStackable, forKey: .isStackable)
        try container.encodeIfPresent(bundleImageUrl, forKey: .bundleImageUrl)
        try container.encodeIfPresent(isLimitedEdition, forKey: .isLimitedEdition)
        try container.encodeIfPresent(limitedEditionIntialCount, forKey: .limitedEditionIntialCount)
        try container.encodeIfPresent(customMetaData, forKey: .customMetaData)
        try container.encodeIfPresent(bundleContents, forKey: .bundleContents)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(ID, forKey: .ID)
    }
}

