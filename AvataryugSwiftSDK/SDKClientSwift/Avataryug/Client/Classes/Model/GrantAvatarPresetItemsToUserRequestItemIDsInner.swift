import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GrantAvatarPresetItemsToUserRequestItemIDsInner: Codable, JSONEncodable, Hashable {

    /** Unique identifier of the item being granted */
    public var itemID: String

    public init(itemID: String) {
        self.itemID = itemID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case itemID = "ItemID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(itemID, forKey: .itemID)
    }
}

