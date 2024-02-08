import Foundation

struct PropData: Codable ,Hashable
{
    /// Gets or Sets CoreBucket
    var CoreBucket : String?
    
    /// Gets or Sets ID
    var ID : String?
    
    public init( CoreBucket: String?, ID: String? ) {
        self.CoreBucket = CoreBucket
        self.ID = ID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case CoreBucket = "CoreBucket"
        case ID = "ID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(CoreBucket, forKey: .CoreBucket)
        try container.encodeIfPresent(ID, forKey: .ID)
    }
}
