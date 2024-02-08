import SceneKit
import SwiftUI

// This is Example Scene
// Login and it will load default models
// Example button will add change models
struct AvatarLoaderPanel: View {

  @State private var isLoginComplete = false
  @State private var customizeAvatar = CustomizeAvatarLoader()
  @Binding var panelState: String
  var body: some View {
    if isLoginComplete {
      ZStack {
        VStack {
            HStack
            {
                Button {
                    customizeAvatar.ResetToDefault()
                    isLoginComplete = false
                } label: {
                    Image(systemName: "chevron.backward")
                        .frame(width: 45, height: 45)
                        .font(.system(size: 24))
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(50)
                        .shadow(radius: 1)
                        .padding(.leading, 2)
                }
                
                Spacer()
                Text("Avatar Loader")
                    .textCase(.uppercase)
                    .frame(width: 200, height: 40)
                    .font(.system(size: 25))
                    .background(.clear)
                    .foregroundColor(.black)
                    .shadow(radius: 1)
                    .padding(3)
                Spacer()
                Spacer()
            }
        
          SceneView(
            scene: AvataryugData.shared.sceneView,
            options: [.autoenablesDefaultLighting, .allowsCameraControl])
          HStack {

          }
          Rectangle()
            .fill(Color.white)
            .frame(width: UIScreen.main.bounds.width, height: 50)
            .overlay {
              HStack {
                Button {
                  LoadCategoryItems(
                    cat: Category.Top.rawValue,
                    completionHandler: {
                    })
                } label: {
                  Text("Top")
                    .frame(width: 100, height: 40)
                    .font(.headline)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .shadow(radius: 1)
                    .padding(3)
                }.cornerRadius(1)
                  .frame(height: 5)

                Button {
                  LoadCategoryItems(
                    cat: Category.Bottom.rawValue,
                    completionHandler: {

                    })
                } label: {
                  Text("Bottom")
                    .frame(width: 100, height: 40)
                    .font(.headline)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .shadow(radius: 1)
                    .padding(3)
                }.cornerRadius(1)
                  .frame(height: 5)

                Button {
                    let text = "For additional categories, please refer to the demo project or consult the documentation for more information"
                  ApiEvents.shared.ShowPopupMessage(message: text)
                } label: {
                  Text("More")
                    .frame(width: 100, height: 40)
                    .font(.headline)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .shadow(radius: 1)
                    .padding(3)
                }.cornerRadius(1)
                  .frame(height: 5)
              }
            }
        }
      }.onAppear {
        customizeAvatar.SetupNodeInScene {
          customizeAvatar.LoadHeadModel {
            customizeAvatar.ResetToDefault()
          }
        }
      }
    } else {
      ZStack {
        Rectangle()
          .fill(Color(.systemGray2))

        VStack {
          HStack(spacing: 5){
              HStack {
                Button {
                  panelState = "StartScreen"
                } label: {
                  Image(systemName: "chevron.backward")
                    .frame(width: 45, height: 45)
                    .font(.system(size: 24))
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(50)
                    .shadow(radius: 1)
                    .padding(.leading, 2)
                }
              }.padding(5)
            Spacer()
          }
            VStack {
                
            }.frame(height: 120)
         
            VStack {
              Text("Avataryug")
                .font(.system(size: 45))
                .background(Color.clear)
                .foregroundColor(.black)
                .shadow(color: .white, radius: 0.1, x: 2, y: 1)
              Text("SDK")
                .font(.system(size: 22))
                .background(Color.clear)
                .foregroundColor(.black)
                .shadow(color: .white, radius: 0.1, x: 2, y: 1)
                
            }.frame(height: 90)
            Spacer()
        }

        VStack {
          Spacer()
          Button {
            ApiEvents.shared.ShowLoading()
            let auth = AuthenticateHandler(
              ApiBase: LoginWithCustomID(customID: "testid", createAccount: true))
            auth.LoginWithCustomID(completionHandler: {
              (response) in
              switch response
              {
              case .success(let success):
                  if(ProjectSettings.shared.isDebug)
                  {
                      print(success)
                  }
                isLoginComplete = true
                ApiEvents.shared.HideLoading()
              case .failure(let failure):
                  if(ProjectSettings.shared.isDebug)
                  {
                      print(failure)
                  }
              }
            })
          } label: {
            Text("Login")
              .frame(width: UIScreen.main.bounds.width, height: 40)
              .font(.headline)
              .background(Color.white)
              .foregroundColor(.black)
          }
          .shadow(radius: 1)
          .frame(height: 5)
        }
      }
    }
  }

  func LoadCategoryItems(cat: String, completionHandler: @escaping () -> Void) {
    var gender = 1
    if customizeAvatar.GetGender() == .Female {
      gender = 2
    }
    if customizeAvatar.GetGender() == .Male {
      gender = 1
    }
    if AvataryugData.shared.IsCommonGender(category: cat)! {
      gender = 3
    }

    let loadeconomy = EconomyHandler(
      ApiBase: GetEconomyItems(category: cat, status: 1, gender: gender))

    loadeconomy.GetEconomyItems(completionHandler: {
      (response) in
      switch response
      {
      case .success(let success):
        if success.data!.count > 0 {
          let randomInt = Int.random(in: 0..<success.data!.count)
          customizeAvatar.LoadNetworkModel(modelData: success.data![randomInt], undo: false)
          completionHandler()
        } else {
          completionHandler()
        }
      case .failure(let failure):
          if(ProjectSettings.shared.isDebug)
          {
              print(failure)
          }
        ApiEvents.shared.HideLoading()
        ApiEvents.shared.ShowPopupMessage(message: failure.localizedDescription)
      }
    })
  }
}

struct AvatarLoaderPanel_Previews: PreviewProvider {
  static var previews: some View {
    let showScreen = Binding<String>(get: { "StartScreen" }, set: { _ in })
    AvatarLoaderPanel(panelState: showScreen)
  }
}
