import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GrantInstanceToUserRequest: Codable, JSONEncodable, Hashable {

    ///Get or Set instanceIDs
    public var instanceIDs: [GrantInstanceToUserRequestInstanceIDsInner]?

    public init(instanceIDs: [GrantInstanceToUserRequestInstanceIDsInner]? = nil) {
        self.instanceIDs = instanceIDs
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case instanceIDs = "InstanceIDs"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(instanceIDs, forKey: .instanceIDs)
    }
}

