import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetEconomyItemsResultDataInner: Codable, JSONEncodable, Hashable {

    ///Get or Set TemplateID
    public var templateID: String
    
    ///Get or Set ItemGender
    public var itemGender: Int
    
    ///Get or Set ItemCategory
    public var itemCategory: String
    
    ///Get or Set ItemSubCategory
    public var itemSubCategory: String
    
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
    
    ///Get or Set IsLimitedEdition
    public var isLimitedEdition: Int
    
    ///Get or Set LimitedEditionIntialCount
    public var limitedEditionIntialCount: Int
    
    ///Get or Set CustomMetaData
    public var customMetaData: String
    
    ///Get or Set Style
    public var style: String
    
    ///Get or Set ItemThumbnailsUrl
    public var itemThumbnailsUrl: String
    
    ///Get or Set Artifacts
    public var artifacts: String
    
    ///Get or Set BlendshapeKeys
    public var blendshapeKeys: String
    
    ///Get or Set ItemSkin
    public var itemSkin: String
    
    ///Get or Set Status
    public var status: Int
    
    ///Get or Set ID
    public var ID: String
    
    ///Get or Set Config
    public var config: String
    
    ///Get or Set CoreBucket
    public var coreBucket: String
    
    ///Get or Set ConflictingBuckets
    public var conflictingBuckets: String
 


    public init(templateID: String, itemGender: Int, itemCategory: String, itemSubCategory: String, displayName: String, description: String, virtualCurrency: String, realCurrency: Int, tags: String, entitlement: String, isStackable: Int, isLimitedEdition: Int, limitedEditionIntialCount: Int, customMetaData: String, style: String, itemThumbnailsUrl: String, artifacts: String, blendshapeKeys: String, itemSkin: String, status: Int, ID: String, config: String, coreBucket: String, conflictingBuckets: String) {
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
        case ID = "ID"
        case config = "Config"
        case coreBucket = "CoreBucket"
        case conflictingBuckets = "ConflictingBuckets"
    
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(templateID, forKey: .templateID)
        try container.encode(itemGender, forKey: .itemGender)
        try container.encode(itemCategory, forKey: .itemCategory)
        try container.encode(itemSubCategory, forKey: .itemSubCategory)
        try container.encode(displayName, forKey: .displayName)
        try container.encode(description, forKey: .description)
        try container.encode(virtualCurrency, forKey: .virtualCurrency)
        try container.encode(realCurrency, forKey: .realCurrency)
        try container.encode(tags, forKey: .tags)
        try container.encode(entitlement, forKey: .entitlement)
        try container.encode(isStackable, forKey: .isStackable)
        try container.encode(isLimitedEdition, forKey: .isLimitedEdition)
        try container.encode(limitedEditionIntialCount, forKey: .limitedEditionIntialCount)
        try container.encode(customMetaData, forKey: .customMetaData)
        try container.encode(style, forKey: .style)
        try container.encode(itemThumbnailsUrl, forKey: .itemThumbnailsUrl)
        try container.encode(artifacts, forKey: .artifacts)
        try container.encode(blendshapeKeys, forKey: .blendshapeKeys)
        try container.encode(itemSkin, forKey: .itemSkin)
        try container.encode(status, forKey: .status)
        try container.encode(ID, forKey: .ID)
        try container.encode(config, forKey: .config)
        try container.encode(coreBucket, forKey: .coreBucket)
        try container.encode(conflictingBuckets, forKey: .conflictingBuckets)

    }
}

