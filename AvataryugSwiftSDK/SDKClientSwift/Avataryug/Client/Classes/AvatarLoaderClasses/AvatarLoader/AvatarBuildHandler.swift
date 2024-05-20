import Foundation
import SwiftUI
import SceneKit

class AvatarBuildHandler
{
    
    static let shared = AvatarBuildHandler()
    
    var currentAvatarID:String = ""
    var currentSelectedClipID:String = ""
    
    init()
    {
        currentAvatarID = ""
    }
    
    var currentTopData : GetEconomyItemsResultDataInner!
    var currentHairData : GetEconomyItemsResultDataInner!
    var currentLipsData : GetEconomyItemsResultDataInner!
    var currentBottomData : GetEconomyItemsResultDataInner!
    var currentOutfitData : GetEconomyItemsResultDataInner!
    var currentEyebrowData : GetEconomyItemsResultDataInner!
    var currentEyeballData : GetEconomyItemsResultDataInner!
    var currentEyewearData : GetEconomyItemsResultDataInner!
    var currentEarwearData : GetEconomyItemsResultDataInner!
    var currentEyeshapeData : GetEconomyItemsResultDataInner!
    var currentLipshapeData : GetEconomyItemsResultDataInner!
    var currentFootwearData : GetEconomyItemsResultDataInner!
    var currentHeadwearData : GetEconomyItemsResultDataInner!
    var currentSkinToneData : GetEconomyItemsResultDataInner!
    var currentHandwearData : GetEconomyItemsResultDataInner!
    var currentEarshapeData : GetEconomyItemsResultDataInner!
    var currentFacewearData : GetEconomyItemsResultDataInner!
    var currentNeckwearData : GetEconomyItemsResultDataInner!
    var currentNosewearData : GetEconomyItemsResultDataInner!
    var currentFaceshapeData : GetEconomyItemsResultDataInner!
    var currentNoseshapeData : GetEconomyItemsResultDataInner!
    var currentWristwearData : GetEconomyItemsResultDataInner!
    var currentMouthwearData : GetEconomyItemsResultDataInner!
    var currentHeadTattooData : GetEconomyItemsResultDataInner!
    var currentFacialhairData : GetEconomyItemsResultDataInner!
    var currentEyebrowshapeData : GetEconomyItemsResultDataInner!
    var currentEyebrowswearData : GetEconomyItemsResultDataInner!
    var currentLeftArmTattooData : GetEconomyItemsResultDataInner!
    var currentRightArmTattooData : GetEconomyItemsResultDataInner!
    var currentLeftHandTattooData : GetEconomyItemsResultDataInner!
    var currentLeftFootTattooData : GetEconomyItemsResultDataInner!
    var currentBackBodyTattooData : GetEconomyItemsResultDataInner!
    var currentRightHandTattooData : GetEconomyItemsResultDataInner!
    var currentRightFootTattooData : GetEconomyItemsResultDataInner!
    var currentFrontBodyTattooData : GetEconomyItemsResultDataInner!
    var currentBackLeftLegTattooData : GetEconomyItemsResultDataInner!
    var currentFrontLeftLegTattooData : GetEconomyItemsResultDataInner!
    var currentBackRightLegTattooData : GetEconomyItemsResultDataInner!
    var currentFrontRightLegTattooData : GetEconomyItemsResultDataInner!
    
    
    var networkModelQueueList : [GetEconomyItemsResultDataInner] = []
    
    func DownloadAvatarData(modeldata:GetEconomyItemsResultDataInner)
    {
        self.networkModelQueueList.append(modeldata)
        OnQueueNetworkModel()
    }
    
    func OnQueueNetworkModel()
    {
        print(networkModelQueueList.count)
        if networkModelQueueList.count > 0 {
            let modeldta = networkModelQueueList[0]
            networkModelQueueList.remove(at: 0)
            DownloadNetworkModel(modelData: modeldta)
           
        }
    }
    
    func DownloadNetworkModel(modelData:GetEconomyItemsResultDataInner)
    {
        
        print("DownloadNetworkModel")
        if modelData.itemCategory == Category.Top.rawValue
        {
            if currentTopData != nil
            {
                if currentTopData.ID == modelData.ID
                {
                    self.currentTopData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentTopData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentTopData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        
        if modelData.itemCategory == Category.Bottom.rawValue
        {
            if currentBottomData != nil
            {
                if currentBottomData.ID == modelData.ID
                {
                    self.currentBottomData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentBottomData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentBottomData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        
        if modelData.itemCategory == Category.Outfit.rawValue
        {
            if currentOutfitData != nil
            {
                if currentOutfitData.ID == modelData.ID
                {
                    self.currentOutfitData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentOutfitData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentOutfitData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.Hair.rawValue
        {
            if currentHairData != nil
            {
                if currentHairData.ID == modelData.ID
                {
                    self.currentHairData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentHairData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentHairData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.Lips.rawValue
        {
            if currentLipsData != nil
            {
                if currentLipsData.ID == modelData.ID
                {
                    self.currentLipsData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentLipsData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentLipsData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.Facialhair.rawValue
        {
            if currentFacialhairData != nil
            {
                if currentFacialhairData.ID == modelData.ID
                {
                    self.currentFacialhairData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentFacialhairData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentFacialhairData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        
        if modelData.itemCategory == Category.Eyebrow.rawValue
        {
            if currentEyebrowData != nil
            {
                if currentEyebrowData.ID == modelData.ID
                {
                    self.currentEyebrowData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentEyebrowData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentEyebrowData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.Eyeball.rawValue
        {
            if currentEyeballData != nil
            {
                if currentEyeballData.ID == modelData.ID
                {
                    self.currentEyeballData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentEyeballData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentEyeballData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.Mouthwear.rawValue
        {
            if currentMouthwearData != nil
            {
                if currentMouthwearData.ID == modelData.ID
                {
                    self.currentMouthwearData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentMouthwearData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentMouthwearData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.Handwear.rawValue
        {
            if currentHandwearData != nil
            {
                if currentHandwearData.ID == modelData.ID
                {
                    self.currentHandwearData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentHandwearData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentHandwearData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.Wristwear.rawValue
        {
            if currentWristwearData != nil
            {
                if currentWristwearData.ID == modelData.ID
                {
                    self.currentWristwearData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentWristwearData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentWristwearData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.Footwear.rawValue
        {
            if currentFootwearData != nil
            {
                if currentFootwearData.ID == modelData.ID
                {
                    self.currentFootwearData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentFootwearData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentFootwearData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        
        if modelData.itemCategory == Category.Headwear.rawValue
        {
            if currentHeadwearData != nil
            {
                if currentHeadwearData.ID == modelData.ID
                {
                    self.currentHeadwearData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentHeadwearData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentHeadwearData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        
        if modelData.itemCategory == Category.Facewear.rawValue
        {
            if currentFacewearData != nil
            {
                if currentFacewearData.ID == modelData.ID
                {
                    self.currentFacewearData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentFacewearData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentFacewearData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.Eyewear.rawValue
        {
            if currentEyewearData != nil
            {
                if currentEyewearData.ID == modelData.ID
                {
                    self.currentEyewearData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentEyewearData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentEyewearData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.Earwear.rawValue
        {
            if currentEarwearData != nil
            {
                if currentEarwearData.ID == modelData.ID
                {
                    self.currentEarwearData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentEarwearData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentEarwearData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.Neckwear.rawValue
        {
            if currentNeckwearData != nil
            {
                if currentNeckwearData.ID == modelData.ID
                {
                    self.currentNeckwearData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentNeckwearData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentNeckwearData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.Nosewear.rawValue
        {
            if currentNosewearData != nil
            {
                if currentNosewearData.ID == modelData.ID
                {
                    self.currentNosewearData = nil
                }
                else
                {
                    currentNosewearData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentNosewearData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.Eyebrowswear.rawValue
        {
            if currentEyebrowswearData != nil
            {
                if currentEyebrowswearData.ID == modelData.ID
                {
                    self.currentEyebrowswearData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentEyebrowswearData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentEyebrowswearData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        
        if modelData.itemCategory == Category.HeadTattoo.rawValue
        {
            if currentHeadTattooData != nil
            {
                if currentHeadTattooData.ID == modelData.ID
                {
                    self.currentHeadTattooData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentHeadTattooData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentHeadTattooData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.FrontBodyTattoo.rawValue
        {
            if currentFrontBodyTattooData != nil
            {
                if currentFrontBodyTattooData.ID == modelData.ID
                {
                    self.currentFrontBodyTattooData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentFrontBodyTattooData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentFrontBodyTattooData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.BackBodyTattoo.rawValue
        {
            if currentBackBodyTattooData != nil
            {
                if currentBackBodyTattooData.ID == modelData.ID
                {
                    self.currentBackBodyTattooData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentBackBodyTattooData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentBackBodyTattooData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.RightArmTattoo.rawValue
        {
            if currentRightArmTattooData != nil
            {
                if currentRightArmTattooData.ID == modelData.ID
                {
                    self.currentRightArmTattooData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentRightArmTattooData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentRightArmTattooData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.LeftArmTattoo.rawValue
        {
            if currentLeftArmTattooData != nil
            {
                if currentLeftArmTattooData.ID == modelData.ID
                {
                    self.currentLeftArmTattooData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentLeftArmTattooData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentLeftArmTattooData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.RightHandTattoo.rawValue
        {
            if currentRightHandTattooData != nil
            {
                if currentRightHandTattooData.ID == modelData.ID
                {
                    self.currentRightHandTattooData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentRightHandTattooData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentRightHandTattooData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.LeftHandTattoo.rawValue
        {
            if currentLeftHandTattooData != nil
            {
                if currentLeftHandTattooData.ID == modelData.ID
                {
                    self.currentLeftHandTattooData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentLeftHandTattooData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentLeftHandTattooData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.FrontRightLegTattoo.rawValue
        {
            if currentFrontRightLegTattooData != nil
            {
                if currentFrontRightLegTattooData.ID == modelData.ID
                {
                    self.currentFrontRightLegTattooData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentFrontRightLegTattooData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentFrontRightLegTattooData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.BackRightLegTattoo.rawValue
        {
            if currentBackRightLegTattooData != nil
            {
                if currentBackRightLegTattooData.ID == modelData.ID
                {
                    self.currentBackRightLegTattooData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentBackRightLegTattooData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentBackRightLegTattooData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.FrontLeftLegTattoo.rawValue
        {
            if currentFrontLeftLegTattooData != nil
            {
                if currentFrontLeftLegTattooData.ID == modelData.ID
                {
                    self.currentFrontLeftLegTattooData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentFrontLeftLegTattooData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentFrontLeftLegTattooData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.BackLeftLegTattoo.rawValue
        {
            if currentBackLeftLegTattooData != nil
            {
                if currentBackLeftLegTattooData.ID == modelData.ID
                {
                    self.currentBackLeftLegTattooData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentBackLeftLegTattooData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentBackLeftLegTattooData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.RightFootTattoo.rawValue
        {
            if currentRightFootTattooData != nil
            {
                if currentRightFootTattooData.ID == modelData.ID
                {
                    self.currentRightFootTattooData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentRightFootTattooData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentRightFootTattooData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.LeftFootTattoo.rawValue
        {
            if currentLeftFootTattooData != nil
            {
                if currentLeftFootTattooData.ID == modelData.ID
                {
                    self.currentLeftFootTattooData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentLeftFootTattooData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentLeftFootTattooData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if modelData.itemCategory == Category.SkinTone.rawValue
        {
            if currentSkinToneData != nil
            {
                if currentSkinToneData.ID == modelData.ID
                {
                    self.currentSkinToneData = nil
                    PatchAvatarRemoveBucket(modeldata: modelData){}
                }
                else
                {
                    currentSkinToneData = modelData
                    PatchAvatarAddBucket(modeldata: modelData){}
                }
            }
            else
            {
                currentSkinToneData = modelData
                PatchAvatarAddBucket(modeldata: modelData){}
            }
        }
        if (modelData.itemCategory == Category.FaceShape.rawValue || modelData.itemCategory == Category.NoseShape.rawValue ||
            modelData.itemCategory == Category.LipShape.rawValue  || modelData.itemCategory == Category.EyeShape.rawValue  ||
            modelData.itemCategory == Category.EarShape.rawValue  || modelData.itemCategory == Category.EyebrowShape.rawValue)
        {
            PatchAvatarBlendshape{
                
            }
        }
        OnQueueNetworkModel()
    }
    
    func PatchClip(isAdd :Bool,completionHandler: @escaping () -> Void)
    {
        if(!currentAvatarID.isEmpty)
        {
            let auth = AvatarManagementHandler(ApiBase:UpdateAvatars(_avatarID: currentAvatarID, _patchData: currentSelectedClipID, _action: isAdd ?"Add": "Remove", _patchDataType: "Bucket"))
            auth.UpdateAvatars(completionHandler: {
                result in
                switch result
                {
                case .success(let success):
                    print(success)
                    completionHandler()
                case .failure(let failure):
                    print(failure)
                    ApiEvents.shared.HideLoading()
                    ApiEvents.shared.ShowPopupMessage(message: failure.localizedDescription)
                }
            })
        }
    }
    
    func PatchAvatarRemoveBucket(modeldata :GetEconomyItemsResultDataInner,completionHandler: @escaping () -> Void)
    {
        if(!currentAvatarID.isEmpty)
        {
            let propdata  = PropBucketData(ID: modeldata.ID, CoreBucket: modeldata.coreBucket, TemplateID: modeldata.templateID, ItemSkin: modeldata.itemSkin, Config: modeldata.config, ConflictingBuckets: modeldata.conflictingBuckets, Blendshapes: modeldata.blendshapeKeys, MainCatID: modeldata.itemCategory)
            let encodedec = try? JSONEncoder().encode(propdata)
            let patchdatastring = String(data: encodedec!, encoding: .utf8)
            
            let auth = AvatarManagementHandler(ApiBase:UpdateAvatars(_avatarID: currentAvatarID, _patchData: patchdatastring!, _action: "Remove", _patchDataType: "Bucket"))
            auth.UpdateAvatars(completionHandler: {
                result in
                switch result
                {
                case .success(_):
                    completionHandler()
                case .failure(let failure):
                    print(failure)
                    ApiEvents.shared.HideLoading()
                    ApiEvents.shared.ShowPopupMessage(message: failure.localizedDescription)
                }
            })
        }
    }
    
    func PatchAvatarAddBucket(modeldata :GetEconomyItemsResultDataInner,completionHandler: @escaping () -> Void)
    {
        if(!currentAvatarID.isEmpty)
        {
            let propdata  = PropBucketData(ID: modeldata.ID, CoreBucket: modeldata.coreBucket, TemplateID: modeldata.templateID, ItemSkin: modeldata.itemSkin, Config: modeldata.config, ConflictingBuckets: modeldata.conflictingBuckets, Blendshapes: modeldata.blendshapeKeys, MainCatID: modeldata.itemCategory)
            let encodedec = try? JSONEncoder().encode(propdata)
            let patchdatastring = String(data: encodedec!, encoding: .utf8)
            
            let auth = AvatarManagementHandler(ApiBase:UpdateAvatars(_avatarID: currentAvatarID, _patchData: patchdatastring!, _action: "Add", _patchDataType: "Bucket"))
            auth.UpdateAvatars(completionHandler: {
                result in
                switch result
                {
                case .success(_):
                    completionHandler()
                case .failure(let failure):
                    print(failure)
                    
                    ApiEvents.shared.ShowPopupMessage(message: failure.localizedDescription)
                }
            })
        }
    }
    
    func PatchAddAvatarExpression(expressions:Expression,completionHandler: @escaping () -> Void)
    {
        if(!currentAvatarID.isEmpty)
        {
            var patchdata = BlendshapePatch()
            var Blendsahpes :  [BlendshapeData] = []
            
            for blends in expressions.BlendshapeKeys
            {
                print(blends.sliderValue ,blends.selectedShape)
                let data = BlendshapeData(val: Float(blends.sliderValue)!, key: blends.selectedShape)
                Blendsahpes.append(data)
                patchdata.Blendshapes = Blendsahpes
            }
            
            let encodedec = try? JSONEncoder().encode(patchdata)
            let patchdatastring = String(data: encodedec!, encoding: .utf8)
            print(patchdatastring!)
            let auth = AvatarManagementHandler(ApiBase:UpdateAvatars(_avatarID: currentAvatarID, _patchData: patchdatastring!, _action: "Add", _patchDataType: "Expression"))
            auth.UpdateAvatars(completionHandler: {
                result in
                switch result
                {
                case .success(let success):
                    print(success)
                    completionHandler()
                case .failure(let failure):
                    print(failure)
                    ApiEvents.shared.HideLoading()
                    ApiEvents.shared.ShowPopupMessage(message: failure.localizedDescription)
                }
            })
        }
    }
    func PatchREmoveAvatarExpression(expressions:Expression, completionHandler: @escaping () -> Void)
    {
        if(!currentAvatarID.isEmpty)
        {
            var patchdata = BlendshapePatch()
            var Blendsahpes :  [BlendshapeData] = []
  
       
            let encodedec = try? JSONEncoder().encode(patchdata)
            let patchdatastring = String(data: encodedec!, encoding: .utf8)
            
            let auth = AvatarManagementHandler(ApiBase:UpdateAvatars(_avatarID: currentAvatarID, _patchData: patchdatastring!, _action: "Remove", _patchDataType: "Expression"))
            auth.UpdateAvatars(completionHandler: {
                result in
                switch result
                {
                case .success(let success):
                    print(success)
                    completionHandler()
                case .failure(let failure):
                    print(failure)
                    ApiEvents.shared.HideLoading()
                    ApiEvents.shared.ShowPopupMessage(message: failure.localizedDescription)
                }
            })
        }
    }
    
    func PatchAvatarBlendshape(completionHandler: @escaping () -> Void)
    {
        if(!currentAvatarID.isEmpty)
        {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
                
                
                var patchdata = BlendshapePatch()
                var Blendshapes :  [BlendshapeData] = []
                //Uncoment on using in sample app
//                if(AvatarLoader.shared.forCustomize.headNode != nil)
//                {
//                    for childNoade in AvatarLoader.shared.forCustomize.headNode.childNodes
//                    {
//                        for layer2 in childNoade.childNodes
//                        {
//                            if(layer2.name! == "head_generic" )
//                            {
//                                for layer3 in layer2.childNodes
//                                {
//                                    for i in 0..<(layer3.morpher?.weights.count)! {
//                                      
//                                        let data = BlendshapeData(val: layer3.morpher?.weights[i] as! Float, key: layer3.morpher!.targets[i].name!)
//                                        Blendshapes.append(data)
//                                          patchdata.Blendshapes = Blendshapes
//                                    }
//                                   
//                                }
//                            }
//                        }
//                    }
//                }
                let encodedec = try? JSONEncoder().encode(patchdata)
                let patchdatastring = String(data: encodedec!, encoding: .utf8)
                print(patchdatastring)
                let auth = AvatarManagementHandler(ApiBase:UpdateAvatars(_avatarID: currentAvatarID, _patchData: patchdatastring!, _action: "Add", _patchDataType: "Blendshape"))
                auth.UpdateAvatars(completionHandler: {
                    result in
                    switch result
                    {
                    case .success(let success):
                        print(success)
                        completionHandler()
                    case .failure(let failure):
                        print(failure)
                        ApiEvents.shared.HideLoading()
                        ApiEvents.shared.ShowPopupMessage(message: failure.localizedDescription)
                    }
                })
            }
        }
    }
    
    func ExportGlb(completionHandler: @escaping (String) -> Void)
    {
                if(!currentAvatarID.isEmpty)
                {
                    let auth = AvatarManagementHandler(ApiBase:UpdateAvatars(_avatarID: currentAvatarID, _patchData: "{}", _action: "ExportGLB", _patchDataType: "ExportGLB"))
                    auth.UpdateAvatars(completionHandler: {
                        result in
                        switch result
                        {
                        case .success(let success):
                            print(success)
                            completionHandler(success)
                        case .failure(let failure):
                            print(failure)
                            ApiEvents.shared.HideLoading()
                            ApiEvents.shared.ShowPopupMessage(message: failure.localizedDescription)
                        }
                    })
                }
    }
    func ExportThumbnail(completionHandler: @escaping (String) -> Void)
    {
                if(!currentAvatarID.isEmpty)
                {
                    let auth = AvatarManagementHandler(ApiBase:UpdateAvatars(_avatarID: currentAvatarID, _patchData: "{}", _action: "Thumbnail", _patchDataType: "Thumbnail"))
                    auth.UpdateAvatars(completionHandler: {
                        result in
                        switch result
                        {
                        case .success(let success):
                            print(success)
                            completionHandler(success)
                        case .failure(let failure):
                            print(failure)
                            ApiEvents.shared.HideLoading()
                            ApiEvents.shared.ShowPopupMessage(message: failure.localizedDescription)
                        }
                    })
                }
    }
    func PatchAddColor(completionHandler: @escaping () -> Void)
    {
                if(!currentAvatarID.isEmpty)
                {
                    //Uncoment on using in sample app
                    
//                    let colorobj = ColorObj(LipColor:  CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.LipColor, FaceColor:  "#FFFFFF", HairColor:  CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.HairColor,
//                                            EyebrowColor:  CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.EyebrowColor, FacialHairColor:  CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.FacialHairColor)
//                    let finalcolors = FinalColor(ColorMeta: colorobj)
//        
//        
//                    let encodedec = try? JSONEncoder().encode(finalcolors)
//                    let patchdatastring = String(data: encodedec!, encoding: .utf8)
//        
//                    let auth = AvatarManagementHandler(ApiBase:UpdateAvatars(_avatarID: currentAvatarID, _patchData: patchdatastring! , _action: "Thumbnail", _patchDataType: "Thumbnail"))
//                    auth.UpdateAvatars(completionHandler: {
//                        result in
//                        switch result
//                        {
//                        case .success(let success):
//                            print("Added color")
//                            completionHandler()
//                        case .failure(let failure):
//                            print(failure)
//                            ApiEvents.shared.HideLoading()
//                            ApiEvents.shared.ShowPopupMessage(message: failure.localizedDescription)
//                        }
//                    })
                }
           }
        
        func CreateCurrentAvatar(  ids : [PropBucketData] ){
            Reset()
            var renderavatardata = AvatarDataBlender(Race: "", AgeRange: "", Gender: 0, CustomMetaData: "", _MetaData: "", ColorMeta: PropColors(HairColor: "", EyebrowColor: "", FacialHairColor: "", LipColor: "", FaceColor: ""), BucketData: [], Blendshapes: [])
            //Uncoment on using in sample app
//            renderavatardata.ColorMeta.HairColor = CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.HairColor
//            renderavatardata.ColorMeta.EyebrowColor = CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.EyebrowColor
//            renderavatardata.ColorMeta.FacialHairColor = CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.FacialHairColor
//            renderavatardata.ColorMeta.LipColor = CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.LipColor
            renderavatardata.ColorMeta.FaceColor = "#FFFFFF"
            
            ApiEvents.shared.ShowLoading()
            
            renderavatardata.BucketData = ids
            //Uncoment on using in sample app
//            var itemids :[String] = []
//            for i in 0..<DataHolder.shared.currentSelectedBodyParts.count
//            {
//                itemids.append(DataHolder.shared.currentSelectedBodyParts[i].ID)
//            }
//            let styl = Style(ClipID: "61c43d03-f21c-4a7c-97fe-9665be6739a4", ExpressionID: "")
//            let clipexpdta = ClipExpressionData(Style: styl, gender: UserDetailHolder.shared.userDetail.currentUserSelectedAvatar.avatardata.Gender)
//            let encodedec = try? JSONEncoder().encode(clipexpdta)
//            let metadata = String(data: encodedec!, encoding: .utf8)
//            
//            
//            renderavatardata.AgeRange = "21 to 24"
//            renderavatardata.MetaData = metadata!
//            renderavatardata.Race = "Custom"
//            renderavatardata.Gender = UserDetailHolder.shared.userDetail.Genders == Gender.Male ? 0 : 1
            
            let encodedec1 = try? JSONEncoder().encode(renderavatardata)
            let avatarstr = String(data: encodedec1!, encoding: .utf8)
            
            let auth = AvatarManagementHandler(ApiBase:CreateAvatar(_AvatarData: avatarstr!, _Platform: "iOS"))
            auth.CreateAvatars( completionHandler: {
                result in
                switch result
                {
                case .success(let success):
                    print(success)
                    self.currentAvatarID = success.avatarID!
                case .failure(let failure):
                    print(failure)
                    ApiEvents.shared.HideLoading()
                    ApiEvents.shared.ShowPopupMessage(message: failure.localizedDescription)
                }
            })
        }
        
        func CreateDefaultAvatar()
        {
            Reset()
            var renderavatardata = AvatarDataBlender(Race: "", AgeRange: "", Gender: 0, CustomMetaData: "", _MetaData: "", ColorMeta: PropColors(HairColor: "", EyebrowColor: "", FacialHairColor: "", LipColor: "", FaceColor: ""), BucketData: [], Blendshapes: [])
            //Uncoment on using in sample app
//            renderavatardata.ColorMeta.HairColor = CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.HairColor
//            renderavatardata.ColorMeta.EyebrowColor = CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.EyebrowColor
//            renderavatardata.ColorMeta.FacialHairColor = CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.FacialHairColor
//            renderavatardata.ColorMeta.LipColor = CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.LipColor
//            renderavatardata.ColorMeta.FaceColor = CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.FaceColor
            

            
            ApiEvents.shared.ShowLoading()
            
            var itemids :[String] = []

            let styl = Style(ClipID: "61c43d03-f21c-4a7c-97fe-9665be6739a4", ExpressionID: "")
            //Uncoment on using in sample app
         //   let clipexpdta = ClipExpressionData(Style: styl, gender: UserDetailHolder.shared.userDetail.currentUserSelectedAvatar.avatardata.Gender)
         //   let encodedec = try? JSONEncoder().encode(clipexpdta)
         //   let metadata = String(data: encodedec!, encoding: .utf8)
            
//            
            renderavatardata.AgeRange = "21 to 24"
            
            //Uncoment on using in sample app
          //  renderavatardata.MetaData = metadata!
            renderavatardata.Race = "Custom"
            //Uncoment on using in sample app
          //  renderavatardata.Gender = UserDetailHolder.shared.userDetail.Genders == Gender.Male ? 0 : 1
            
            let encodedec1 = try? JSONEncoder().encode(renderavatardata)
            let avatarstr = String(data: encodedec1!, encoding: .utf8)
            
            let auth = AvatarManagementHandler(ApiBase:CreateAvatar(_AvatarData: avatarstr!, _Platform: "iOS"))
            auth.CreateAvatars(completionHandler:  {
                result in
                switch result
                {
                case .success(let success):
                    print(success)
                    self.currentAvatarID = success.avatarID!
                case .failure(let failure):
                    print(failure)
                    ApiEvents.shared.HideLoading()
                    ApiEvents.shared.ShowPopupMessage(message: failure.localizedDescription)
                }
            })
            
        }
    func CreateDefaultAvatar(gender:Int)
    {
        Reset()
        var renderavatardata = AvatarDataBlender(Race: "", AgeRange: "", Gender: 0, CustomMetaData: "", _MetaData: "", ColorMeta: PropColors(HairColor: "", EyebrowColor: "", FacialHairColor: "", LipColor: "", FaceColor: ""), BucketData: [], Blendshapes: [])
        
        renderavatardata.ColorMeta.HairColor = "#2a2a2a"
            renderavatardata.ColorMeta.EyebrowColor = "#272727"
            renderavatardata.ColorMeta.FacialHairColor = "#3b3b3b"
            renderavatardata.ColorMeta.LipColor = "#ff9e7e"
            renderavatardata.ColorMeta.FaceColor = "#ffffff"


        ApiEvents.shared.ShowLoading()
        
        var itemids :[String] = []

        let styl = Style(ClipID: "61c43d03-f21c-4a7c-97fe-9665be6739a4", ExpressionID: "")
        let clipexpdta = ClipExpressionData(Style: styl, gender: gender)
        let encodedec = try? JSONEncoder().encode(clipexpdta)
        let metadata = String(data: encodedec!, encoding: .utf8)
        
//
        renderavatardata.AgeRange = "21 to 24"
        renderavatardata.MetaData = metadata!
        renderavatardata.Race = "Custom"
        renderavatardata.Gender = gender
        
        let encodedec1 = try? JSONEncoder().encode(renderavatardata)
        let avatarstr = String(data: encodedec1!, encoding: .utf8)
        
        let auth = AvatarManagementHandler(ApiBase:CreateAvatar(_AvatarData: avatarstr!, _Platform: "iOS"))
        auth.CreateAvatars(completionHandler:  {
            result in
            switch result
            {
            case .success(let success):
                print(success)
                self.currentAvatarID = success.avatarID!
            case .failure(let failure):
                print(failure)
                ApiEvents.shared.HideLoading()
                ApiEvents.shared.ShowPopupMessage(message: failure.localizedDescription)
            }
        })
        
    }
    func Reset(){
        self.currentTopData = nil
        self.currentHairData =  nil
        self.currentLipsData =  nil
        self.currentBottomData =  nil
        self.currentOutfitData =  nil
        self.currentEyebrowData =  nil
        self.currentEyeballData =  nil
        self.currentEyewearData =  nil
        self.currentEarwearData =  nil
        self.currentEyeshapeData =  nil
        self.currentLipshapeData =  nil
        self.currentFootwearData =  nil
        self.currentHeadwearData =  nil
        self.currentSkinToneData =  nil
        self.currentHandwearData =  nil
        self.currentEarshapeData =  nil
        self.currentFacewearData =  nil
        self.currentNeckwearData =  nil
        self.currentNosewearData =  nil
        self.currentFaceshapeData =  nil
        self.currentNoseshapeData =  nil
        self.currentWristwearData =  nil
        self.currentMouthwearData =  nil
        self.currentHeadTattooData =  nil
        self.currentFacialhairData =  nil
        self.currentEyebrowshapeData =  nil
        self.currentEyebrowswearData =  nil
        self.currentLeftArmTattooData =  nil
        self.currentRightArmTattooData =  nil
        self.currentLeftHandTattooData =  nil
        self.currentLeftFootTattooData =  nil
        self.currentBackBodyTattooData =  nil
        self.currentRightHandTattooData =  nil
        self.currentRightFootTattooData =  nil
        self.currentFrontBodyTattooData =  nil
        self.currentBackLeftLegTattooData =  nil
        self.currentFrontLeftLegTattooData =  nil
        self.currentBackRightLegTattooData =  nil
        self.currentFrontRightLegTattooData =  nil
    }
    }
    

