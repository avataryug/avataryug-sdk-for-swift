import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ApiErrorWrapper: Codable, JSONEncodable, Hashable {

    ///Gets or Sets Code
    public var code: Int?
    
    ///Gets or Sets Status
    public var status: String?
    
    ///Gets or Sets Message
    public var error: String?
    
    /// Gets or Sets ErrorCode
    public var errorCode: Int?
    
    /// Gets or Sets ErrorMessage
    public var errorMessage: String?

    public init(code: Int? = nil, status: String? = nil, error: String? = nil, errorCode: Int? = nil, errorMessage: String? = nil) {
        self.code = code
        self.status = status
        self.error = error
        self.errorCode = errorCode
        self.errorMessage = errorMessage
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case code = "Code"
        case status = "Status"
        case error = "Error"
        case errorCode = "ErrorCode"
        case errorMessage = "ErrorMessage"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(error, forKey: .error)
        try container.encodeIfPresent(errorCode, forKey: .errorCode)
        try container.encodeIfPresent(errorMessage, forKey: .errorMessage)
    }
}

