import Foundation

struct Style :Codable
{
    /// Gets or Sets ClipID
    var ClipID: String = ""
    
    /// Gets or Sets ExpressionID
    var ExpressionID: String = ""
    
    public init(ClipID: String, ExpressionID: String) {
        self.ClipID = ClipID
        self.ExpressionID = ExpressionID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case ClipID = "ClipID"
        case ExpressionID = "ExpressionID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(ClipID, forKey: .ClipID)
        try container.encode(ExpressionID, forKey: .ExpressionID)
    }
}
