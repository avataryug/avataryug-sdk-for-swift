import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetStoreItemsByIDResultData: Codable, JSONEncodable, Hashable {

    ///Get or Set DisplayName
    public var displayName: String?
    
    ///Get or Set Description
    public var description: String?
    
    ///Get or Set CustomMetaData
    public var customMetaData: String?
    
    ///Get or Set StoreContents
    public var storeContents: String?
    
    ///Get or Set Status
    public var status: Int?
    
    ///Get or Set ID
    public var ID: String?

    public init(displayName: String? = nil, description: String? = nil, customMetaData: String? = nil, storeContents: String? = nil, status: Int? = nil, ID: String? = nil) {
        self.displayName = displayName
        self.description = description
        self.customMetaData = customMetaData
        self.storeContents = storeContents
        self.status = status
        self.ID = ID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case displayName = "DisplayName"
        case description = "Description"
        case customMetaData = "CustomMetaData"
        case storeContents = "StoreContents"
        case status = "Status"
        case ID = "ID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(displayName, forKey: .displayName)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(customMetaData, forKey: .customMetaData)
        try container.encodeIfPresent(storeContents, forKey: .storeContents)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(ID, forKey: .ID)
    }
}

