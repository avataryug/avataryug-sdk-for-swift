import Foundation

///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
///
///This is auto genrated class using openapi
///API OpenAPIClient is mainly responsible for making the HTTP call to the API backend.

@available(*, deprecated, renamed: "OpenAPIClientAPI")
public typealias OpenAPIClient = OpenAPIClientAPI

open class OpenAPIClientAPI {
    public static var basePath = "https://" + ProjectSettings.shared.projectid + ".avataryugapi.com/client"
    public static var customHeaders: [String: String] = [:]
    public static var credential: URLCredential?
    public static var requestBuilderFactory: RequestBuilderFactory = URLSessionRequestBuilderFactory()
    public static var apiResponseQueue: DispatchQueue = .main
}

open class RequestBuilder<T> {
    var credential: URLCredential?
    var headers: [String: String]
    public let parameters: [String: Any]?
    public let method: String
    public let URLString: String
    public let requestTask: RequestTask = RequestTask()
    public let requiresAuthentication: Bool

    /// Optional block to obtain a reference to the request's progress instance when available.
    /// With the URLSession http client the request's progress only works on iOS 11.0, macOS 10.13, macCatalyst 13.0, tvOS 11.0, watchOS 4.0.
    /// If you need to get the request's progress in older OS versions, please use Alamofire http client.
    public var onProgressReady: ((Progress) -> Void)?

    required public init(
        method: String, URLString: String, parameters: [String: Any]?,
        headers: [String: String] = [:], requiresAuthentication: Bool
    ) {
        self.method = method
        self.URLString = URLString
        self.parameters = parameters
        self.headers = headers
        self.requiresAuthentication = requiresAuthentication

        addHeaders(OpenAPIClientAPI.customHeaders)
    }

    open func addHeaders(_ aHeaders: [String: String]) {
        for (header, value) in aHeaders {
            headers[header] = value
        }
    }

    @discardableResult
    open func execute(
        _ apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue,
        _ completion: @escaping (_ result: Swift.Result<Response<T>, ErrorResponse>) -> Void
    ) -> RequestTask {
        return requestTask
    }

    public func addHeader(name: String, value: String) -> Self {
        if !value.isEmpty {
            headers[name] = value
        }
        return self
    }

    open func addCredential() -> Self {
        credential = OpenAPIClientAPI.credential
        return self
    }
}

public protocol RequestBuilderFactory {
    func getNonDecodableBuilder<T>() -> RequestBuilder<T>.Type
    func getBuilder<T: Decodable>() -> RequestBuilder<T>.Type
}
