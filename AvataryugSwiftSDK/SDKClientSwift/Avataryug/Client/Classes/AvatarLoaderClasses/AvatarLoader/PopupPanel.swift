import SwiftUI

//Used for demo Perpose to show the error popup
struct PopupPanel: View {
  //Get Panel is visible
  @Binding var showSimpleNotificationPanel: Bool

  //Get or Set Error message
  var notificationText: String
  var body: some View {
    ZStack {
      Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.8))
      Rectangle()
        .fill(.white)
        .frame(width: UIScreen.main.bounds.width - 80, height: (UIScreen.main.bounds.height / 3.5))
        .cornerRadius(20)
        .overlay(content: {
          VStack {
            Spacer()
            Text(notificationText)
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
            Spacer()
            Button {
              showSimpleNotificationPanel = false
            } label: {
              Text("Ok")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.regular)
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width * 0.6, height: 50)
                .background(.green)
                .cornerRadius(8)
            }
            Spacer()
          }
        })
    }
    .ignoresSafeArea()
  }
}

//struct NotificationPanel_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationPanel()
//    }
//}
