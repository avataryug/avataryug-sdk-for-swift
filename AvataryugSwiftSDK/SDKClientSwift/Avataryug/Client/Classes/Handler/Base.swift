import Foundation
///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
/// The abstracted base class is designed to simplify API calling by providing a reusable foundation that can be utilized in various programming contexts.
protocol Base {
  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
}
