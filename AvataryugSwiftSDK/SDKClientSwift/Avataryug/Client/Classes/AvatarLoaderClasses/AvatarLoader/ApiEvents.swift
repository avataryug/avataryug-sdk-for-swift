import Foundation

// Api events for use internal purpose
class ApiEvents {
  static let shared = ApiEvents()

  private var eventSubscriber: ApiEventSubscriber?

  public func SetDelegate(subscriber: ApiEventSubscriber) {
    eventSubscriber = subscriber
  }

  private init() {}

  public func ShowLoading() {
    eventSubscriber?.SetLoadingScr(_showLoading: true)
  }

  public func HideLoading() {
    eventSubscriber?.SetLoadingScr(_showLoading: false)
  }

  public func ShowPopupMessage(message: String) {
    eventSubscriber?.ShowMessagePopup(message: message, showSimpleNot: true)
  }
}

protocol ApiEventSubscriber {
  func SetLoadingScr(_showLoading: Bool)
  func ShowMessagePopup(message: String, showSimpleNot: Bool)
}
