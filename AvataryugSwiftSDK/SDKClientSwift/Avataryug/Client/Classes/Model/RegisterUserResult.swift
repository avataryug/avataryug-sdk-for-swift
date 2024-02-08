import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct RegisterUserResult: Codable, JSONEncodable, Hashable {

    /// Gets or Sets code
    public var code: Int?
    
    /// Gets or Sets status
    public var status: String?
    
    /// Gets or Sets data
    public var data: RegisterUserResultData?

    public init(code: Int? = nil, status: String? = nil, data: RegisterUserResultData? = nil) {
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

