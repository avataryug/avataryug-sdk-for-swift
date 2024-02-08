import Foundation

struct ModelData  : Codable
{
    /// Gets or Sets DisplayID
    var DisplayID:String?;
    
    /// Gets or Sets DisplayName
    var DisplayName :String?;
    
    /// Gets or Sets MainCatID
    var MainCatID :String?;
    
    /// Gets or Sets GlbPath
    var GlbPath :String?;
    
    /// Gets or Sets GlbPathOffline
    var GlbPathOffline :String?;
    
    /// Gets or Sets CoreBucket
    var CoreBucket:String?;
    
    /// Gets or Sets ConflictingBuckets
    var ConflictingBuckets:String?;
    
    public init( DisplayID:String?, DisplayName :String?, MainCatID :String?, GlbPath :String?, GlbPathOffline :String?, CoreBucket:String?, ConflictingBuckets:String?) {
        self.DisplayID = DisplayID
        self.DisplayName = DisplayName
        self.MainCatID = MainCatID
        self.GlbPath = GlbPath
        self.GlbPathOffline = GlbPathOffline
        self.CoreBucket = CoreBucket
        self.ConflictingBuckets = ConflictingBuckets

    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case DisplayID = "DisplayID"
        case DisplayName = "DisplayName"
        case MainCatID = "MainCatID"
        case GlbPath = "GlbPath"
        case GlbPathOffline = "GlbPathOffline"
        case CoreBucket = "CoreBucket"
        case ConflictingBuckets = "ConflictingBuckets"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(DisplayID, forKey: .DisplayID)
        try container.encodeIfPresent(DisplayName, forKey: .DisplayName)
        try container.encodeIfPresent(MainCatID, forKey: .MainCatID)
        try container.encodeIfPresent(GlbPath, forKey: .GlbPath)
        try container.encodeIfPresent(GlbPathOffline, forKey: .GlbPathOffline)
        try container.encodeIfPresent(CoreBucket, forKey: .CoreBucket)
        try container.encodeIfPresent(ConflictingBuckets, forKey: .ConflictingBuckets)
    }

};

