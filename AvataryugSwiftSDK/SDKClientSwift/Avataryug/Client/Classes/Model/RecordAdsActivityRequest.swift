import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct RecordAdsActivityRequest: Codable, JSONEncodable, Hashable {

    /** Unique identifier of the placement. */
    public var placementID: String
    /** ISO 4217 code of the currency. */
    public var revenueCurrency: String
    /** Revenue generated from Ad Activity in centesimal units (Eg.100). */
    public var adRevenue: Int

    public init(placementID: String, revenueCurrency: String, adRevenue: Int) {
        self.placementID = placementID
        self.revenueCurrency = revenueCurrency
        self.adRevenue = adRevenue
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case placementID = "PlacementID"
        case revenueCurrency = "RevenueCurrency"
        case adRevenue = "AdRevenue"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(placementID, forKey: .placementID)
        try container.encode(revenueCurrency, forKey: .revenueCurrency)
        try container.encode(adRevenue, forKey: .adRevenue)
    }
}

