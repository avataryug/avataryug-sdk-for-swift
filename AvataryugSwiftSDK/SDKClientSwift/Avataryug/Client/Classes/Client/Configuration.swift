import Foundation

///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
///
open class Configuration {
    
    // This value is used to configure the date formatter that is used to serialize dates into JSON format.
    // You must set it prior to encoding any dates, and it will only be read once.
    @available(*, unavailable, message: "To set a different date format, use CodableHelper.dateFormatter instead.")
    public static var dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    /// Configures the range of HTTP status codes that will result in a successful response
    ///
    /// If a HTTP status code is outside of this range the response will be interpreted as failed.
    public static var successfulStatusCodeRange: Range = 200..<300
}
