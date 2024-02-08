import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetEconomyItemsByIDResultData: Codable, JSONEncodable, Hashable {

    ///Get or Set TemplateID
    public var templateID: String?
    
    ///Get or Set ItemGender
    public var itemGender: Int?
    
    ///Get or Set ItemCategory
    public var itemCategory: String?
    
    ///Get or Set ItemSubCategory
    public var itemSubCategory: String?
    
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
    
    ///Get or Set IsLimitedEdition
    public var isLimitedEdition: Int?
    
    ///Get or Set LimitedEditionIntialCount
    public var limitedEditionIntialCount: Int?
    
    ///Get or Set CustomMetaData
    public var customMetaData: String?
    
    ///Get or Set Style
    public var style: String?
    
    ///Get or Set ItemThumbnailsUrl
    public var itemThumbnailsUrl: String?
    
    ///Get or Set Artifacts
    public var artifacts: String?
    
    ///Get or Set BlendshapeKeys
    public var blendshapeKeys: String?
    
    ///Get or Set ItemSkin
    public var itemSkin: String?
    
    ///Get or Set Status
    public var status: Int?
    
    ///Get or Set ID
    public var ID: String?
    
    ///Get or Set Config
    public var config: String?
    
    ///Get or Set CoreBucket
    public var coreBucket: String?
    
    ///Get or Set ConflictingBuckets
    public var conflictingBuckets: String?

    public init(templateID: String? = nil, itemGender: Int? = nil, itemCategory: String? = nil, itemSubCategory: String? = nil, displayName: String? = nil, description: String? = nil, virtualCurrency: String? = nil, realCurrency: Int? = nil, tags: String? = nil, entitlement: String? = nil, isStackable: Int? = nil, isLimitedEdition: Int? = nil, limitedEditionIntialCount: Int? = nil, customMetaData: String? = nil, style: String? = nil, itemThumbnailsUrl: String? = nil, artifacts: String? = nil, blendshapeKeys: String? = nil, itemSkin: String? = nil, status: Int? = nil, ID: String? = nil, config: String? = nil, coreBucket: String? = nil, conflictingBuckets: String? = nil) {
        self.templateID = templateID
        self.itemGender = itemGender
        self.itemCategory = itemCategory
        self.itemSubCategory = itemSubCategory
        self.displayName = displayName
        self.description = description
        self.virtualCurrency = virtualCurrency
        self.realCurrency = realCurrency
        self.tags = tags
        self.entitlement = entitlement
        self.isStackable = isStackable
        self.isLimitedEdition = isLimitedEdition
        self.limitedEditionIntialCount = limitedEditionIntialCount
        self.customMetaData = customMetaData
        self.style = style
        self.itemThumbnailsUrl = itemThumbnailsUrl
        self.artifacts = artifacts
        self.blendshapeKeys = blendshapeKeys
        self.itemSkin = itemSkin
        self.status = status
        self.ID = ID
        self.config = config
        self.coreBucket = coreBucket
        self.conflictingBuckets = conflictingBuckets

    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case templateID = "TemplateID"
        case itemGender = "ItemGender"
        case itemCategory = "ItemCategory"
        case itemSubCategory = "ItemSubCategory"
        case displayName = "DisplayName"
        case description = "Description"
        case virtualCurrency = "VirtualCurrency"
        case realCurrency = "RealCurrency"
        case tags = "Tags"
        case entitlement = "Entitlement"
        case isStackable = "IsStackable"
        case isLimitedEdition = "IsLimitedEdition"
        case limitedEditionIntialCount = "LimitedEditionIntialCount"
        case customMetaData = "CustomMetaData"
        case style = "Style"
        case itemThumbnailsUrl = "ItemThumbnailsUrl"
        case artifacts = "Artifacts"
        case blendshapeKeys = "BlendshapeKeys"
        case itemSkin = "ItemSkin"
        case status = "Status"
        case ID
        case config = "Config"
        case coreBucket = "CoreBucket"
        case conflictingBuckets = "ConflictingBuckets"

    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(templateID, forKey: .templateID)
        try container.encodeIfPresent(itemGender, forKey: .itemGender)
        try container.encodeIfPresent(itemCategory, forKey: .itemCategory)
        try container.encodeIfPresent(itemSubCategory, forKey: .itemSubCategory)
        try container.encodeIfPresent(displayName, forKey: .displayName)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(virtualCurrency, forKey: .virtualCurrency)
        try container.encodeIfPresent(realCurrency, forKey: .realCurrency)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(entitlement, forKey: .entitlement)
        try container.encodeIfPresent(isStackable, forKey: .isStackable)
        try container.encodeIfPresent(isLimitedEdition, forKey: .isLimitedEdition)
        try container.encodeIfPresent(limitedEditionIntialCount, forKey: .limitedEditionIntialCount)
        try container.encodeIfPresent(customMetaData, forKey: .customMetaData)
        try container.encodeIfPresent(style, forKey: .style)
        try container.encodeIfPresent(itemThumbnailsUrl, forKey: .itemThumbnailsUrl)
        try container.encodeIfPresent(artifacts, forKey: .artifacts)
        try container.encodeIfPresent(blendshapeKeys, forKey: .blendshapeKeys)
        try container.encodeIfPresent(itemSkin, forKey: .itemSkin)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(ID, forKey: .ID)
        try container.encodeIfPresent(config, forKey: .config)
        try container.encodeIfPresent(coreBucket, forKey: .coreBucket)
        try container.encodeIfPresent(conflictingBuckets, forKey: .conflictingBuckets)


    }
}

