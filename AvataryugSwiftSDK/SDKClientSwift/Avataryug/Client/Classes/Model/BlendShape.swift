import Foundation

struct BlendShape :Codable
 {
    /// Get or Set shapekeys
    var shapekeys:String = ""
    
    /// Get or Set value
    var value:Float = 0.0
    
    public init(shapekeys: String, value: Float) {
        self.shapekeys = shapekeys
        self.value = value
    }
    
    public enum CodingKeys:  String, CodingKey, CaseIterable  {
        case shapekeys = "shapekeys"
        case value = "value"
    }
    
    ///Encodable protocol methods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.shapekeys, forKey: .shapekeys)
        try container.encode(self.value, forKey: .value)
    }
 }
