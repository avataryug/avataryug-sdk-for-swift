import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetEconomyContainerByIDResultData: Codable, JSONEncodable, Hashable {

    ///Get or Set Status
    public var status: Int?
    
    ///Get or Set DisplayName
    public var displayName: String?
    
    ///Get or Set ContainerCategory
    public var containerCategory: String?
    
    ///Get or Set Code
    public var description: String?
    
    ///Get or Set Tags
    public var tags: String?
    
    ///Get or Set ContainerImageUrl
    public var containerImageUrl: String?
    
    ///Get or Set IsStackable
    public var isStackable: Int?
    
    ///Get or Set IsLimitedEdition
    public var isLimitedEdition: Int?
    
    ///Get or Set LimitedEditionIntialCount
    public var limitedEditionIntialCount: Int?
    
    ///Get or Set Entitlement
    public var entitlement: String?
    
    ///Get or Set ContainerSettings
    public var containerSettings: String?
    
    ///Get or Set ContainerContents
    public var containerContents: String?
    
    ///Get or Set VirtualCurrency
    public var virtualCurrency: String?
    
    ///Get or Set RealCurrency
    public var realCurrency: Int?
    
    ///Get or Set CustomMetaData
    public var customMetaData: String?
    
    ///Get or Set ID
    public var ID: String?

    public init(status: Int? = nil, displayName: String? = nil, containerCategory: String? = nil, description: String? = nil, tags: String? = nil, containerImageUrl: String? = nil, isStackable: Int? = nil, isLimitedEdition: Int? = nil, limitedEditionIntialCount: Int? = nil, entitlement: String? = nil, containerSettings: String? = nil, containerContents: String? = nil, virtualCurrency: String? = nil, realCurrency: Int? = nil, customMetaData: String? = nil, ID: String? = nil) {
        self.status = status
        self.displayName = displayName
        self.containerCategory = containerCategory
        self.description = description
        self.tags = tags
        self.containerImageUrl = containerImageUrl
        self.isStackable = isStackable
        self.isLimitedEdition = isLimitedEdition
        self.limitedEditionIntialCount = limitedEditionIntialCount
        self.entitlement = entitlement
        self.containerSettings = containerSettings
        self.containerContents = containerContents
        self.virtualCurrency = virtualCurrency
        self.realCurrency = realCurrency
        self.customMetaData = customMetaData
        self.ID = ID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case status = "Status"
        case displayName = "DisplayName"
        case containerCategory = "ContainerCategory"
        case description = "Description"
        case tags = "Tags"
        case containerImageUrl = "ContainerImageUrl"
        case isStackable = "IsStackable"
        case isLimitedEdition = "IsLimitedEdition"
        case limitedEditionIntialCount = "LimitedEditionIntialCount"
        case entitlement = "Entitlement"
        case containerSettings = "ContainerSettings"
        case containerContents = "ContainerContents"
        case virtualCurrency = "VirtualCurrency"
        case realCurrency = "RealCurrency"
        case customMetaData = "CustomMetaData"
        case ID = "ID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(displayName, forKey: .displayName)
        try container.encodeIfPresent(containerCategory, forKey: .containerCategory)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(containerImageUrl, forKey: .containerImageUrl)
        try container.encodeIfPresent(isStackable, forKey: .isStackable)
        try container.encodeIfPresent(isLimitedEdition, forKey: .isLimitedEdition)
        try container.encodeIfPresent(limitedEditionIntialCount, forKey: .limitedEditionIntialCount)
        try container.encodeIfPresent(entitlement, forKey: .entitlement)
        try container.encodeIfPresent(containerSettings, forKey: .containerSettings)
        try container.encodeIfPresent(containerContents, forKey: .containerContents)
        try container.encodeIfPresent(virtualCurrency, forKey: .virtualCurrency)
        try container.encodeIfPresent(realCurrency, forKey: .realCurrency)
        try container.encodeIfPresent(customMetaData, forKey: .customMetaData)
        try container.encodeIfPresent(ID, forKey: .ID)
    }
}

