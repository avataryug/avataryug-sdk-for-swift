import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetAdPlacementByIDResultData: Codable, JSONEncodable, Hashable {

    ///Get or Set PlacementName
    public var placementName: String?
    
    ///Get or Set Platform
    public var platform: String?
    
    ///Get or Set AdFormat
    public var adFormat: String?
    
    ///Get or Set AdUnit
    public var adUnit: String?
    
    ///Get or Set Rewards
    public var rewards: String?
    
    ///Get or Set Segments
    public var segments: String?
    
    ///Get or Set AdLimits
    public var adLimits: String?
    
    ///Get or Set Status
    public var status: Int?
    
    ///Get or Set ID
    public var ID: String?

    public init(placementName: String? = nil, platform: String? = nil, adFormat: String? = nil, adUnit: String? = nil, rewards: String? = nil, segments: String? = nil, adLimits: String? = nil, status: Int? = nil, ID: String? = nil) {
        self.placementName = placementName
        self.platform = platform
        self.adFormat = adFormat
        self.adUnit = adUnit
        self.rewards = rewards
        self.segments = segments
        self.adLimits = adLimits
        self.status = status
        self.ID = ID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case placementName = "PlacementName"
        case platform = "Platform"
        case adFormat = "AdFormat"
        case adUnit = "AdUnit"
        case rewards = "Rewards"
        case segments = "Segments"
        case adLimits = "AdLimits"
        case status = "Status"
        case ID = "ID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(placementName, forKey: .placementName)
        try container.encodeIfPresent(platform, forKey: .platform)
        try container.encodeIfPresent(adFormat, forKey: .adFormat)
        try container.encodeIfPresent(adUnit, forKey: .adUnit)
        try container.encodeIfPresent(rewards, forKey: .rewards)
        try container.encodeIfPresent(segments, forKey: .segments)
        try container.encodeIfPresent(adLimits, forKey: .adLimits)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(ID, forKey: .ID)
    }
}

