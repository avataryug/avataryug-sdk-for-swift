import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetUserIDfromSessionTicket: Codable, JSONEncodable, Hashable {

    ///Get or Set Code
    public var code: Int?
    
    ///Get or Set Status
    public var status: String?
    
    ///Get or Set UserID
    public var userID: String?

    public init(code: Int? = nil, status: String? = nil, userID: String? = nil) {
        self.code = code
        self.status = status
        self.userID = userID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case code = "Code"
        case status = "Status"
        case userID = "UserID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(userID, forKey: .userID)
    }
}

