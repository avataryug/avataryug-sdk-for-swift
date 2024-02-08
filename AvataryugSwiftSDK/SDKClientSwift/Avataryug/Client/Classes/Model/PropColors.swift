import Foundation

struct PropColors : Codable ,Hashable
{
    /// Gets or Sets HairColor
    public var HairColor :String?
    
    /// Gets or Sets EyebrowColor
    public var EyebrowColor :String?
    
    /// Gets or Sets FacialHairColor
    public var FacialHairColor :String?
    
    /// Gets or Sets LipColor
    public var LipColor :String?
    
    /// Gets or Sets FaceColor
    public var FaceColor :String?

    
    public init( HairColor :String?, EyebrowColor :String?, FacialHairColor :String?, LipColor :String?, FaceColor :String?) {
        self.HairColor = HairColor
        self.EyebrowColor = EyebrowColor
        self.FacialHairColor = FacialHairColor
        self.LipColor = LipColor
        self.FaceColor = FaceColor
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case HairColor = "HairColor"
        case EyebrowColor = "EyebrowColor"
        case FacialHairColor = "FacialHairColor"
        case LipColor = "LipColor"
        case FaceColor = "FaceColor"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(HairColor, forKey: .HairColor)
        try container.encodeIfPresent(EyebrowColor, forKey: .EyebrowColor)
        try container.encodeIfPresent(FacialHairColor, forKey: .FacialHairColor)
        try container.encodeIfPresent(LipColor, forKey: .LipColor)
        try container.encodeIfPresent(FaceColor, forKey: .FaceColor)
    }
}
