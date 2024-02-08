import Foundation

struct LoadedTattoo :Codable
{
    /// Gets or Sets ItemCategory
    public var ItemCategory : String = ""
    
    /// Gets or Sets tattooTex
    public var tattooTex : Data
    
    /// Gets or Sets tattooid
    public var tattooid : String = ""
    
}
