import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GrantAvatarPresetItemsToUserRequest: Codable, JSONEncodable, Hashable {
    
    ///Get or Set ItemIDs
    public var itemIDs: [GrantAvatarPresetItemsToUserRequestItemIDsInner]?

    public init(itemIDs: [GrantAvatarPresetItemsToUserRequestItemIDsInner]? = nil) {
        self.itemIDs = itemIDs
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case itemIDs = "ItemIDs"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(itemIDs, forKey: .itemIDs)
    }
}

