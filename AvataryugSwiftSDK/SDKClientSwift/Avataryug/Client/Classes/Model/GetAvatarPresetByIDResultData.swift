import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetAvatarPresetByIDResultData: Codable, JSONEncodable, Hashable {

    ///Get or Set DisplayName
    public var displayName: String?
    
    ///Get or Set Description
    public var description: String?
    
    ///Get or Set VirtualCurrency
    public var virtualCurrency: String?
    
    ///Get or Set RealCurrency
    public var realCurrency: Int?
    
    ///Get or Set CustomMetaData
    public var customMetaData: String?
    
    ///Get or Set Artifacts
    public var itemThumbnailsUrl: String?
    
    ///Get or Set Code
    public var artifacts: String?
    
    ///Get or Set BlendshapeKeys
    public var blendshapeKeys: String?
    
    ///Get or Set Tags
    public var tags: String?
    
    ///Get or Set Props
    public var props: String?
    
    ///Get or Set Gender
    public var gender: Int?
    
    ///Get or Set Color
    public var color: String?
    
    ///Get or Set Metadata
    public var metadata: String?
    
    ///Get or Set Status
    public var status: Int?
    
    ///Get or Set ThumbUrl
    public var thumbUrl: String?
    
    ///Get or Set Race
    public var race: String?
    
    ///Get or Set AgeRange
    public var ageRange: String?
    
    ///Get or Set ID
    public var ID: String?

    public init(displayName: String? = nil, description: String? = nil, virtualCurrency: String? = nil, realCurrency: Int? = nil, customMetaData: String? = nil, itemThumbnailsUrl: String? = nil, artifacts: String? = nil, blendshapeKeys: String? = nil, tags: String? = nil, props: String? = nil, gender: Int? = nil, color: String? = nil, metadata: String? = nil, status: Int? = nil, thumbUrl: String? = nil, race: String? = nil, ageRange: String? = nil, ID: String? = nil) {
        self.displayName = displayName
        self.description = description
        self.virtualCurrency = virtualCurrency
        self.realCurrency = realCurrency
        self.customMetaData = customMetaData
        self.itemThumbnailsUrl = itemThumbnailsUrl
        self.artifacts = artifacts
        self.blendshapeKeys = blendshapeKeys
        self.tags = tags
        self.props = props
        self.gender = gender
        self.color = color
        self.metadata = metadata
        self.status = status
        self.thumbUrl = thumbUrl
        self.race = race
        self.ageRange = ageRange
        self.ID = ID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case displayName = "DisplayName"
        case description = "Description"
        case virtualCurrency = "VirtualCurrency"
        case realCurrency = "RealCurrency"
        case customMetaData = "CustomMetaData"
        case itemThumbnailsUrl = "ItemThumbnailsUrl"
        case artifacts = "Artifacts"
        case blendshapeKeys = "BlendshapeKeys"
        case tags = "Tags"
        case props = "Props"
        case gender = "Gender"
        case color = "Color"
        case metadata = "Metadata"
        case status = "Status"
        case thumbUrl = "ThumbUrl"
        case race = "Race"
        case ageRange = "AgeRange"
        case ID = "ID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(displayName, forKey: .displayName)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(virtualCurrency, forKey: .virtualCurrency)
        try container.encodeIfPresent(realCurrency, forKey: .realCurrency)
        try container.encodeIfPresent(customMetaData, forKey: .customMetaData)
        try container.encodeIfPresent(itemThumbnailsUrl, forKey: .itemThumbnailsUrl)
        try container.encodeIfPresent(artifacts, forKey: .artifacts)
        try container.encodeIfPresent(blendshapeKeys, forKey: .blendshapeKeys)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(props, forKey: .props)
        try container.encodeIfPresent(gender, forKey: .gender)
        try container.encodeIfPresent(color, forKey: .color)
        try container.encodeIfPresent(metadata, forKey: .metadata)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(thumbUrl, forKey: .thumbUrl)
        try container.encodeIfPresent(race, forKey: .race)
        try container.encodeIfPresent(ageRange, forKey: .ageRange)
        try container.encodeIfPresent(ID, forKey: .ID)
    }
}

