import Foundation

struct AvatarData : Codable
{
    ///Get or Set Race
    public var Race : String = ""
    
    ///Get or Set AgeRange
    public var AgeRange : String = ""
    
    ///Get or Set Gender
    public var Gender : Int = 0
    
    ///Get or Set CustomMetaData
    public var CustomMetaData : String = ""
    
    ///Get or Set MetaData
    public var MetaData : String = ""
    
    ///Get or Set ColorMeta
    public var ColorMeta : PropColors
    
    ///Get or Set BucketData
    public var BucketData :  [PropData] = []
    
    ///Get or Set Blendshapes
    public var Blendshapes : [BlendShape] = []
    
    
    public init(Race: String, AgeRange: String, Gender: Int, CustomMetaData: String, MetaData: String, ColorMeta: PropColors, BucketData: [PropData], Blendshapes: [BlendShape]) {
        self.Race = Race
        self.AgeRange = AgeRange
        self.Gender = Gender
        self.CustomMetaData = CustomMetaData
        self.MetaData = MetaData
        self.ColorMeta = ColorMeta
        self.BucketData = BucketData
        self.Blendshapes = Blendshapes
    }
    
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case Race = "Race"
        case AgeRange = "AgeRange"
        case Gender = "Gender"
        case CustomMetaData = "CustomMetaData"
        case MetaData = "MetaData"
        case ColorMeta = "ColorMeta"
        case BucketData = "BucketData"
        case Blendshapes = "Blendshapes"
    }
    
    /// Encodable protocol methods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.Race, forKey: .Race)
        try container.encode(self.AgeRange, forKey: .AgeRange)
        try container.encode(self.Gender, forKey: .Gender)
        try container.encode(self.CustomMetaData, forKey: .CustomMetaData)
        try container.encode(self.MetaData, forKey: .MetaData)
        try container.encodeIfPresent(self.ColorMeta, forKey: .ColorMeta)
        try container.encode(self.BucketData, forKey: .BucketData)
        try container.encode(self.Blendshapes, forKey: .Blendshapes)
    }
}


struct AvatarDataBlender : Codable
{
    ///Get or Set MetaData
    public var MetaData : String = ""
    
    ///Get or Set AgeRange
    public var AgeRange : String = ""
    
    ///Get or Set Gender
    public var Gender : Int = 0
    
    ///Get or Set CustomMetaData
    public var CustomMetaData : String = ""
    
    ///Get or Set Race
    public var Race : String = ""
    
    ///Get or Set ColorMeta
    public var ColorMeta : PropColors

    
    ///Get or Set BucketData
    public var BucketData :  [PropBucketData] = []
    
    ///Get or Set Blendshapes
    public var Blendshapes : [BlendshapeData] = []
    
    
    public init(Race: String, AgeRange: String, Gender: Int, CustomMetaData: String, _MetaData: String, ColorMeta: PropColors, BucketData: [PropBucketData], Blendshapes: [BlendshapeData]) {
        self.Race = Race
        self.AgeRange = AgeRange
        self.Gender = Gender
        self.CustomMetaData = CustomMetaData
        self.MetaData = _MetaData
        self.ColorMeta = ColorMeta
        self.BucketData = BucketData
        self.Blendshapes = Blendshapes
    }
    
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case Race = "Race"
        case AgeRange = "AgeRange"
        case Gender = "Gender"
        case CustomMetaData = "CustomMetaData"
        case MetaData = "MetaData"
        case ColorMeta = "ColorMeta"
        case BucketData = "BucketData"
        case Blendshapes = "Blendshapes"
    }
    
    /// Encodable protocol methods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.Race, forKey: .Race)
        try container.encode(self.AgeRange, forKey: .AgeRange)
        try container.encode(self.Gender, forKey: .Gender)
        try container.encode(self.CustomMetaData, forKey: .CustomMetaData)
        try container.encode(self.MetaData, forKey: .MetaData)
        try container.encodeIfPresent(self.ColorMeta, forKey: .ColorMeta)
        try container.encode(self.BucketData, forKey: .BucketData)
        try container.encode(self.Blendshapes, forKey: .Blendshapes)
    }
}
