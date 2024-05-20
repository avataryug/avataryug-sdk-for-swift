
import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct CreateAvatarResponse: Codable, JSONEncodable, Hashable {

    /// Gets or Sets Code
    public var code: Int?
    
    /// Gets or Sets Status
    public var status: String?
    
    /// Gets or Sets Message
    public var avatarID: String?

    public init(code: Int? = nil, status: String? = nil, avatarID: String? = nil) {
        self.code = code
        self.status = status
        self.avatarID = avatarID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case code = "Code"
        case status = "Status"
        case avatarID = "AvatarID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(avatarID, forKey: .avatarID)
    }
}

