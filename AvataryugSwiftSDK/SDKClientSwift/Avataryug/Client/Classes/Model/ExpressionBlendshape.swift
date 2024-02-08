import Foundation

struct ExpressionBlendshape :Codable
{
    /// Gets or Sets maincategory
    var maincategory:String = ""
    
    /// Gets or Sets sliderValue
    var sliderValue:String = ""
    
    /// Gets or Sets value
    var value:Int = 0
    
    /// Gets or Sets selectedShape
    var selectedShape:String = ""
    
    public init(maincategory: String, sliderValue: String, value: Int, selectedShape: String) {
        self.maincategory = maincategory
        self.sliderValue = sliderValue
        self.value = value
        self.selectedShape = selectedShape
    }
    
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case maincategory = "maincategory"
        case sliderValue = "sliderValue"
        case value = "value"
        case selectedShape = "selectedShape"
    }
    
    ///Encodable protocal methiods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.maincategory, forKey: .maincategory)
        try container.encode(self.sliderValue, forKey: .sliderValue)
        try container.encode(self.value, forKey: .value)
        try container.encode(self.selectedShape, forKey: .selectedShape)
    }
}
