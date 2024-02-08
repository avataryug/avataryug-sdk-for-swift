import SwiftUI
/// This ExampleAdvertising Class demonstrates API calling methods with temporary data.
struct ExampleAdvertising: View {
    var body: some View {
        VStack
        {
            CreatedTwoButton(ButtonOnename: "GET AD PLACEMENT BY ID", OnClickButtonOne: {
                print("GET AD PLACEMENT BY ID")
                ApiEvents.shared.ShowLoading()
                GetAdsPlacementByID()
            }, ButtonTwoname: "GRANTS ADS REWARD", OnClickButtonTwo: {
                print("GRANTS ADS REWARD")
                ApiEvents.shared.ShowLoading()
                GrantsAdsReward()
            })
            
            CreatedButton(OnClickButton: {
                print("RECORDS ADS ACTIVITY")
                ApiEvents.shared.ShowLoading()
                RecordsAdsActivity()
            }, name: "RECORDS ADS ACTIVITY")
        }
    }
    
    
    ///Retrieves a list of ad placements by ID.
    func GetAdsPlacementByID()
    {
        let auth = AdvertisingHandler(ApiBase: GetAdPlacementByID(placementID: "a363728f-db74-425b-8f45-942e4c8f2a77"))
        auth.GetAdPlacementByID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetAdPlacementByID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetAdPlacementByID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Grants rewards for ads.
    func GrantsAdsReward()
    {
        let auth = AdvertisingHandler(ApiBase: GrantAdsReward(placementID: "a363728f-db74-425b-8f45-942e4c8f2a77"))
        auth.GrantAdsReward { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GrantAdsReward-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GrantAdsReward-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Stores ads activity data for reporting after ad watch.
    func RecordsAdsActivity()
    {
        let auth = AdvertisingHandler(ApiBase: RecordAdsActivity(revenueCurrency: "CC", adRevenue: 20, placementID: "a363728f-db74-425b-8f45-942e4c8f2a77"))
        auth.RecordAdsActivity { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("RecordAdsActivity-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("RecordAdsActivity-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
}

struct ExampleAdvertising_Previews: PreviewProvider {
    static var previews: some View {
        ExampleAdvertising()
    }
}
