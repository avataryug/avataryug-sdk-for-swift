import SwiftUI

@main
struct SDKClientSwiftApp: App ,ApiEventSubscriber
{
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
//                StartScreen(showAvataryugTestScreen: $showAvataryugTestScreen, showQuickTestScreen: $showQuickTestScreen)
//                if(showAvataryugTestScreen)
//                {
//
//                    AvataryugTest()
//                }
//                if(showQuickTestScreen)
//                {
//                    QuickTest()
//                }
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
