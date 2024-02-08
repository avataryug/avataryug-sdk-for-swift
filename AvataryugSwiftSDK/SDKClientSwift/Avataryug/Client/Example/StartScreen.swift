import SwiftUI
///This class is used to show selected scene/ view
struct StartScreen: View {
//    @Binding var showAvataryugTestScreen:Bool
//    @Binding var showQuickTestScreen:Bool
    @Binding var panelState:String
    var body: some View {
        ZStack
        {
            Text("Select the Scene To load")
                .textCase(.uppercase)
                .font(.system(size: 20))
                .fontWeight(.regular)
                .padding(.bottom,300)
                
            VStack(spacing:30)
            {
                Button
                {
//                    showQuickTestScreen = true
                    panelState = "QuickTest"
                }
                label:
                {
                    Text("Quick Test")
                        .textCase(.uppercase)
                        .foregroundColor(Color(.black))
                        .frame(width: 250, height: 50)
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [ Color(.white),Color(.systemGray5)]), startPoint: .top, endPoint:.bottom)
                                .overlay(
                                    Rectangle()
                                        .stroke(Color(.systemGray2), lineWidth: 1)
                                )
                        )
                }
                    
                Button
                {
//                  showAvataryugTestScreen = true
                    panelState = "AvataryugTest"
                }
                label:
                {
                    Text("Avatar Loader")
                        .textCase(.uppercase)
                        .foregroundColor(Color(.black))
                        .frame(width: 250, height: 50)
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [ Color(.white),Color(.systemGray5)]), startPoint: .top, endPoint: .bottom)
                                .overlay(
                                    Rectangle()
                                        .stroke(Color(.systemGray2), lineWidth: 1)
                                )
                        )
                }
           }
        }.frame(width: UIScreen.main.bounds.width)
    }
}

struct StartScreen_Previews: PreviewProvider {
  
    static var previews: some View {
        let showTestScreenBinding = Binding<Bool>(get: { false }, set: { _ in })
        let showQuickTestScreen = Binding<Bool>(get: { false }, set: { _ in })
        let showScreen = Binding<String>(get: { "StartScreen" }, set: { _ in })
        // Pass the Binding instance to the StartScreen
        StartScreen(panelState: showScreen)
    }
}
