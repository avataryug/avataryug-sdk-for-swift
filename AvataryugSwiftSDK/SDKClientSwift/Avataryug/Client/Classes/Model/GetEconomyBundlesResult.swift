import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetEconomyBundlesResult: Codable, JSONEncodable, Hashable {

    ///Get or Set Code
    public var code: Int?
    
    ///Get or Set Status
    public var status: String?
    
    ///Get or Set Data
    public var data: [GetEconomyBundlesResultDataInner]?

    public init(code: Int? = nil, status: String? = nil, data: [GetEconomyBundlesResultDataInner]? = nil) {
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

