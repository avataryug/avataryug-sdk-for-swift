import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetEconomyContainersResultDataInner: Codable, JSONEncodable, Hashable {

    ///Get or Set Status
    public var status: Int
    
    ///Get or Set DisplayName
    public var displayName: String
    
    ///Get or Set ContainerCategory
    public var containerCategory: String

    ///Get or Set Description
    public var description: String
    
    ///Get or Set Tags
    public var tags: String
    
    ///Get or Set ContainerImageUrl
    public var containerImageUrl: String
    
    ///Get or Set IsStackable
    public var isStackable: Int
    
    ///Get or Set IsLimitedEdition
    public var isLimitedEdition: Int
    
    ///Get or Set LimitedEditionIntialCount
    public var limitedEditionIntialCount: Int
    
    ///Get or Set Entitlement
    public var entitlement: String
    
    ///Get or Set ContainerSettings
    public var containerSettings: String
    
    ///Get or Set ContainerContents
    public var containerContents: String
    
    ///Get or Set VirtualCurrency
    public var virtualCurrency: String
    
    ///Get or Set RealCurrency
    public var realCurrency: Int
    
    ///Get or Set CustomMetaData
    public var customMetaData: String
    
    ///Get or Set ID
    public var ID: String

    public init(status: Int, displayName: String, containerCategory: String, description: String, tags: String, containerImageUrl: String, isStackable: Int, isLimitedEdition: Int, limitedEditionIntialCount: Int, entitlement: String, containerSettings: String, containerContents: String, virtualCurrency: String, realCurrency: Int, customMetaData: String, ID: String) {
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
        try container.encode(status, forKey: .status)
        try container.encode(displayName, forKey: .displayName)
        try container.encode(containerCategory, forKey: .containerCategory)
        try container.encode(description, forKey: .description)
        try container.encode(tags, forKey: .tags)
        try container.encode(containerImageUrl, forKey: .containerImageUrl)
        try container.encode(isStackable, forKey: .isStackable)
        try container.encode(isLimitedEdition, forKey: .isLimitedEdition)
        try container.encode(limitedEditionIntialCount, forKey: .limitedEditionIntialCount)
        try container.encode(entitlement, forKey: .entitlement)
        try container.encode(containerSettings, forKey: .containerSettings)
        try container.encode(containerContents, forKey: .containerContents)
        try container.encode(virtualCurrency, forKey: .virtualCurrency)
        try container.encode(realCurrency, forKey: .realCurrency)
        try container.encode(customMetaData, forKey: .customMetaData)
        try container.encode(ID, forKey: .ID)
    }
}

