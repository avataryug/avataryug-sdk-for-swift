
import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UpdateAvatarRequest: Codable, JSONEncodable, Hashable {


    public var AvatarID: String
    /** ItemID (from Economy) of the key that will be consumed by unlocking this container. */
    public var PatchData: String
    
    public var PatchDataType: String

    public var Action: String
    
    public init(avatarID: String, patchData: String ,patchDataType:String ,action :String) {
        self.AvatarID = avatarID
        self.PatchData = patchData
        self.PatchDataType = patchDataType
        self.Action = action
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case AvatarID = "AvatarID"
        case PatchData = "PatchData"
        case PatchDataType = "PatchDataType"
        case Action = "Action"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(AvatarID, forKey: .AvatarID)
        try container.encode(PatchData, forKey: .PatchData)
        try container.encode(PatchDataType, forKey: .PatchDataType)
        try container.encode(Action, forKey: .Action)
    }
}

