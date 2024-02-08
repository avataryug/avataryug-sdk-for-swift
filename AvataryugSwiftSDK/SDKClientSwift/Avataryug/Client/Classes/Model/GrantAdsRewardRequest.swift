import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GrantAdsRewardRequest: Codable, JSONEncodable, Hashable {

    /** Unique identifier of the placement. */
    public var placementID: String

    public init(placementID: String) {
        self.placementID = placementID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case placementID = "PlacementID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(placementID, forKey: .placementID)
    }
}

