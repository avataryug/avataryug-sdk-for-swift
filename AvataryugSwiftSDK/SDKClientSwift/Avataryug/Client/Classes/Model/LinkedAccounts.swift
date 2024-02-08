import Foundation

struct LinkedAccounts: Codable
{
    /// Gets or Sets Platform
    var Platform: String?
    
    /// Gets or Sets PlatformUserID
    var PlatformUserID: String?
    
    public init( Platform: String?, PlatformUserID: String?) {
        self.Platform = Platform
        self.PlatformUserID = PlatformUserID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case Platform = "Platform"
        case PlatformUserID = "PlatformUserID"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(Platform, forKey: .Platform)
        try container.encodeIfPresent(PlatformUserID, forKey: .PlatformUserID)
    }
}
