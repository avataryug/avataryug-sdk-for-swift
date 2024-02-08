import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ConfirmPurchaseResult: Codable, JSONEncodable, Hashable {

    /// Gets or Sets Code
    public var code: Int?
    
    /// Gets or Sets Status
    public var status: String?
    
    /// Gets or Sets Data
    public var data: ConfirmPurchaseResultData?

    public init(code: Int? = nil, status: String? = nil, data: ConfirmPurchaseResultData? = nil) {
        self.code = code
        self.status = status
        self.data = data
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case code = "Code"
        case status = "Status"
        case data = "Data"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(data, forKey: .data)
    }
}

