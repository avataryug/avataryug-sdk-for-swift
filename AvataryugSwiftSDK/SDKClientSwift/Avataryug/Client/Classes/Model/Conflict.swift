struct Conflict : Codable
{
    /// Gets or Sets name
    var name : String = ""
    
    
    public init(name: String) {
        self.name = name
    }
    
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case name = "name"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
    }
}
