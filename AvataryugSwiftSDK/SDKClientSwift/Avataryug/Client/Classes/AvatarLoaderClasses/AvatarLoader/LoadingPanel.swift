import SwiftUI

//Used to show loading Screen in demo.
struct LoadingPanel: View {
  var body: some View {
    ZStack {
      Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.7))
      ProgressView()
        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
        .scaleEffect(2)
    }.ignoresSafeArea()
  }
}

struct LoadingPanel_Previews: PreviewProvider {
  static var previews: some View {
    LoadingPanel()
  }
}
