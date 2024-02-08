import SwiftUI

///This ExampleAuthentication Class demonstrates API calling methods with temporary data.
struct ExampleAuthentication: View {
    var body: some View {
        VStack
        {
//            CreatedTwoButton(ButtonOnename: "LOGIN WITH CUSTOM ID", OnClickButtonOne: {
//                print("LOGIN WITH CUSTOM ID")
//                ApiEvents.shared.ShowLoading()
//                LoginwithCustomID()
//
//            }, ButtonTwoname: "LOGIN WITH ANDROID ID", OnClickButtonTwo: {
//                print("LOGIN WITH ANDROID IDl")
//                ApiEvents.shared.ShowLoading()
//                LoginwithAndroidDeviceID()
//
//            })

            CreatedTwoButton(ButtonOnename: "Create New Account", OnClickButtonOne: {
                
                print("Create New Account")
                ApiEvents.shared.ShowLoading()
                LoginwithCreateAccounts()
                
            }, ButtonTwoname: "LOGIN WITH Email", OnClickButtonTwo: {
                print("LOGIN WITH Email")
                ApiEvents.shared.ShowLoading()
                LoginwithEmail()
               
            })
            
            CreatedTwoButton(ButtonOnename: "LOGIN WITH Apple", OnClickButtonOne: {
                print("LOGIN WITH Apple")
                ApiEvents.shared.ShowLoading()
                LoginsWithApple()
                
            }, ButtonTwoname: "LOGIN WITH IOS Device ID", OnClickButtonTwo: {
                print("LOGIN WITH IOS Device ID")
                ApiEvents.shared.ShowLoading()
                LoginwithIOSDeviceID()
               
            })
            
            CreatedTwoButton(ButtonOnename: "LOGIN WITH Google", OnClickButtonOne: {
                print("LOGIN WITH Google")
                ApiEvents.shared.ShowLoading()
                LoginwithGoogle()
                
            }, ButtonTwoname: "LOGIN WITH facebook", OnClickButtonTwo: {
                print("LOGIN WITH facebook")
                ApiEvents.shared.ShowLoading()
                LoginwithFacebook()
               
            })
            
            CreatedButton(OnClickButton: {
                LoginwithCustomID()
                print("LOGIN WITH CUSTOM ID")
                ApiEvents.shared.ShowLoading()
            }, name: "LOGIN WITH CUSTOM ID")

        }
    }
    
    ///This method create account with android device id
    ///This takes any custom id  as input
    ///If account id already used then it directly login in your account
    func LoginwithCustomID()
    {
        let auth = AuthenticateHandler(ApiBase: LoginWithCustomID(customID: "MyCustomID", createAccount: true))
        
        auth.LoginWithCustomID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LoginwithCustomID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LoginwithCustomID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Signs the user in using the Android device identifier,
    ///Returning a session identifier that can subsequently be used for API calls which require an authenticated user
    func LoginwithAndroidDeviceID()
    {
        let auth = AuthenticateHandler(ApiBase: LoginWithAndroidDeviceID(androidDeviceID: "QuickTestAndroid", createAccount: true))
        
        auth.LoginWithAndroidDeviceID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LoginwithAndroidDeviceID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LoginwithAndroidDeviceID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    func generateRandomEmail() -> String {
        return String(format: "%@%@.com", generateRandomAlphabetString(length: 10), generateRandomAlphabetString(length: 10))
    }

    ///Gets a string from the English alphabet at random
    func generateRandomAlphabetString(length: Int) -> String {
        let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let chars = (0..<length).map { _ in
            allowedChars.randomElement()!
        }
        return String(chars)
    }

    func seedRandom() -> Int {
        return Int.random(in: Int.min...Int.max)
    }
    
    /// Register user with email id,
    /// Creating a session identifier for subsequent API calls that require an authenticated user.
    func LoginwithCreateAccounts()
    {
        
        var randomEmail = generateRandomEmail()
        if(ProjectSettings.shared.isDebug)
        {
            print(randomEmail)
        }
        
        let auth = AuthenticateHandler(ApiBase: RegisterUser(addDisplayName: "QuickTestIOS", emailID: randomEmail, password: "12"))
        
        auth.RegisterUser { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("RegisterUser-->>",success.encodeToJSON())
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("RegisterUser-->>",failure.localizedDescription.encodeToJSON())
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Signs the user into the Avataryug account, returning a session identifier that can subsequently be used for API calls which require an authenticated user.
    ///Unlike most other login API calls, LoginWithEmailAddress does not permit the creation of new accounts via the CreateAccountFlag.
    func LoginwithEmail()
    {
        let auth = AuthenticateHandler(ApiBase: LoginWithEmailAddress(password: "12", createAccount: true, emailID: "gofoto9456@extemer.com"))
  
        auth.LoginWithEmailAddress { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LoginWithEmailAddress-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LoginWithEmailAddress-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Signs in the user using an identity token obtained from Sign in with Apple,
    ///returning a session identifier that can subsequently be used for API calls which require an authenticated user.
    func LoginsWithApple()
    {
        let auth = AuthenticateHandler(ApiBase: LoginWithApple(appleIdentityToken: "Token10190", createAccount: true, appleID: "PineApple1923"))
  
        auth.LoginWithApple { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LoginWithApple-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LoginWithApple-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Signs the user in using the vendor-specific iOS device identifier,
    ///returning a session identifier that can subsequently be used for API calls which require an authenticated user.
    func LoginwithIOSDeviceID()
    {
        let auth = AuthenticateHandler(ApiBase: LoginWithIOSDeviceID(iOSDeviceID: "IOSPIOS0101", createAccount: true))
  
        auth.LoginWithIOSDeviceID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LoginWithIOSDeviceID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LoginWithIOSDeviceID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Signs the user in using their Google account credentials,
    ///returning a session identifier that can subsequently be used for API calls which require an authenticated user.
    func LoginwithGoogle()
    {
        let auth = AuthenticateHandler(ApiBase: LoginWithGoogle(googleServerAuthCode: "AUTH10101", createAccount: true, googleID: "IDGOOGLEDOGGLE0101"))
  
        auth.LoginWithGoogle { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LoginWithFacebook-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LoginWithFacebook-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Signs the user in using a Facebook access token,
    ///returning a session identifier that can subsequently be used for API calls which require an authenticated user.
    func LoginwithFacebook()
    {
        let auth = AuthenticateHandler(ApiBase: LoginWithFacebook(fbAccessToken: "FBTOKEN294701", createAccount: true, facebookID: "FBID102102"))
  
        auth.LoginWithFacebook { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LoginWithFacebook-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LoginWithFacebook-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
}

struct ExampleAuthentication_Previews: PreviewProvider {
    static var previews: some View {
        ExampleAuthentication()
    }
}
