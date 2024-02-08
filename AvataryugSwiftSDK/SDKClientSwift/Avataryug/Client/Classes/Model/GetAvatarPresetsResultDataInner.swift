import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetAvatarPresetsResultDataInner: Codable, JSONEncodable, Hashable {

    ///Get or Set DisplayName
    public var displayName: String
    
    ///Get or Set Description
    public var description: String
    
    ///Get or Set VirtualCurrency
    public var virtualCurrency: String
    
    ///Get or Set RealCurrency
    public var realCurrency: Int
    
    ///Get or Set CustomMetaData
    public var customMetaData: String
    
    ///Get or Set ItemThumbnailsUrl
    public var imageArtifacts: String
    
    ///Get or Set Artifacts
    public var meshArtifacts: String
    
    ///Get or Set BlendshapeKeys
    public var blendshapeKeys: String
    
    ///Get or Set Tags
    public var tags: String
    
    ///Get or Set Props
    public var props: String
    
    ///Get or Set Gender
    public var gender: Int
    
    ///Get or Set Color
    public var color: String
    
    ///Get or Set Metadata
    public var metadata: String
    
    ///Get or Set Status
    public var status: Int
    
    ///Get or Set Race
    public var race: String
    
    ///Get or Set AgeRange
    public var ageRange: String
    
    ///Get or Set ID
    public var ID: String

    public init(displayName: String, description: String, virtualCurrency: String, realCurrency: Int, customMetaData: String, imageArtifacts: String, meshArtifacts: String, blendshapeKeys: String, tags: String, props: String, gender: Int, color: String, metadata: String, status: Int, race: String, ageRange: String, ID: String) {
        self.displayName = displayName
        self.description = description
        self.virtualCurrency = virtualCurrency
        self.realCurrency = realCurrency
        self.customMetaData = customMetaData
        self.imageArtifacts = imageArtifacts
        self.meshArtifacts = meshArtifacts
        self.blendshapeKeys = blendshapeKeys
        self.tags = tags
        self.props = props
        self.gender = gender
        self.color = color
        self.metadata = metadata
        self.status = status
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
        case imageArtifacts = "ImageArtifacts"
        case meshArtifacts = "MeshArtifacts"
        case blendshapeKeys = "BlendshapeKeys"
        case tags = "Tags"
        case props = "Props"
        case gender = "Gender"
        case color = "Color"
        case metadata = "Metadata"
        case status = "Status"
        case race = "Race"
        case ageRange = "AgeRange"
        case ID = "ID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(displayName, forKey: .displayName)
        try container.encode(description, forKey: .description)
        try container.encode(virtualCurrency, forKey: .virtualCurrency)
        try container.encode(realCurrency, forKey: .realCurrency)
        try container.encode(customMetaData, forKey: .customMetaData)
        try container.encode(imageArtifacts, forKey: .imageArtifacts)
        try container.encode(meshArtifacts, forKey: .meshArtifacts)
        try container.encode(blendshapeKeys, forKey: .blendshapeKeys)
        try container.encode(tags, forKey: .tags)
        try container.encode(props, forKey: .props)
        try container.encode(gender, forKey: .gender)
        try container.encode(color, forKey: .color)
        try container.encode(metadata, forKey: .metadata)
        try container.encode(status, forKey: .status)
        try container.encode(race, forKey: .race)
        try container.encode(ageRange, forKey: .ageRange)
        try container.encode(ID, forKey: .ID)
    }
}

