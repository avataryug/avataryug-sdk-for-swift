import SwiftUI
/// This ExampleUserAccountManagement Class demonstrates API calling methods with temporary data.
struct ExampleUserAccountManagement: View {
    
    @State var ids:String = ""
    var body: some View {
     VStack
        {
            Group{
                CreatedTwoButton(ButtonOnename: "LINK Custom Id", OnClickButtonOne: {
                    print("Clicked--->>Linked Custom Id")
                    ApiEvents.shared.ShowLoading()
                    LinkCustomsID()
                }, ButtonTwoname: "UNLINK Custom Id", OnClickButtonTwo: {
                    print("Clicked--->>Unlinked Custom Id")
                    ApiEvents.shared.ShowLoading()
                    UnlinkCustomsID()
                })
                
//                CreatedTwoButton(ButtonOnename: "LINK ANDROID DEVICE", OnClickButtonOne: {
//                    print("Clicked--->>Linked ANDROID DEVICE")
//                    ApiEvents.shared.ShowLoading()
//                    LinkAndroidDevice()
//                }, ButtonTwoname: "UNLINK ANDROID DEVICE", OnClickButtonTwo: {
//                    print("Clicked--->>Unlinked ANDROID DEVICE")
//                    UnLinkAndroidDevice()
//                })
                
                CreatedTwoButton(ButtonOnename: "LINK Apple", OnClickButtonOne: {
                    print("Clicked--->>Linked Apple")
                    ApiEvents.shared.ShowLoading()
                    LinksApple()
                }, ButtonTwoname: "UNLINK Apple", OnClickButtonTwo: {
                    print("Clicked--->>Unlinked Apple")
                    ApiEvents.shared.ShowLoading()
                    UnLinksApple()
                })
                
                CreatedTwoButton(ButtonOnename: "LINK IOS Device", OnClickButtonOne: {
                    print("Clicked--->>Linked IOS Device")
                    ApiEvents.shared.ShowLoading()
                    LinkIosDevice()
                }, ButtonTwoname: "UNLINK IOS Device", OnClickButtonTwo: {
                    print("Clicked--->>Unlinked IOS Device")
                    ApiEvents.shared.ShowLoading()
                    UnlinkIosDevice()
                })
                
                CreatedTwoButton(ButtonOnename: "LINK Google Account", OnClickButtonOne: {
                    print("Clicked--->>Linked Google Account")
                    ApiEvents.shared.ShowLoading()
                    LinkGoogle()
                    
                }, ButtonTwoname: "UNLINK Google Account", OnClickButtonTwo: {
                    print("Clicked--->>Unlinked Google Account")
                    ApiEvents.shared.ShowLoading()
                    UnlinkGoogle()
                })
                
                CreatedTwoButton(ButtonOnename: "LINK Facebook Account", OnClickButtonOne: {
                    print("Clicked--->>Linked Facebook Account")
                    ApiEvents.shared.ShowLoading()
                    LinkFB()
                }, ButtonTwoname: "UNLINK Facebook Account", OnClickButtonTwo: {
                    print("Clicked--->>Unlinked Facebook Account")
                    ApiEvents.shared.ShowLoading()
                    UnlinkFB()
                })
                CreatedTwoButton(ButtonOnename: "LINK Generic", OnClickButtonOne: {
                    print("Clicked--->>linked Generic")
                    ApiEvents.shared.ShowLoading()
                    AddGenericService()
                }, ButtonTwoname: "UNLINK Generic service id", OnClickButtonTwo: {
                    print("Clicked--->>Unlinked Generic service id")
                    ApiEvents.shared.ShowLoading()
                    RemoveGenericService()
                })
                
                CreatedTwoButton(ButtonOnename: "UPDATE PROJECT DISPLAY NAME", OnClickButtonOne: {
                    print("Clicked--->>UPDATE PROJECT DISPLAY NAME")
                    ApiEvents.shared.ShowLoading()
                    UpdateProjectDisplayName()
                }, ButtonTwoname: "GET USER ACCOUNT INFO", OnClickButtonTwo: {
                    print("Clicked--->>GET USER ACCOUNT INFO")
                    ApiEvents.shared.ShowLoading()
                    GetUserAccountsInfo()
                })
                
                CreatedTwoButton(ButtonOnename: "UPDATE USER DEMOGRAPHIC", OnClickButtonOne: {
                    print("Clicked--->>UPDATE USER DEMOGRAPHIC")
                    ApiEvents.shared.ShowLoading()
                    UpdateUsersDemographic()
                }, ButtonTwoname: "GET USER PROFILE", OnClickButtonTwo: {
                    print("Clicked--->>GET USER PROFILE")
                    ApiEvents.shared.ShowLoading()
                    GetUsersProfile()
                })
                
                CreatedTwoButton(ButtonOnename: "DeleteUser", OnClickButtonOne: {
                    print("DeleteUser")
                    ApiEvents.shared.ShowLoading()
                    DeleteUsers()
                }, ButtonTwoname: "Update Default AvatarID", OnClickButtonTwo: {
                    print("Clicked--->>Update Default Avatar ID")
                    ApiEvents.shared.ShowLoading()
                    UpdateDefaultAvatarsID()
                })
            }
            Group{
                CreatedButton(OnClickButton: {
                    print("Clicked--->>ChangePassword")
                    ApiEvents.shared.ShowLoading()
                    Changepassword()
                }, name: "ChangePassword")
            }
        }
    }
    
    ///Links the custom identifier, generated by the Project, to the user's Avataryug account
    func LinkCustomsID()
    {
        let auth = UserAccountManagementHandler(ApiBase: LinkCustomID(customID: "CustomID2457", forceLink: true))
        auth.LinkCustomID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LinkCustomID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LinkCustomID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Unlinks the related custom identifier from the user's Avataryug account
    func UnlinkCustomsID()
    {
        let auth = UserAccountManagementHandler(ApiBase: UnlinkCustomID())
        auth.UnlinkCustomID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UnlinkCustomID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UnlinkCustomID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Links the Android device identifier to the user's Avataryug account
    func LinkAndroidDevice()
    {
        let auth = UserAccountManagementHandler(ApiBase: LinkAndroidDeviceID(androidDeviceID: "ANDROIDID01312000", forceLink: true))
        auth.LinkAndroidDeviceID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LinkAndroidDeviceID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LinkAndroidDeviceID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Unlinks the related Android device identifier from the user's Avataryug account
    func UnLinkAndroidDevice()
    {
        let auth = UserAccountManagementHandler(ApiBase: UnlinkAndroidDeviceID())
        auth.UnlinkAndroidDeviceID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UnlinkAndroidDeviceID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UnlinkAndroidDeviceID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Links the Apple account associated with the token to the user's Avataryug account.
    func LinksApple()
    {
        let auth = UserAccountManagementHandler(ApiBase: LinkApple(appleID: "AppleId2545", forceLink: true, identityToken: "IdentityToken244"))
        auth.LinkApple { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LinkApple-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LinkApple-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Unlinks the related Apple account from the user's Avataryug account.
    func UnLinksApple()
    {
        let auth = UserAccountManagementHandler(ApiBase: UnlinkApple())
        auth.UnlinkApple { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UnlinkApple-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UnlinkApple-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Links the vendor-specific iOS device identifier to the user's Avataryug account.
    func LinkIosDevice()
    {
        let auth = UserAccountManagementHandler(ApiBase: LinkIOSDeviceID(deviceID: "DeviceID56565", forceLink: true))
        auth.LinkIOSDeviceID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LinkIOSDeviceID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LinkIOSDeviceID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Unlinks the related iOS device identifier from the user's Avataryug account.
    func UnlinkIosDevice()
    {
        let auth = UserAccountManagementHandler(ApiBase: UnlinkIOSDeviceID())
        auth.UnlinkIOSDeviceID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UnlinkIOSDeviceID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UnlinkIOSDeviceID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Links the currently signed-in user account to their Google account, using their Google account credentials.
    func LinkGoogle()
    {
        let auth = UserAccountManagementHandler(ApiBase: LinkGoogleAccount(googleID: "ewtwt3we5t", forceLink: true, googleServerAuthCode: "dgtetet"))
        auth.LinkGoogleAccount { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LinkGoogleAccount-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LinkGoogleAccount-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Unlinks the related Google account from the user's Avataryug account.
    func UnlinkGoogle()
    {
        let auth = UserAccountManagementHandler(ApiBase: UnlinkGoogleAccount())
        auth.UnlinkGoogleAccount { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UnlinkGoogleAccount-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UnlinkGoogleAccount-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Links the Facebook account associated with the provided Facebook access token to the user's Avataryug account.
    func LinkFB()
    {
        let auth = UserAccountManagementHandler(ApiBase: LinkFacebookAccount(accessToken: "iofsaiof", forceLink: true, facebookID: "FBID38769865"))
        auth.LinkFacebookAccount { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LinkFacebookAccount-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("LinkFacebookAccount-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    
    ///Unlinks the related Facebook account from the user's Avataryug account.
    func UnlinkFB()
    {
        let auth = UserAccountManagementHandler(ApiBase: UnlinkFacebookAccount())
        auth.UnlinkFacebookAccount { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UnlinkFacebookAccount-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UnlinkFacebookAccount-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    /// Adds the specified generic service identifier to the user's Avataryug account.
    /// This is designed to allow for a Avataryug ID lookup of any arbitrary service identifier a Project wants to add.
    /// This identifier should never be used as authentication credentials, as the intent is that it is easily accessible by other users.
    func AddGenericService()
    {
        let auth = UserAccountManagementHandler(ApiBase: AddGenericServiceID(genericServiceID: "GenericServiceID27489126" ))
        auth.AddGenericServiceID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("AddGenericServiceID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("AddGenericServiceID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Removes the generic service identifier from the user's Avataryug account.
    func RemoveGenericService()
    {
        let auth = UserAccountManagementHandler(ApiBase: RemoveGenericServiceID())
        auth.RemoveGenericServiceID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("RemoveGenericServiceID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("RemoveGenericServiceID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Updates the display name for the user in the project.
    func UpdateProjectDisplayName()
    {
        let auth = UserAccountManagementHandler(ApiBase: UpdateUserProjectDisplayName(displayName: "IOSSDKTest010" ))
        auth.UpdateUserProjectDisplayName { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UpdateUserProjectDisplayName-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UpdateUserProjectDisplayName-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Retrieves information about the user's account.
    func GetUserAccountsInfo()
    {
        let auth = UserAccountManagementHandler(ApiBase: GetUserAccountInfo())
        auth.GetUserAccountInfo { response in
            switch response {
            case .success(let success):
                ids = (success.data?.userID)!
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetUserAccountInfo-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetUserAccountInfo-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Updates user demographic information.
    func UpdateUsersDemographic()
    {
        let auth = UserAccountManagementHandler(ApiBase: UpdateUserDemographics(gender: "3", ageRange: "20-24", race: "Asian"))
        auth.UpdateUserDemographics { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UpdateUsersDemographic-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UpdateUsersDemographic-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Retrieves the user's public profile information.
    func GetUsersProfile()
    {
        let auth = UserAccountManagementHandler(ApiBase: GetUserProfile(userID: ids))
        auth.GetUserProfile { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetUserProfile-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetUserProfile-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Delete User Account from Avataryug platform.
    func DeleteUsers()
    {
        let auth = UserAccountManagementHandler(ApiBase: DeleteUser())
        auth.DeleteUser { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("DeleteUsers-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("DeleteUsers-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Sets the default avatar ID to users account.
    func UpdateDefaultAvatarsID()
    {
        let auth = UserAccountManagementHandler(ApiBase: UpdateDefaultAvatarID(defualtAvatarID: "47394edb-6de4-46a8-97f9-40d04e4c687a" ))
        auth.UpdateDefaultAvatarID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UpdateDefaultAvatarID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UpdateDefaultAvatarID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Allows users to change their password.
    func Changepassword()
    {
        let auth = UserAccountManagementHandler(ApiBase: ChangePassword(oldPassword: "12", newPassword: "123"))
        auth.ChangePassword { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("Changepassword-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("Changepassword-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
}

struct ExampleUserAccountManagement_Previews: PreviewProvider {
    static var previews: some View {
        ExampleUserAccountManagement(ids: "")
    }
}

struct CreatedButton: View {
    var OnClickButton: () -> ()
    var name:String
    var body: some View
    {
        
        Button
        {
            OnClickButton()
        }
    label:
        {
            Text(name)
                .textCase(.uppercase)
                .foregroundColor(Color(.black))
                .frame(width: 180, height: 35)
                .font(.system(size: 12))
                .fontWeight(.medium)
                .background(
                    LinearGradient(gradient: Gradient(colors: [ Color(.white),Color(.systemGray6)]), startPoint: .top, endPoint: .bottom)
                        .overlay(
                            Rectangle()
                                .stroke(Color(.systemGray2), lineWidth: 0.5)
                        )
                )
        }
        
    }
}
struct CreatedTwoButton: View {
    var ButtonOnename:String
    var OnClickButtonOne: () -> ()
    var ButtonTwoname:String
    var OnClickButtonTwo: () -> ()

    var body: some View
    {
        HStack
        {
            Button
            {
                OnClickButtonOne()
            }
            label:
            {
                Text(ButtonOnename)
                    .textCase(.uppercase)
                    .foregroundColor(Color(.black))
                    .frame(width: 180, height: 35)
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [ Color(.white),Color(.systemGray6)]), startPoint: .top, endPoint: .bottom)
                            .overlay(
                                Rectangle()
                                    .stroke(Color(.systemGray2), lineWidth: 0.5)
                            )
                    )
            }

            Button
            {
                OnClickButtonTwo()
            }
            label:
            {
                Text(ButtonTwoname)
                    .textCase(.uppercase)
                    .foregroundColor(Color(.black))
                    .frame(width: 180, height: 35)
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [ Color(.white),Color(.systemGray6)]), startPoint: .top, endPoint: .bottom)
                            .overlay(
                                Rectangle()
                                    .stroke(Color(.systemGray2), lineWidth: 0.5)
                            )
                    )
            }

        }
    }
}

