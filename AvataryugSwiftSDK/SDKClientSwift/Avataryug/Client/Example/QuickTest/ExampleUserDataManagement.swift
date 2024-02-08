import SwiftUI
/// This ExampleUserDataManagement Class demonstrates API calling methods with temporary data.
struct ExampleUserDataManagement: View {
    var body: some View {
        VStack
        {
            CreatedTwoButton(ButtonOnename: "Get User Inventory", OnClickButtonOne: {
                print("GetUserInventory")
                ApiEvents.shared.ShowLoading()
                GetuserInventory()
            }, ButtonTwoname: "Get User All Avatars", OnClickButtonTwo: {
                print("GetUserAllAvatars")
                ApiEvents.shared.ShowLoading()
                GetUsersAllAvatar()
            })
            
            CreatedTwoButton(ButtonOnename: "Grant Instance To User", OnClickButtonOne: {
                print("GrantInstanceToUser")
                ApiEvents.shared.ShowLoading()
                GrantsInstanceToUser()
            }, ButtonTwoname: "Update User Avatars", OnClickButtonTwo: {
                print("UpdateUserAvatars")
                ApiEvents.shared.ShowLoading()
                UpdateUsersAvatar()
            })
            
            CreatedTwoButton(ButtonOnename: "Consume Instance", OnClickButtonOne: {
                print("ConsumeInstance")
                ApiEvents.shared.ShowLoading()
                ConsumeInstances()
            }, ButtonTwoname: "Purchase Instance", OnClickButtonTwo: {
                print("PurchaseInstance")
                ApiEvents.shared.ShowLoading()
                PurchasesInstance()
            })
            
            CreatedTwoButton(ButtonOnename: "ADD VIRTUALCURRENCY TO USER", OnClickButtonOne: {
                print("ADD VIRTUALCURRENCY TO USER")
                ApiEvents.shared.ShowLoading()
                AddVirtualCurrencyToUsers()
            }, ButtonTwoname: "SUBTRACT USER VIRTUALCURRENCY", OnClickButtonTwo: {
                print("SUBTRACT USER VIRTUALCURRENCY")
                ApiEvents.shared.ShowLoading()
                SubtractUsersVirtualCurrency()
            })
            
            CreatedTwoButton(ButtonOnename: "Add User Avatar", OnClickButtonOne: {
                print("AddUserAvatar")
                ApiEvents.shared.ShowLoading()
                AddUsersAvatar()
            }, ButtonTwoname: "Delete User Avatar", OnClickButtonTwo: {
                print("Delete User Avatar")
                ApiEvents.shared.ShowLoading()
                DeleteUsersAvatar()
            })
            
            CreatedTwoButton(ButtonOnename: "Confirm Purchase", OnClickButtonOne: {
                print("ConfirmPurchase")
                ApiEvents.shared.ShowLoading()
                ConfirmPurchase()
            }, ButtonTwoname: "Get Purchase", OnClickButtonTwo: {
                print("GetPurchase")
                ApiEvents.shared.ShowLoading()
                GetPurchase()
            })
            
            CreatedTwoButton(ButtonOnename: "Pay For Purchase", OnClickButtonOne: {
                print("PayForPurchase")
                ApiEvents.shared.ShowLoading()
                PayForPurchase()
            }, ButtonTwoname: "Unlock Container Instance", OnClickButtonTwo: {
                print("UnlockContainerInstance")
                ApiEvents.shared.ShowLoading()
                UnlockContainersInstance()
            })
        }
    }
    
    ///Retrieves the user's current inventory of virtual goods
    func GetuserInventory()
    {
        let auth = UserDataManagementHandler(ApiBase: GetUserInventory())
        auth.GetUserInventory { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetUserInventory-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetUserInventory-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Lists all of the avatars that belong to a specific user.
    func GetUsersAllAvatar()
    {
        let auth = UserDataManagementHandler(ApiBase: GetUsersAllAvatars())
        auth.GetUsersAllAvatars { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetUsersAllAvatars-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetUsersAllAvatars-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Adds the specified items to the specified user's inventory.
    func GrantsInstanceToUser()
    {
        let instanceIDs = [GrantInstanceToUserRequestInstanceIDsInner]()
        let auth = UserDataManagementHandler(ApiBase: GrantInstanceToUser(instanceIds: instanceIDs))
        auth.GrantInstanceToUser { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GrantInstanceToUser-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GrantInstanceToUser-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Update Avatar for the user.
    func UpdateUsersAvatar()
    {
        let auth = UserDataManagementHandler(ApiBase: UpdateUserAvatar(avatarID: "47394edb-6de4-46a8-97f9-40d04e4c687a", avatardata: ""))
        auth.UpdateUserAvatar { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UpdateUserAvatar-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UpdateUserAvatar-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Consume uses of a consumable item. When all uses are consumed, it will be removed from the user's inventory.
    func ConsumeInstances()
    {
        let auth = UserDataManagementHandler(ApiBase: ConsumeInstance(instanceCount: 1, ID: ""))
        auth.ConsumeInstance { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("ConsumeInstance-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("ConsumeInstance-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    /// Buys a single item with virtual currency.
    /// You must specify both the virtual currency to use to purchase, as well as what the client believes the price to be.
    /// This lets the server fail the purchase if the price has changed.
    func PurchasesInstance()
    {
        let auth = UserDataManagementHandler(ApiBase: PurchaseInstance(instanceID: "", instanceType: PurchaseInstanceRequest.InstanceType.bundle, virtualCurrency: "CC", prices: 10, storeid: ""))
        auth.PurchaseInstance { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("PurchaseInstance-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("PurchaseInstance-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Increments the user's balance of the specified virtual currency by the stated amount
    func AddVirtualCurrencyToUsers()
    {
        let auth = UserDataManagementHandler(ApiBase: AddVirtualCurrencyToUser(virtualCurrency: "CN", amount: 100))
        auth.AddVirtualCurrencyToUser { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("AddVirtualCurrencyToUser-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("AddVirtualCurrencyToUser-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    /// Decrements the user's balance of the specified virtual currency by the stated amount.
    /// It is possible to make a VC balance negative with this API.
    func SubtractUsersVirtualCurrency()
    {
        let auth = UserDataManagementHandler(ApiBase: SubtractUserVirtualCurrency(virtualCurrency: "CN", amount: 10))
        auth.SubtractUserVirtualCurrency { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("SubtractUserVirtualCurrency-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("SubtractUserVirtualCurrency-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    /// Add Avatar to the user
    func AddUsersAvatar()
    {
        let auth = UserDataManagementHandler(ApiBase: AddUserAvatar(avatarData: ""))
        auth.AddUserAvatar { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("AddUserAvatar-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("AddUserAvatar-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Delete specified Avatar for the user.
    func DeleteUsersAvatar()
    {
        let auth = UserDataManagementHandler(ApiBase: DeleteUser())
        auth.DeleteUserAvatar { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("DeleteUsersAvatar-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("DeleteUsersAvatar-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///
    func ConfirmPurchase()
    {
        if(ProjectSettings.shared.isDebug)
        {
            print("ConfirmPurchase-->>")
        }
        ApiEvents.shared.HideLoading()
    }
    
    
    func GetPurchase()
    {
        if(ProjectSettings.shared.isDebug)
        {
            print("GetPurchase-->>")
        }
        ApiEvents.shared.HideLoading()
    }
    
    func PayForPurchase()
    {
        if(ProjectSettings.shared.isDebug)
        {
            print("PayForPurchase-->>")
        }
        ApiEvents.shared.HideLoading()
    }
    
    ///Opens the specified container, with the specified key (when required), and returns the contents of the opened container.
    ///If the container (and key when relevant) are consumable (RemainingUses > 0), their RemainingUses will be decremented,
    ///consistent with the operation of ConsumeItem.
    func UnlockContainersInstance()
    {
        let auth = UserDataManagementHandler(ApiBase: UnlockContainerInstance(containerInstanceID: "containerInstanceID007836", keyInstanceID: "KeyInstanceSwift1292"))
        auth.UnlockContainerInstance { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UnlockContainerInstance-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("UnlockContainerInstance-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
}

struct ExampleUserDataManagement_Previews: PreviewProvider {
    static var previews: some View {
        ExampleUserDataManagement()
    }
}
