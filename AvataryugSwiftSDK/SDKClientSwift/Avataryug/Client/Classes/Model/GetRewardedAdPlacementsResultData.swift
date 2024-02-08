import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetRewardedAdPlacementsResultData: Codable, JSONEncodable, Hashable {

    ///Get or Set PlacementName
    public var placementName: String?
    
    ///Get or Set AppId
    public var appId: String?
    
    ///Get or Set AdUnit
    public var adUnit: String?
    
    ///Get or Set Rewards
    public var rewards: String?
    
    ///Get or Set Segments
    public var segments: String?
    
    ///Get or Set Status
    public var status: Int?
    
    ///Get or Set ID
    public var ID: String?

    public init(placementName: String? = nil, appId: String? = nil, adUnit: String? = nil, rewards: String? = nil, segments: String? = nil, status: Int? = nil, ID: String? = nil) {
        self.placementName = placementName
        self.appId = appId
        self.adUnit = adUnit
        self.rewards = rewards
        self.segments = segments
        self.status = status
        self.ID = ID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case placementName = "PlacementName"
        case appId = "AppId"
        case adUnit = "AdUnit"
        case rewards = "Rewards"
        case segments = "Segments"
        case status = "Status"
        case ID = "ID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(placementName, forKey: .placementName)
        try container.encodeIfPresent(appId, forKey: .appId)
        try container.encodeIfPresent(adUnit, forKey: .adUnit)
        try container.encodeIfPresent(rewards, forKey: .rewards)
        try container.encodeIfPresent(segments, forKey: .segments)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(ID, forKey: .ID)
    }
}

