import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetUserInventoryResultDataInner: Codable, JSONEncodable, Hashable {

    ///Get or Set UserID
    public var userID: String
    
    ///Get or Set InstanceID
    public var instanceID: String
    
    ///Get or Set InstanceType
    public var instanceType: String
    
    ///Get or Set DisplayName
    public var displayName: String
    
    ///Get or Set Expires
    public var expires: String
    
    ///Get or Set Count
    public var count: Int
    
    ///Get or Set Status
    public var status: Int
    
    ///Get or Set Content
    public var content: String
    
    ///Get or Set ID
    public var ID: String

    public init(userID: String, instanceID: String, instanceType: String, displayName: String, expires: String, count: Int, status: Int, content: String, ID: String) {
        self.userID = userID
        self.instanceID = instanceID
        self.instanceType = instanceType
        self.displayName = displayName
        self.expires = expires
        self.count = count
        self.status = status
        self.content = content
        self.ID = ID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case userID = "UserID"
        case instanceID = "InstanceID"
        case instanceType = "InstanceType"
        case displayName = "DisplayName"
        case expires = "Expires"
        case count = "Count"
        case status = "Status"
        case content = "Content"
        case ID = "ID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userID, forKey: .userID)
        try container.encode(instanceID, forKey: .instanceID)
        try container.encode(instanceType, forKey: .instanceType)
        try container.encode(displayName, forKey: .displayName)
        try container.encode(expires, forKey: .expires)
        try container.encode(count, forKey: .count)
        try container.encode(status, forKey: .status)
        try container.encode(content, forKey: .content)
        try container.encode(ID, forKey: .ID)
    }
}

