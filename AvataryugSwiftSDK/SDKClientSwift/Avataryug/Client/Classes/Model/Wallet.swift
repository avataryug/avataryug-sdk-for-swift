import Foundation

struct Wallet: Codable
{
    /// Gets or Sets VirtualCurrency
    let Amount: Int?
    
    /// Gets or Sets Amount
    let VirtualCurrency: String?
    
    public init( Amount: Int?, VirtualCurrency: String?) {
        self.Amount = Amount
        self.VirtualCurrency = VirtualCurrency
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case Amount = "Amount"
        case VirtualCurrency = "VirtualCurrency"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(Amount, forKey: .Amount)
        try container.encodeIfPresent(VirtualCurrency, forKey: .VirtualCurrency)
    }
}
