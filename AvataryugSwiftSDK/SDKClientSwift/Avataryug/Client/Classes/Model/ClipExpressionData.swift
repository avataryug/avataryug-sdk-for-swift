import Foundation

struct ClipExpressionData :Codable
{
    /// Gets or Sets Style
    public var Style : Style!
    
    /// Gets or Sets gender
    public var gender: Int = 1
    
    public init(Style: Style!, gender: Int) {
        self.Style = Style
        self.gender = gender
    }
    
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case Style = "Style"
        case gender = "gender"
    }
    
    ///Encodable protocol methods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.Style, forKey: .Style)
        try container.encode(self.gender, forKey: .gender)
    }
}
