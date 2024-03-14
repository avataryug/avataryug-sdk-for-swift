import SwiftUI
/// This ExampleAvatarmanagement Class demonstrates API calling methods with temporary data.
struct ExampleAvatarmanagement: View {
    var body: some View {
        VStack
        {
            CreatedTwoButton(ButtonOnename: "Generate Avatar Mesh", OnClickButtonOne: {
                print("GenerateAvatarMesh")
                ApiEvents.shared.ShowLoading()
                GeneratesAvatarMesh()
            }, ButtonTwoname: "Get Avatar Presets", OnClickButtonTwo: {
                print("GetAvatarPresets")
                ApiEvents.shared.ShowLoading()
                GetAvatarsPresets()
            })
            
            CreatedTwoButton(ButtonOnename: "Get Clips", OnClickButtonOne: {
                print("GetClips")
                ApiEvents.shared.ShowLoading()
                GetClip()
            }, ButtonTwoname: "Get Clips By ids", OnClickButtonTwo: {
                print("GetClipsByids")
                ApiEvents.shared.ShowLoading()
                GetClipByID()
            })
            
            CreatedTwoButton(ButtonOnename: "Get Expressions", OnClickButtonOne: {
                print("GetExpressions")
                ApiEvents.shared.ShowLoading()
                GetExpressions()
            }, ButtonTwoname: "Get Expressions By ids", OnClickButtonTwo: {
                print("GetExpressionsByids")
                ApiEvents.shared.ShowLoading()
                GetExpressionByIDs()
            })
            
            CreatedTwoButton(ButtonOnename: "Get All bucket vertices", OnClickButtonOne: {
                print("GetAllbucketVertices")
                ApiEvents.shared.ShowLoading()
                GetAllBucketsVertices()
            }, ButtonTwoname: "Grant avatarpreset item to user", OnClickButtonTwo: {
                print("Grant avatarpreset item to user")
                ApiEvents.shared.ShowLoading()
                GrantAvatarPresetItemToUser()
            })
            
            CreatedTwoButton(ButtonOnename: "Render Avatar Image", OnClickButtonOne: {
                print("RenderAvatarImage")
                ApiEvents.shared.ShowLoading()
                RenderAvatarsImage()
            }, ButtonTwoname: "Sync Avatar", OnClickButtonTwo: {
                print("SyncAvatar")
                ApiEvents.shared.ShowLoading()
                SyncAvatar()
            })
            
            CreatedTwoButton(ButtonOnename: "Grant Avatar Presets TO USER", OnClickButtonOne: {
                print("GrantAvatarPresetsToUser")
                ApiEvents.shared.ShowLoading()
                GrantAvatarPresetsToUser()
            }, ButtonTwoname: "Grant Avatar Presets by id", OnClickButtonTwo: {
                print("GrantAvatarPresetsbyid")
                ApiEvents.shared.ShowLoading()
                GetAvatarsPresetsByID()
            })
        }
    }
    
    ///Generates the 3D mesh as per the configuration in the Config panel
    func GeneratesAvatarMesh()
    {
        let auth = AvatarManagementHandler(ApiBase: GenerateAvatarMesh(_AvatarID: "154ffe8a-d890-4a5f-bf8b-8ef6000b89ce", _Platform: GenerateAvatarMeshRequest.Platform.ios))
        auth.GenerateAvatarMesh { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GeneratesAvatarMesh-success->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GeneratesAvatarMesh-failure->>",failure.localizedDescription)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Get all avatar presets
    func GetAvatarsPresets()
    {
        let auth = AvatarManagementHandler(ApiBase: GetAvatarPresets(status: AvatarManagementAPI.Status_getAvatarPresets._1, gender: AvatarManagementAPI.Gender_getAvatarPresets._3))
        auth.GetAvatarPresets { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetAvatarsPresets-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetAvatarsPresets-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Get all the clips by Active status.
    func GetClip()
    {
        let auth = AvatarManagementHandler(ApiBase: GetClips(status: AvatarManagementAPI.Status_getClips._1))
        auth.GetClips { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetClip-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetClip-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Get the specified clip's details by providing ClipID.
    func GetClipByID()
    {
        let auth = AvatarManagementHandler(ApiBase: GetClipsByID(clipId: "d8367fcd-9791-4dc7-9fab-7ed8c2d8b296"))
        auth.GetClipsByID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetClipsByID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetClipsByID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Get all the active expressions.
    func GetExpressions()
    {
        let auth = AvatarManagementHandler(ApiBase: GetExpression(status: AvatarManagementAPI.Status_getExpressions._1))
        auth.GetExpression { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetExpression-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetExpression-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Get the specified expression details by providing ExpressionID.
    func GetExpressionByIDs()
    {
        let auth = AvatarManagementHandler(ApiBase: GetExpressionByID(expressionid: "58fa3805-c8eb-4931-9e2b-a2dbdaa79d3b"))
        auth.GetExpressionByID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetExpressionByID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetExpressionByID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Get vertices for all buckets.
    func GetAllBucketsVertices()
    {
        let auth = AvatarManagementHandler(ApiBase: GetGetallbucketvertices(platform: AvatarManagementAPI.Platform_getGetallbucketvertices.ios))
        auth.GetGetallbucketvertices { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetGetallbucketvertices-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetGetallbucketvertices-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Grant Avatar Preset Items To User.
    func GrantAvatarPresetItemToUser()
    {
        let itemId = ["0474376d-d886-4681-a08a-2c6adbca248e"]
        let auth = AvatarManagementHandler(ApiBase: GrantAvatarPresetItemsToUser(itemID: itemId))
        auth.GrantAvatarPresetItemsToUser { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GrantAvatarPresetItemToUser-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GrantAvatarPresetItemToUser-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Render Avatar Image.
    func RenderAvatarsImage()
    {
        let auth = AvatarManagementHandler(ApiBase: RenderAvatarImage(_AvatarID: "63dcf0b2-dddc-4415-a6c3-b38c89515d08", _Platform: RenderAvatarImageRequest.Platform.ios))
        auth.RenderAvatarImage { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("RenderAvatarsImage-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("RenderAvatarsImage-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Creates missing avatars into the mentioned platform for the user.
    func SyncAvatar()
    {
        let auth = AvatarManagementHandler(ApiBase: SyncAvatars(Platform: SyncAvatarsRequest.Platform.ios, Mesh: true, Image: true))
        auth.SyncAvatars { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("SyncAvatars-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("SyncAvatars-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Grant Avatar Preset To User.
    func GrantAvatarPresetsToUser()
    {
        let jsonString = """
        {
            "Race": "European",
            "AgeRange": "18-24",
            "Gender": 2,
            "CustomMetaData": "[]",
            "MetaData": "{\"Style\":{\"ClipID\":\"standard_clip\",\"ExpressionID\":\"\"},\"gender\":1}",
            "ColorMeta": {
                "HairColor": "#1e0c00",
                "EyebrowColor": "#2b2826",
                "FacialHairColor": "#3b3b3b",
                "LipColor": "#e15667",
                "FaceColor": "#ffffff"
            },
            "BucketData": [
                {"CoreBucket": "Hair/hair", "ID": "d69374fc-cb26-43c5-a828-0f2be3b7d005"},
                {"CoreBucket": "Eyebrows/eyebrow", "ID": "9b947ed3-34a5-4fa3-a3a2-8a3f96ea9cb4"},
                {"CoreBucket": "SkinTone/skintone", "ID": "95c2f50d-8c96-4ab5-accf-4cb94228b060"},
                {"CoreBucket": "Eyes/eyes", "ID": "f271eb81-1949-4fc1-ba6e-8d8adb2048ec"},
                {"CoreBucket": "Mouth/lips", "ID": "6655cea3-8eed-4488-9b7c-e0b1e79193ba"},
                {"CoreBucket": "UpperBody/upperbody_sleeve_full", "ID": "ee44c68b-1ea4-446d-b536-4b2e577c87d5"},
                {"CoreBucket": "LowerBody/lowerbody_without_foot", "ID": "30fc6c7c-10bc-4510-a9a9-78326c344e35"}
            ],
            "Blendshapes": []
        }
        """
        let auth = AvatarManagementHandler(ApiBase: GrantAvatarPresetToUser(avatarData: jsonString))
        auth.GrantAvatarPresetToUser { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GrantAvatarPresetToUser-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GrantAvatarPresetToUser-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Retrive Avatar preset by ID.
    func GetAvatarsPresetsByID()
    {
        let auth = AvatarManagementHandler(ApiBase: GetAvatarPresetsByID(avatarPresetID: "db9e8538-9e50-4328-b8a7-0922a5e0e8d2"))
        auth.GetAvatarPresetsByID { response in
            switch response {
            case .success(let success):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetAvatarPresetsByID-->>",success)
                }
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                if(ProjectSettings.shared.isDebug)
                {
                    print("GetAvatarPresetsByID-->>",failure)
                }
                ApiEvents.shared.HideLoading()
            }
        }
    }
}

struct ExampleAvatarmanagement_Previews: PreviewProvider {
    static var previews: some View {
        ExampleAvatarmanagement()
    }
}
