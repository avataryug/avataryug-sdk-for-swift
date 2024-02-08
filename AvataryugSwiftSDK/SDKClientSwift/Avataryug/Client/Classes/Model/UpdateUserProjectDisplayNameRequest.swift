import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UpdateUserProjectDisplayNameRequest: Codable, JSONEncodable, Hashable {

    /** New display name for the user - must be between 3 and 25 characters. */
    public var displayName: String

    public init(displayName: String) {
        self.displayName = displayName
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case displayName = "DisplayName"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(displayName, forKey: .displayName)
    }
}

