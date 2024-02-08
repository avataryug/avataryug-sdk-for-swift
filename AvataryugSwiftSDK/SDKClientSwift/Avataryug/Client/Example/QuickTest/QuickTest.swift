import SwiftUI
///This QuickTest Class demonstrates API calling methods using UI Button.
struct QuickTest: View
{
    @Binding var panelState:String
    var body: some View
    {
        ZStack
        {
            GeometryReader
            { g in
                ScrollView
                {
                    VStack(spacing:20)
                    {
                        Group
                        {
                            Divider()
                            HStack
                            {
                                Button
                                {
                                    panelState = "StartScreen"
                                }
                                label:
                                {
                                    Image(systemName: "chevron.backward")
                                        .frame(width: 45, height: 45)
                                        .font(.system(size: 24))
                                        .background(Color.white)
                                        .foregroundColor(.black)
                                        .cornerRadius(50)
                                        .shadow(radius: 1)
                                        .padding(.leading,2)
                                    
                                }
                                
                                Spacer()
                                Text("Authentication")
                                    .font(.system(size: 20))
                                    .fontWeight(.medium)
                                    .shadow(color:.gray,radius: 0.5, x:1,y:1)
                                    .padding(10)
                                Spacer()
                                Spacer()
                            }
                            
                            ExampleAuthentication()
                            Divider()
                            Text("User Account Management")
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                                .shadow(color:.gray,radius: 0.5, x:1,y:1)
                                .padding(10)
                            
                            ExampleUserAccountManagement()
                            Divider()
                            Text("Economy")
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                                .shadow(color:.gray,radius: 0.5, x:1,y:1)
                                .padding(10)
                            ExampleEconomy()
                            Divider()
                        }
                        Group
                        {
                            Text("User Data Management")
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                                .shadow(color:.gray,radius: 0.5, x:1,y:1)
                                .padding(10)
                            ExampleUserDataManagement()
                            Divider()
                            Text("Advertising")
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                                .shadow(color:.gray,radius: 0.5, x:1,y:1)
                                .padding(10)
                            ExampleAdvertising()
                            Divider()
                        }.frame(width:g.size.width)
                        
                        VStack
                        {
                            Text("Avatar Management")
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                                .shadow(color:Color(.systemGray2),radius: 0.5, x:1,y:1)
                                .padding(10)
                            ExampleAvatarmanagement()
                            Divider()
                        }.frame(width:g.size.width)
                    }
                }
            }
        }.background(Color(.white))
    }
}

struct QuickTest_Previews: PreviewProvider {
    static var previews: some View {
        let showScreen = Binding<String>(get: { "QuickTest" }, set: { _ in })
        QuickTest(panelState: showScreen)
    }
}
