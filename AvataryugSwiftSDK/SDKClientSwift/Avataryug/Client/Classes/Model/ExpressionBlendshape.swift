import Foundation

struct ExpressionBlendshape :Codable
{
    /// Gets or Sets maincategory
   // var maincategory:String = ""
    
    /// Gets or Sets sliderValue
    var sliderValue:String = ""
    
    /// Gets or Sets value
    //var value:Int = 0
    
    /// Gets or Sets selectedShape
    var selectedShape:String = ""
    
    public init( sliderValue: String,  selectedShape: String) {

        self.sliderValue = sliderValue

        self.selectedShape = selectedShape
    }
    
    public enum CodingKeys: String, CodingKey, CaseIterable {

        case sliderValue = "sliderValue"

        case selectedShape = "selectedShape"
    }
    
    ///Encodable protocal methiods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(self.sliderValue, forKey: .sliderValue)

        try container.encode(self.selectedShape, forKey: .selectedShape)
    }
}
