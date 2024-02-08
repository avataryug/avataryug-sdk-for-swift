import SwiftUI
/// This ExampleEconomy Class demonstrates API calling methods with temporary data.
struct ExampleEconomy: View {
    let itemCategory: [String] = [
        "LeftHandTattoo", "RightHandTattoo", "LeftArmTattoo", "RightArmTattoo", "LeftFootTattoo", "RightFootTattoo",
        "FrontLeftLegTattoo", "FrontRightLegTattoo", "BackBodyTattoo", "FrontBodyTattoo", "BackLeftLegTattoo",
        "BackRightLegTattoo", "HeadTattoo", "FaceShape", "EyeShape", "EyebrowShape", "NoseShape", "LipShape", "EarShape",
        "Hair", "Eyebrow", "Lips", "Facialhair", "Headwear", "Eyewear", "Eyeball", "Mouthwear", "Earwear", "Eyebrowswear",
        "Facewear", "Neckwear", "Nosewear", "Top", "Bottom", "Outfit", "Footwear", "Handwear", "Wristwear", "SkinTone"
    ]
    var body: some View {
        VStack
        {
            CreatedTwoButton(ButtonOnename: "get economy items top", OnClickButtonOne: {
                print("get economy items top")
                ApiEvents.shared.ShowLoading()
                GetEconomyItem()
            }, ButtonTwoname: "get economy items by id", OnClickButtonTwo: {
                print("get economy items by ids")
                ApiEvents.shared.ShowLoading()
                GetEconomyItemsbyIds()
            })
            CreatedTwoButton(ButtonOnename: "get economy bundles", OnClickButtonOne: {
                print("get economy bundles")
                ApiEvents.shared.ShowLoading()
                GetBundles()
            }, ButtonTwoname: "get economy bundles by id", OnClickButtonTwo: {
                print("get economy bundles by ids")
                ApiEvents.shared.ShowLoading()
                GetBundlesByIDs()
            })
            CreatedTwoButton(ButtonOnename: "get economy containers", OnClickButtonOne: {
                print("get economy containers")
                ApiEvents.shared.ShowLoading()
                GetContainers()
            }, ButtonTwoname: "get economy containers by id", OnClickButtonTwo: {
                print("get economy containers by ids")
                ApiEvents.shared.ShowLoading()
                GetContainersByIDs()
            })
            CreatedTwoButton(ButtonOnename: "get economy store", OnClickButtonOne: {
                print("get economy store top")
                ApiEvents.shared.ShowLoading()
                GetEconomyStore()
            }, ButtonTwoname: "get economy store by id", OnClickButtonTwo: {
                print("get economy store by ids")
                ApiEvents.shared.ShowLoading()
                GetEconomyStoreById()
            })
        }
    }
    
    ///Get Economy Items
    func GetEconomyItem()
    {
//        let category = itemCategory[Int.random(in: 0..<itemCategory.count)]
//        var gender = 1
//
//        if category == Category.Top.rawValue || category == Category.Bottom.rawValue || category == Category.Outfit.rawValue {
//            // Do something if the category is "Top", "Bottom", or "Outfit"
//        } else {
//            gender = 3
//        }
        
        let auth = EconomyHandler(ApiBase: GetEconomyItems(category: Category.Bottom.rawValue, status: 1, gender: 1))
        auth.GetEconomyItems { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetEconomyItems-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetEconomyItems-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Get Economy Item by ID
    func GetEconomyItemsbyIds()
    {
        let auth = EconomyHandler(ApiBase: GetEconomyItemsByID(itemID: "00261441-df90-48e7-bd75-87ecac29e303"))
        auth.GetEconomyItemsByID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetEconomyItemsByID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetEconomyItemsByID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Get Economy Bundles
    func GetBundles()
    {
        let auth = EconomyHandler(ApiBase: GetEconomyBundles(bundleStatus: EconomyAPI.Status_getEconomyBundles._1))
        auth.GetEconomyBundles { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetEconomyBundles-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetEconomyBundles-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    /// Get Economy Bundles by ID
    func GetBundlesByIDs()
    {
        let auth = EconomyHandler(ApiBase: GetEconomyBundleByID(bundleID: "1d90bb1e-6370-44e8-b692-a1619391d2a3"))
        auth.GetEconomyBundleByID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetEconomyBundleByID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetEconomyBundleByID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Get Economy Containers
    func GetContainers()
    {
        let auth = EconomyHandler(ApiBase: GetEconomyContainers(containersStatus: EconomyAPI.Status_getEconomyContainers._1))
        auth.GetEconomyContainers { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetEconomyContainers-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetEconomyContainers-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Get Economy Container by ID
    func GetContainersByIDs()
    {
        let auth = EconomyHandler(ApiBase: GetEconomyContainerByID(containerID: "d9c055e5-f9a1-4c9c-8586-da7c9b2ce041"))
        auth.GetEconomyContainerByID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetEconomyContainerByID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetEconomyContainerByID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Get Economy Stores
    func GetEconomyStore()
    {
        let auth = EconomyHandler(ApiBase: GetEconomyStores(storesStatus: EconomyAPI.Status_getEconomyStores._1))
        auth.GetEconomyStores { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetEconomyStores-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetEconomyStores-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Retrieves the set of items defined for the specified store, including all prices defined
    func GetEconomyStoreById()
    {
        let auth = EconomyHandler(ApiBase: GetStoreItemsByID(storeID: "252a6e92-9def-429c-81ec-bad861493510"))
        auth.getStoreItemsByID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetEconomyStoreById-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetEconomyStoreById-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
}

struct ExampleEconomy_Previews: PreviewProvider {
    static var previews: some View {
        ExampleEconomy()
    }
}
