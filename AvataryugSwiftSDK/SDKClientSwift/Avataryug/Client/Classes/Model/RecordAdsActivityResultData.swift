import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct RecordAdsActivityResultData: Codable, JSONEncodable, Hashable {

    /// Gets or Sets owner
    public var owner: String?
    
    /// Gets or Sets revenueCurrency
    public var revenueCurrency: String?
    
    /// Gets or Sets adRevenue
    public var adRevenue: Int?
    
    /// Gets or Sets placementID
    public var placementID: String?
    
    /// Gets or Sets updatedAt
    public var updatedAt: String?
    
    /// Gets or Sets ID
    public var ID: String?

    public init(owner: String? = nil, revenueCurrency: String? = nil, adRevenue: Int? = nil, placementID: String? = nil, updatedAt: String? = nil, ID: String? = nil) {
        self.owner = owner
        self.revenueCurrency = revenueCurrency
        self.adRevenue = adRevenue
        self.placementID = placementID
        self.updatedAt = updatedAt
        self.ID = ID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case owner = "Owner"
        case revenueCurrency = "RevenueCurrency"
        case adRevenue = "AdRevenue"
        case placementID = "PlacementID"
        case updatedAt = "UpdatedAt"
        case ID = "ID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(owner, forKey: .owner)
        try container.encodeIfPresent(revenueCurrency, forKey: .revenueCurrency)
        try container.encodeIfPresent(adRevenue, forKey: .adRevenue)
        try container.encodeIfPresent(placementID, forKey: .placementID)
        try container.encodeIfPresent(updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(ID, forKey: .ID)
    }
}

