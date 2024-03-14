import SwiftUI

@main
struct SDKClientSwiftApp: App ,ApiEventSubscriber
{
    func SetLoadingScr(_showLoading: Bool, message: String, warning: Bool) {
        
    }
    
    func SetProgressLoadingScr(_showLoading: Bool, value: Double) {
        
    }
    
    func ShowResetPanel() {
        
    }
    
    func Logout() {
        
    }
    
    func ShowRenderImage(show: Bool, url: String) {
        
    }
    
    func OnSelectDeselectItem() {
        
    }
    
    func OnSyncAvatars() {
        
    }
    
    func ShowGeneratedAvatar(imageUrl: String, avatarUrl: String) {
        
    }
    
    func ShowMessagePopup(message: String, showSimpleNot: Bool) {
        self.showSimpleNotificationPanel = showSimpleNot
        self.simpleNotificationMessage = message
    }
    
    
    @State private var showLoadingPanel = false
    
    @State private var showSimpleNotificationPanel = false
    
    @State private var simpleNotificationMessage = ""
    
    
    @State private var panelState = "StartScreen"
    
    func SetLoadingScr(_showLoading: Bool)
    {
        self.showLoadingPanel = _showLoading
    }
   
    var body: some Scene {
        WindowGroup {
            ZStack
            {
                switch panelState
                {
                case "StartScreen":
                    StartScreen(panelState: $panelState)
                    
                case "QuickTest":
                    QuickTest(panelState: $panelState)
                    
                case "AvataryugTest":
                    AvatarLoaderPanel(panelState: $panelState)
                    
                default:
                    StartScreen( panelState: $panelState)
                }

                if(showSimpleNotificationPanel)
                {
                    PopupPanel(showSimpleNotificationPanel: $showSimpleNotificationPanel, notificationText: simpleNotificationMessage)
                }
                if(showLoadingPanel)
                {
                    LoadingPanel()
                }
            }
            .onAppear
            {
                ApiEvents.shared.SetDelegate(subscriber: self)
                
            }
        }
    }
}
