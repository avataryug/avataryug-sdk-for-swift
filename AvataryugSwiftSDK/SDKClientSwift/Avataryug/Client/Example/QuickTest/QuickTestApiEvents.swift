import Foundation
class QuickTestApiEvents
{
    static let shared = QuickTestApiEvents()
    
    private var eventSubscriber : QuickTestApiEventSubscriber?
    
    public func SetDelegate(subscriber : QuickTestApiEventSubscriber)
    {
        eventSubscriber = subscriber
    }
    
    private init(){}
    
    public func QuickTestShowLoading()
    {
        eventSubscriber?.QuickTestSetLoadingScr(_showLoading: true)
    }
    
    public func QuickTestHideLoading()
    {
        eventSubscriber?.QuickTestSetLoadingScr(_showLoading: false)
    }
 
    public func QuickTestShowNotificationMessage(message :String)
    {
        eventSubscriber?.QuickTestShowSimpleNotification(message: message, showSimpleNot: true)
    }
}
protocol QuickTestApiEventSubscriber{
    func QuickTestSetLoadingScr(_showLoading:Bool)
    func QuickTestShowSimpleNotification(message:String,showSimpleNot:Bool)
}
