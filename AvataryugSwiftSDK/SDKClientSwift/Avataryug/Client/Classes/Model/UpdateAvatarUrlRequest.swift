import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UpdateAvatarUrlRequest: Codable, JSONEncodable, Hashable {

    /** Unique AvatarYug assigned ID of the user on whom the operation will be performed. */
    public var userID: String
    /** 3D Avatar Url for the user. */
    public var meshUrl: String

    public init(userID: String, meshUrl: String) {
        self.userID = userID
        self.meshUrl = meshUrl
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case userID = "UserID"
        case meshUrl = "MeshUrl"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userID, forKey: .userID)
        try container.encode(meshUrl, forKey: .meshUrl)
    }
}

