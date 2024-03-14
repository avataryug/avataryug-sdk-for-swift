import Foundation

// Api events for use internal purpose
class ApiEvents {
  static let shared = ApiEvents()
    public var isZoomOpen :Bool = false
    public var selectedCategory :String = ""
  private var eventSubscriber: ApiEventSubscriber?

  public func SetDelegate(subscriber: ApiEventSubscriber) {
    eventSubscriber = subscriber
  }

  private init() {}

    public func ShowLoading(message:String,warning:Bool) {
      eventSubscriber?.SetLoadingScr(_showLoading: true,message: message,warning: warning)
    }
    
  public func ShowLoading() {
    eventSubscriber?.SetLoadingScr(_showLoading: true,message: "",warning: false)
  }

  public func HideLoading() {
    eventSubscriber?.SetLoadingScr(_showLoading: false,message: "",warning: false)
  }
    public func ShowAvatarGenerated(imageUrl: String,avatarUrl: String) {
      eventSubscriber?.ShowGeneratedAvatar(imageUrl: imageUrl, avatarUrl: avatarUrl)
    }
  public func ShowPopupMessage(message: String) {
    eventSubscriber?.ShowMessagePopup(message: message, showSimpleNot: true)
  }
      
  public func ShowProgressLoading(val:Double){
        eventSubscriber?.SetProgressLoadingScr(_showLoading: true,value: val)
  }
    
  public func HideProgressLoading(){
      eventSubscriber?.SetProgressLoadingScr(_showLoading: false, value: 1)
  }
    

    
//    public func SwitchPanel(selectedPanel: Tab)
//    {
//        eventSubscriber?.SwitchPanel(selectedPanel: selectedPanel)
//    }
    public func ShowResetPanel()
    {
        eventSubscriber?.ShowResetPanel()
    }
    public func HideRenderImgPanel()
    {
        eventSubscriber?.ShowRenderImage(show: false, url: "")
    }
    public func ShowRenderImgPanel(urlimg:String)
    {
        eventSubscriber?.ShowRenderImage(show: true, url: urlimg)
    }
    public func OnItemSelectUpdate()
    {
        eventSubscriber?.OnSelectDeselectItem()
    }
    public func SyncAvatars()
    {
        eventSubscriber?.OnSyncAvatars()
    }
}

protocol ApiEventSubscriber {
    func SetLoadingScr(_showLoading: Bool,message:String,warning:Bool)
    func ShowMessagePopup(message: String, showSimpleNot: Bool)
    
    func SetProgressLoadingScr(_showLoading:Bool,value:Double)
   // func SwitchPanel(selectedPanel:Tab)
    func ShowResetPanel()
    func Logout()
    func ShowRenderImage(show:Bool,url:String)
    func OnSelectDeselectItem()
    func OnSyncAvatars()
    func ShowGeneratedAvatar(imageUrl:String,avatarUrl:String)
}

