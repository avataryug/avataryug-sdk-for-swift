import Foundation
import SceneKit
import GLTFSceneKit


// The "AvatarLoaderBase" class is a base class responsible for managing the process of loading and handling avatar mesh information.
// It serves as a foundation for performing tasks like managing conflict buckets,
// loading different parts of the avatar, and handling textures and blendshapes for the face.
// This class encapsulates the core functionality related to avatar mesh processing and provides
// a framework for derived classes to extend and customize the behavior as needed.

class AvatarLoaderBase
{
    
    public init(){}
    
    //Hold selected model data
    //Used for removing same model and compare with next model
    var currentWristwearData : GetEconomyItemsResultDataInner!
    var currentSelectedTop : GetEconomyItemsResultDataInner!
    var currentSelectedBottom : GetEconomyItemsResultDataInner!
    var currentSelectedOutfit : GetEconomyItemsResultDataInner!
    var currentSelectedHandwear : GetEconomyItemsResultDataInner!
    var currentSelectedFootwear : GetEconomyItemsResultDataInner!
    var currentEyeballData : GetEconomyItemsResultDataInner!
    var currentLipsData : GetEconomyItemsResultDataInner!
    var currentEyebrowData : GetEconomyItemsResultDataInner!
    var currentSkinToneData : GetEconomyItemsResultDataInner!
    var currentFaceShapeData : GetEconomyItemsResultDataInner!
    var currentNoseShapeData : GetEconomyItemsResultDataInner!
    var currentEyebrowshapeData : GetEconomyItemsResultDataInner!
    var currentEyeShapeData : GetEconomyItemsResultDataInner!
    var currentLipShapeData : GetEconomyItemsResultDataInner!
    var currentEarshapeData : GetEconomyItemsResultDataInner!
    
    var headwearModelList : [GetEconomyItemsResultDataInner] = []
    var networkModelQueueList : [GetEconomyItemsResultDataInner] = []
    
    var vertexData : [GetAllBucketVerticesResultDataInner] = []
    
    var defaultModelList : [ModelData] = []
    
    var facevertexlist :[FaceVertex] = []
    
    var lastLoadedTattoos : [LoadedTattoo] = []
    
    var hairModelNode :SCNNode!
    var headwearModelNode :SCNNode!
    var facewearModelNode :SCNNode!
    var CustomizeModelParent :SCNNode!
    var blendpointHeadNode : SCNNode!
    var ModelParentNode : SCNNode!
    var headNode : SCNNode!
    var handwearNodes: SCNNode!
    var footwearNodes: SCNNode!
    var bottomNodes: SCNNode!
    var topNodes: SCNNode!
    var outfitnodes: SCNNode!
    
    var facialHairMorpher : SCNMorpher!
    var headGeometryModel : SCNGeometry!
    var innermouthmorpherModel : SCNMorpher!
    var headmorpherModel : SCNMorpher!
    
    var boneAnimationList : [SCNNode] = []
    var modelBone : [SCNNode] = []
    var bodyPoints : [SCNNode] = []
    var OnBoardingModelst :[SCNNode] = []
    var clipBones : [SCNNode] = []
    
    var VertexList : [SCNVector3] = []
    
    var HeadCoreBuck :String = ""
    
    var firstTime = false;
    var isClicked = false
    
    //This method load head model from network
    //Also load vertex point detail for facewear models
    func LoadHeadModelVertices(completionHandler: @escaping () -> Void) {
      ApiEvents.shared.ShowLoading()
      let auth = AvatarManagementHandler(
        ApiBase: GetGetallbucketvertices(
          platform: AvatarManagementAPI.Platform_getGetallbucketvertices.ios))
      auth.GetGetallbucketvertices(completionHandler: {
        (response) in
        switch response
        {
        case .success(let success):
          ApiEvents.shared.HideLoading()
          self.vertexData = success.data!
          if self.headNode.childNodes.count == 0 {
            self.firstTime = true
            self.LoadHeadModel(completionHandler: {
              self.SetAnimation(_bone: self.headNode)
              completionHandler()
            })
          }
        case .failure(let failure):
          ApiEvents.shared.HideLoading()
          ApiEvents.shared.ShowPopupMessage(message: failure.localizedDescription)
        }
      })
    }

    //Load head glb from local path
    public func LoadHeadModel(completionHandler: @escaping () -> Void) {
      do {
        let sceneSource = try GLTFSceneSource(named: "head_generic.glb")
        let scene = try sceneSource.scene()
        for item in scene.rootNode.childNodes {
          headNode.addChildNode(item)
        }
        SetHeadMaterialAndFacewearPoints(_bone: headNode)
        completionHandler()
      } catch {
        isClicked = false

        return
      }
    }

    // This method retunr gender form user profile or return hard coded gender
    func GetGender() -> Gender {
      var gender = Gender.Male
      //        if(UserDetailHolder.shared.userDetail.Genders  == 1)
      //        {
      //            gender = Gender.Male
      //        }else{
      //            gender = Gender.Female
      //        }
      return gender
    }

    //Loop through all bone of model to check blendshape geometry
    func CheckBlendshape(_bone: SCNNode!) {
      if _bone != nil {
        if _bone.morpher != nil {
          if (_bone.morpher?.weights.count)! > 0 {
            for i in 0..<(_bone.morpher?.weights.count)! {
              _bone.morpher?.setWeight(0, forTargetAt: i)
            }
          }
        }
      }
      if _bone.childNodes.count > 0 {
        for i in 0..._bone.childNodes.count - 1 {
          CheckBlendshape(_bone: _bone.childNodes[i])
        }
      }
    }

    
    //This method load headwear models
    func LoadHeadwear(modelData: GetEconomyItemsResultDataInner) {
      ApiEvents.shared.ShowLoading()
      var bucketname: String
      let buckets = modelData.coreBucket.split(separator: "/")
      bucketname = String(buckets[0])
      var isSameModelPresent: Bool = false
      var currentNodePoint: SCNNode!
      if buckets.count > 1 {
        bucketname = String(buckets[1])
      } else {
        bucketname = String(buckets[0])
      }
      let verteslist: [SCNVector3] = headGeometryModel.GetVertices()!
      for verts in facevertexlist {
        verts.Point.worldPosition = verteslist[verts.VertexNo]
      }
      for vertP in facevertexlist {
        if vertP.Point.name == bucketname {
          currentNodePoint = vertP.Point
          break
        }
      }

      if currentNodePoint.childNodes.count > 0 {
        let nodename = currentNodePoint.childNodes[0].name!
        if nodename.contains(modelData.ID) {
          isSameModelPresent = true
          //  DataHolder.shared.RemovePart(economyItem: modelData)
          isClicked = false
          for item in currentNodePoint.childNodes {
            item.removeFromParentNode()
          }
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            ApiEvents.shared.HideLoading()
            self.OnQueueNetworkModel()
          }
        }
      }

      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        if isSameModelPresent {

          self.HeadCoreBuck = ""
          self.ResetBlendshapes()

          //  DataHolder.shared.RemovePart(economyItem: modelData)
          if self.headwearModelNode.childNodes.count > 0 {
            for points in self.headwearModelNode.childNodes {
              points.removeFromParentNode()
            }
          }
        }

        if !isSameModelPresent {
          let conflict = try? JSONDecoder().decode(
            [Conflict].self, from: modelData.conflictingBuckets.data(using: .utf8)!)
          for vertP in self.facevertexlist {
            for conf in conflict! {
              if vertP.Point.name?.lowercased() == conf.name.lowercased() {
                if vertP.Point.childNodes.count > 0 {
                  for child in vertP.Point.childNodes {
                    child.removeFromParentNode()
                  }
                }
              }
            }
          }
          if currentNodePoint.childNodes.count > 0 {
            for item in currentNodePoint.childNodes {
              item.removeFromParentNode()
            }
          }

          DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let jsonData = modelData.artifacts.data(using: .utf8)!
            do {
              let artifacts = try JSONDecoder().decode([ThreeDArtifact].self, from: jsonData)
                
              ApiEvents.shared.ShowLoading()
                if(artifacts.count > 0)
                {
                    let artifact = artifacts.first(where:  {$0.device == Int(GetPlatfrom().rawValue) })
                    if(artifact != nil)
                    {
                        self.LoadModelData(urlstr: (artifact?.url!)!,
                          completionHandler: {
                            data in
                            ModelDecryptionHandler.shared.GetModelData(
                              data: data,
                              completionHandler: {
                                decdata in
                                do {
                                  let sceneSource = GLTFSceneSource(data: decdata)
                                  let scene = try sceneSource.scene()
                                  let tempnode = SCNNode()
                                  tempnode.name = bucketname + "+" + modelData.ID
                                  for meshdata in scene.rootNode.childNodes {
                                    tempnode.addChildNode(meshdata)
                                    meshdata.position = SCNVector3(0, 0, 0)
                                    meshdata.eulerAngles = SCNVector3(0, 0, 0)
                                  }
                                  if currentNodePoint.childNodes.count > 0 {
                                    for item in currentNodePoint.childNodes {
                                      item.removeFromParentNode()
                                    }
                                  }
                                  currentNodePoint.addChildNode(tempnode)
                                  self.headwearModelNode = tempnode
                                  self.HeadCoreBuck = bucketname
                                  if self.hairModelNode != nil {
                                    var blendbucket = false
                                    GetMorphtargetnode(
                                      _bone: self.hairModelNode,
                                      completionHandler: {
                                        node in

                                        for i in 0..<(node.morpher?.targets.count)! {
                                          if bucketname.contains((node.morpher?.targets[i].name)!) {
                                            blendbucket = true
                                            node.morpher?.setWeight(
                                              1.0, forTargetNamed: (node.morpher?.targets[i].name!)!)
                                          }
                                        }
                                      })

                                    if blendbucket == false {
                                      if self.hairModelNode != nil {
                                        self.hairModelNode.isHidden = true
                                      }
                                    }

                                  }
                                  tempnode.isHidden = false
                                  //     DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    ApiEvents.shared.HideLoading()
                                    self.OnQueueNetworkModel()
                                  }
                                } catch {
                                  self.isClicked = false
                                    if(ProjectSettings.shared.isDebug)
                                    {
                                        print("\(error.localizedDescription)")
                                    }
                                  ApiEvents.shared.HideLoading()
                                  ApiEvents.shared.ShowPopupMessage(message: error.localizedDescription)
                                }
                              })
                          })
                    }
                }
                
       
            } catch {
              self.isClicked = false
                if(ProjectSettings.shared.isDebug)
                {
                    print(error)
                }
              ApiEvents.shared.HideLoading()
              ApiEvents.shared.ShowPopupMessage(message: error.localizedDescription)
            }
          }
        }
      }
    }

    
    // This method check default model queuelist  if list is not empty it load default model
    public func OnQueueDefaultModel() {
      if defaultModelList.count > 0 {
        let modelta = defaultModelList[0]
        defaultModelList.remove(at: 0)
        LoadDefaultModel(defaultModel: modelta)
      } else {
        isClicked = false
        if firstTime {
          firstTime = false
          //onCompleteLoadDefaultModel?(true)
        }
      }
    }
    
    //This method load default model glb model
    func LoadDefaultModel(defaultModel: ModelData) {
      // ApiEvents.shared.ShowLoading()
      LoadModelData(urlstr: defaultModel.GlbPath!, completionHandler: {
          (data) in
          let sceneSource = GLTFSceneSource(data: data)

          self.AddDefaultBodyPart(
            model: sceneSource, modelData: defaultModel,
            completionHandler: {
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                ApiEvents.shared.HideLoading()
                self.OnQueueDefaultModel()
              }
            })
        })
    }

    // Thid method remove perticault bucket child model
    func DestroyModel(bucketname: String, category: String, completionHandler: @escaping (Bool) -> Void)
    {
      var isModelPresent: Bool = false
      if bodyPoints.count > 0 {
        for item in bodyPoints {
          if item.name == bucketname {
            if item.childNodes.count > 0 {
              for child in item.childNodes {
                child.removeFromParentNode()
                isModelPresent = true
              }
            }
          }
        }
      }
      completionHandler(isModelPresent)
    }

    
    // After downloading model this function set model in scene in its perticular bucket
    func AddDefaultBodyPart(model:GLTFSceneSource,modelData: ModelData,completionHandler: @escaping () -> Void)
    {
        var bucketname : String;
        let buckets = modelData.CoreBucket!.split(separator: "/");
        bucketname = String(buckets[0])
        var isPresent : Bool = false;
        if(buckets.count>1){
            bucketname = String(buckets[1])
        }
        var bodyPoint : SCNNode!
        
        if(bodyPoints.count > 0)
        {
            for item in bodyPoints{
                if(item.name == bucketname){
                    isPresent = true
                    bodyPoint = item
                }
            }
        }
        var allConflictNames : [Conflict] = []
        if( !modelData.ConflictingBuckets!.isEmpty)
        {
            let jsonArrayData = modelData.ConflictingBuckets!.data(using: .utf8)!
            do{
                if let jsonArr = try JSONSerialization.jsonObject(with: jsonArrayData, options: .allowFragments) as? [Dictionary<String,Any>]
                {
                    
                    for nam in 0..<jsonArr.count
                    {
                        let form_name = jsonArr[nam]["name"] as? String
                        allConflictNames.append(Conflict(name: form_name!))
                    }
                }
                else
                {
                    if(ProjectSettings.shared.isDebug)
                    {
                        print("BAd JSOnn")
                    }
                }
            }
            catch
            {
                isClicked = false;
            }
        }
        
        if (bodyPoints.count > 0)
        {
            for item in bodyPoints
            {
                if(item.name == bucketname)
                {
                    if(item.childNodes.count > 0)
                    {
                        for child in item.childNodes
                        {
                            child.removeFromParentNode()
                        }
                    }
                }
            }
        }
        
        if(bodyPoints.count > 0)
        {
            for item in bodyPoints
            {
                for conflictBucket in allConflictNames
                {
                    if(item.name == conflictBucket.name)
                    {
                        if(item.childNodes.count > 0)
                        {
                            
                            for child in item.childNodes{
                                child.removeFromParentNode()
                            }
                            
                        }
                    }
                }
            }
        }
        if(!isPresent){
            bodyPoint =  SCNNode()
            bodyPoint.name = bucketname
            bodyPoint.position = SCNVector3(0,0,0)
            bodyPoint.eulerAngles = SCNVector3(0,0,0)
            bodyPoints.append(bodyPoint)
            CustomizeModelParent.addChildNode(bodyPoint)
        }
        
        do
        {
            print("=======",modelData.MainCatID)
            let scene = try model.scene()
            for item in scene.rootNode.childNodes
            {
                bodyPoint.addChildNode(item)
            }
            if(modelData.MainCatID == Category.Top.rawValue)
            {
                topNodes = bodyPoint
            }
            if(modelData.MainCatID == Category.Bottom.rawValue)
            {
                bottomNodes = bodyPoint
            }
            
            if(modelData.MainCatID == Category.Footwear.rawValue)
            {
                footwearNodes = bodyPoint
            }
            if(modelData.MainCatID == Category.Handwear.rawValue)
            {
                handwearNodes  = bodyPoint
            }
            self.RemoveClip()
            self.SetAnimation(_bone: topNodes)
            self.SetAnimation(_bone: bottomNodes)
            self.SetAnimation(_bone: outfitnodes)
            self.SetAnimation(_bone: footwearNodes)
            self.SetAnimation(_bone: handwearNodes)
            self.SetAnimation(_bone: headNode)
            
            LoopAllMesh(_bone: bodyPoint, completionHandler: {
                node in
                if(node.firstMaterial?.name ==  "body" || node.firstMaterial?.name ==  "body.001")
                {
                    node.firstMaterial = BodyMaterial.shared.bodyMaterial
                }
            })
            completionHandler()
        }
        catch
        {
            isClicked = false;
            return
        }
        
    }
    
    //This Method Add Animation to loaded model
    func SetAnimation(_bone: SCNNode!) {
      if _bone != nil {
        for item in boneAnimationList {
          if item.name != nil {
            LoopAllNodes(
              _bone: _bone,
              completionHandler: {
                node in
                  
                  var nodename = ""
                  if((node.name?.contains("mixamorig:")) != nil)
                  {
                      nodename = node.name!.replacingOccurrences(of: "mixamorig:", with: "")
                  }
                  
                      if(nodename == item.name) {
                  if item.animationPlayer(forKey: "rotation") != nil {
                    node.addAnimationPlayer(
                      item.animationPlayer(forKey: "rotation")!, forKey: "rotation")
                  }
                  if item.animationPlayer(forKey: "translation") != nil {
                    node.addAnimationPlayer(
                      item.animationPlayer(forKey: "translation")!, forKey: "translation")
                  }
//                  if item.animationPlayer(forKey: "scale") != nil {
//                    node.addAnimationPlayer(item.animationPlayer(forKey: "scale")!, forKey: "scale")
//                  }
                }
              })
          }
        }
      }
    }
    //This Method add loaded body part from network to its bucket
    func AddNetworkBodyPart(model:GLTFSceneSource,modelData: GetEconomyItemsResultDataInner,closure:()->Void)
    {
        let bucketname = GetBucketName(coreBucket: modelData.coreBucket)
        var isPresent : Bool = false;
        var bodyPoint : SCNNode!
        if(bodyPoints.count > 0)
        {
            for item in bodyPoints{
                if(item.name == bucketname){
                    isPresent = true
                    bodyPoint = item
                }
            }
        }
        
        let conflict = try? JSONDecoder().decode([Conflict].self, from: modelData.conflictingBuckets.data(using: .utf8)!)
        
        if (bodyPoints.count > 0)
        {
            for item in bodyPoints
            {
                if(item.name == bucketname)
                {
                    if(item.childNodes.count > 0)
                    {
                        for child in item.childNodes
                        {
                            child.removeFromParentNode()
                        }
                    }
                }
            }
        }
        
        if(bodyPoints.count > 0)
        {
            for item in bodyPoints
            {
                for conflictBucket in conflict!
                {
                    if(item.name == conflictBucket.name)
                    {
                        if(item.childNodes.count > 0)
                        {
                            for child in item.childNodes
                            {
                                child.removeFromParentNode()
                            }
                        }
                    }
                }
            }
        }
        if(!isPresent)
        {
            bodyPoint =  SCNNode()
            bodyPoint.name = bucketname
            bodyPoint.position = SCNVector3(0,0,0)
            bodyPoint.eulerAngles = SCNVector3(0,0,0)
            bodyPoint.scale = SCNVector3(1,1,1)
            bodyPoints.append(bodyPoint)
            CustomizeModelParent.addChildNode(bodyPoint)
        }
        do
        {
            let scene = try model.scene()
            for item in scene.rootNode.childNodes
            {
                item.scale = SCNVector3(1,1,1)
                bodyPoint.addChildNode(item)
            }
            if(modelData.itemCategory == Category.Top.rawValue)
            {
                topNodes = bodyPoint
            }
            if(modelData.itemCategory == Category.Bottom.rawValue)
            {
                bottomNodes = bodyPoint
            }
            if(modelData.itemCategory == Category.Outfit.rawValue)
            {
                outfitnodes = bodyPoint
            }
            if(modelData.itemCategory == Category.Footwear.rawValue)
            {
                footwearNodes = bodyPoint
            }
            if(modelData.itemCategory == Category.Handwear.rawValue)
            {
                handwearNodes  = bodyPoint
                
            }
            self.RemoveClip()
            self.SetAnimation(_bone: topNodes)
            self.SetAnimation(_bone: bottomNodes)
            self.SetAnimation(_bone: outfitnodes)
            self.SetAnimation(_bone: footwearNodes)
            self.SetAnimation(_bone: handwearNodes)
            self.SetAnimation(_bone: headNode)
            
            LoopAllMesh(_bone: bodyPoint, completionHandler:  {
                node in
                if(node.firstMaterial?.name ==  "body")
                {
                    node.firstMaterial = BodyMaterial.shared.bodyMaterial
                }
            })
        }
        catch
        {
            ApiEvents.shared.ShowPopupMessage(message: "Model Data is not encrypted")
            ApiEvents.shared.HideLoading()
            return
        }
        closure()
        CheckMissingAfterModelLoad(modelData: modelData);
    }
    
    //Thos method reset blendshape of perticular name
    func ResetPerticaulerBlendshape(names:String)
    {
        for childNoade in headNode.childNodes
        {
            for layer2 in childNoade.childNodes
            {
                if(layer2.name! == "head_generic")
                {
                    for layer3 in layer2.childNodes
                    {
                        layer3.childNodes.map
                        {
                            for i in 0..<($0.morpher?.targets.count)!
                            {
                                if(($0.morpher?.targets[i].name?.contains(names)) != nil)
                                {
                                    $0.morpher?.setWeight(0, forTargetAt: i)
                                }
                            }
                        }
                    }
                }
            }
        }
        if( facialHairMorpher != nil)
        {
            for i in 0..<(facialHairMorpher?.targets.count)!
            {
                facialHairMorpher?.setWeight(0, forTargetAt: i)
            }
        }
    }
    
    // Clear economy item data
    func EmptyEconomy()-> GetEconomyItemsResultDataInner{
        return  GetEconomyItemsResultDataInner(templateID: "", itemGender: 0, itemCategory: "", itemSubCategory: "", displayName: "", description: "", virtualCurrency: "", realCurrency: 0, tags: "", entitlement: "", isStackable: 0, isLimitedEdition: 0, limitedEditionIntialCount: 0, customMetaData: "", style: "", itemThumbnailsUrl: "", artifacts: "", blendshapeKeys: "", itemSkin: "", status: 0, ID: "", config: "", coreBucket: "", conflictingBuckets: "")
    }
    
    //This method find facial hair node
    func SelectFacialHairMorpher(_bone :SCNNode!)
    {
        if(_bone != nil)
        {
            if(_bone.morpher != nil)
            {
                for childNoade in headNode.childNodes
                {
                    for layer2 in childNoade.childNodes
                    {
                        if(layer2.name! == "head_generic" )
                        {
                            for layer3 in layer2.childNodes
                            {
                                layer3.childNodes.map
                                {
                                    facialHairMorpher.setWeight( ($0.morpher?.weight(forTargetNamed:  ($0.morpher?.targets[0].name)!))!, forTargetNamed:  ($0.morpher?.targets[0].name)!)
                                }
                            }
                        }
                    }
                }
            }
        }
        if(_bone.childNodes.count>0)
        {
            for i in 0..._bone.childNodes.count-1
            {
                SelectFacialHairMorpher(_bone: _bone.childNodes[i]);
            }
        }
    }
    
    //Clear all animation
    public func RemoveClip()
    {
        self.modelBone = []
        self.GetSceneBone(_bone: self.CustomizeModelParent)
        for mBone in  self.modelBone
        {
            mBone.removeAllAnimations()
        }
    }
    
    //Loop throuth all bone of models
    func GetSceneBone(_bone :SCNNode!)
    {
        if(!_bone.isEqual(nil))
        {
            modelBone.append(_bone)
        }
        if(_bone.childNodes.count>0)
        {
            for i in 0..._bone.childNodes.count-1
            {
                GetSceneBone(_bone: _bone.childNodes[i]);
            }
        }
    }
    
    
    // This method load model data from network
    private func LoadModelData(urlstr :String,completionHandler: @escaping (Data) -> Void)
    {
        var observation :NSKeyValueObservation?
        guard let url = URL(string: urlstr) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url)
        {
            (data,Urlresponse ,error) in
            observation?.invalidate()
            guard let data = data else
            {
                return
            }
            //   ApiEvents.shared.HideProgressLoading()
            completionHandler(data)
        }
        observation = task.progress.observe(\.fractionCompleted) { progress, _ in
            
        }
        task.resume()
    }
    
    
    // This method create facewear points
    // Also Set eyeball ,and face material
    private func SetHeadMaterialAndFacewearPoints(_bone :SCNNode!)
    {
        if(_bone != nil)
        {
            if let mat = _bone.geometry?.firstMaterial{
                if(mat.name! == "head")
                {
                    headGeometryModel = _bone.geometry
                    _bone.geometry?.firstMaterial = HeadMaterial.shared.headMaterial
                    _bone.geometry?.firstMaterial?.isLitPerPixel = false
                    VertexList = (_bone.geometry?.GetVertices())!
                }
                if(mat.name! ==  "eyes")
                {
                    _bone.geometry?.firstMaterial = EyeballMaterial.shared.eyeballMaterial
                    _bone.geometry?.firstMaterial?.isLitPerPixel = false
                }
            }
            if(_bone.morpher != nil)
            {
                if((_bone.morpher?.weights.count)! > 0)
                {
                    _bone.morpher?.unifiesNormals = true
                    for i in 0..<(_bone.morpher?.weights.count)!
                    {
                        _bone.morpher?.setWeight(CGFloat( 0), forTargetAt: i)
                    }
                }
            }
            if ((_bone.name) != nil)
            {
                if(_bone.name == "mixamorig:Head")
                {
                    for items in vertexData
                    {
                        let verticses = items.vertexArray.replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
                        if(verticses.contains(","))
                        {
                            let vettexs = verticses.split(separator: ",");
                            
                            let vert1 = Int(vettexs[0])
                            let tempHolder1 = SCNNode()
                            tempHolder1.name =  items.bucketName + "_Left"
                            _bone.addChildNode(tempHolder1)
                            self.facevertexlist.append(FaceVertex(BucketName: tempHolder1.name,Point: tempHolder1,VertexNo: vert1))
                            let vert2 = Int(vettexs[1])
                            let tempHolder2 = SCNNode()
                            tempHolder2.name =  items.bucketName + "_Right"
                            _bone.addChildNode(tempHolder2)
                            self.facevertexlist.append(FaceVertex(BucketName: tempHolder2.name,Point: tempHolder2,VertexNo: vert2))
                        }
                        else
                        {
                            let vertexNo = Int(verticses)
                            let tempHolder = SCNNode()
                            tempHolder.name =  items.bucketName
                            _bone.addChildNode(tempHolder)
                            self.facevertexlist.append(FaceVertex(BucketName: items.bucketName,Point: tempHolder,VertexNo: vertexNo))
                        }
                    }
                }
                
            }
        }
        if(_bone.childNodes.count>0)
        {
            for i in 0..._bone.childNodes.count-1
            {
                SetHeadMaterialAndFacewearPoints(_bone: _bone.childNodes[i]);
            }
        }
    }
    
    
    
    
    var onCompleteLoadDefaultModel: ((Bool) -> Void)? = { done in
        if(ProjectSettings.shared.isDebug)
        {
            print("All Default Model Loaded")
        }
        //     LoadDdat(cat:  Category.Top.rawValue)
    }
    
    
    // Fload Default Models On Start
    private func LoadAllDefaultModel()
    {
        var modeldataList : [ModelData] = []
        var gender = "1"
        if(GetGender() == Gender.Male)
        {
            gender = "1"
        }
        if(GetGender() == Gender.Female)
        {
            gender = "2"
        }
        if(ProjectSettings.shared.isDebug)
        {
            print("gender",gender)
        }
        modeldataList = DefaultAvatarData.shared.GetDefaultModelList(gender: gender);
        for i in 0...modeldataList.count-1 {
            defaultModelList.append(modeldataList[i])
        }
        OnQueueDefaultModel()
    }
    func RemoeAllDetault(){
        
    }
    
    
    private func LoadAllDefaulModel_Start(completionHandler: @escaping () -> Void)
    {
        var modeldataList : [ModelData] = []
        var gender = "1"
        if(GetGender() == Gender.Male)
        {
            gender = "1"
        }
        if(GetGender() == Gender.Female)
        {
            gender = "2"
            //            DataHolder.shared.defaultModelFromNetwork = true
        }
        modeldataList = DefaultAvatarData.shared.GetDefaultModelList(gender: gender);
        for i in 0...modeldataList.count-1 {
            defaultModelList.append(modeldataList[i])
        }
        LoadDefaultModel_start(completionHandler: completionHandler)
    }
    
    private func LoadDefaultModel_start(completionHandler: @escaping () -> Void)
    {
        if(defaultModelList.count>0)
        {
            //ApiEvents.shared.ShowLoading()
            LoadModelData(urlstr:defaultModelList[0].GlbPath!, completionHandler:
                            {
                (data) in
                let sceneSource = GLTFSceneSource(data: data)
                self.AddDefaultBodyPart(model:sceneSource,modelData: self.defaultModelList[0],completionHandler: {
                    self.defaultModelList.remove(at: 0)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        ApiEvents.shared.HideLoading()
                        self.LoadDefaultModel_start(completionHandler: completionHandler)
                    }
                })
            })
        }
        else
        {
            completionHandler()
        }
    }
    
    //This method Set face blendshape
    //Set single blendshape value
    private  func SetBlenshape(names:String,value: Float)
    {
        
        for childNoade in headNode.childNodes
        {
            for layer2 in childNoade.childNodes
            {
                if(layer2.name! == "head_generic" )
                {
                    for layer3 in layer2.childNodes
                    {
                        layer3.childNodes.map
                        {
                            $0.morpher?.setWeight(CGFloat(value), forTargetNamed: names)
                            $0.morpher?.calculationMode = .additive
                        }
                    }
                }
            }
        }
        
        if( facialHairMorpher != nil)
        {
            
            facialHairMorpher.setWeight(CGFloat(value), forTargetNamed: names)
        }
        GetVertex()
    }
    
    // This method set expression on face for different look
    private func SetExpression(names:String,value: Float)
    {
        if(headmorpherModel != nil)
        {
            headmorpherModel.unifiesNormals = true
            headmorpherModel.calculationMode = .additive
            headmorpherModel.setWeight(CGFloat(value), forTargetNamed: names + "1")
        }
        if(innermouthmorpherModel != nil)
        {
            innermouthmorpherModel.unifiesNormals = true
            innermouthmorpherModel.calculationMode = .additive
            innermouthmorpherModel.setWeight(CGFloat(value), forTargetNamed: names + "1")
        }
        if( facialHairMorpher != nil)
        {
            facialHairMorpher.setWeight(CGFloat(value), forTargetNamed: names)
        }
        for childNoade in headNode.childNodes
        {
            for layer2 in childNoade.childNodes
            {
                if(layer2.name! == "head_generic" )
                {
                    for layer3 in layer2.childNodes
                    {
                        layer3.childNodes.map
                        {
                            if(ProjectSettings.shared.isDebug)
                            {
                                // print("TArgeted Blendshapes----",names)
                            }
                            $0.morpher?.setWeight(CGFloat(value), forTargetNamed: names + "1")
                            $0.morpher?.calculationMode = .additive
                        }
                    }
                }
            }
        }
    }

    //This method remove all changes and reset to default model
    func ResetToDefault()
    {
        ApiEvents.shared.ShowLoading()
        //DataHolder.shared.currentSelectedBodyParts = []
        //DataHolder.shared.itemsTobuy  = []
        currentSelectedTop = nil
        currentSelectedBottom = nil
        currentSelectedOutfit = nil
        currentSelectedHandwear = nil
        currentSelectedFootwear = nil
        currentFaceShapeData = nil
        currentNoseShapeData = nil
        currentEyebrowshapeData = nil
        currentEyeShapeData = nil
        currentLipShapeData = nil
        currentEarshapeData = nil
        currentWristwearData = nil
        currentEyeballData = nil
        currentLipsData = nil
        currentEyebrowData = nil
        currentSkinToneData = nil
        networkModelQueueList = []
        
        for item in bodyPoints
        {
            if(item.childNodes.count>0)
            {
                for child in item.childNodes
                {
                    child.removeFromParentNode()
                }
            }
        }
        for item in facevertexlist
        {
            if(item.Point.childNodes.count>0)
            {
                for child in item.Point.childNodes
                {
                    child.removeFromParentNode()
                }
            }
        }
        BodyMaterial.shared.clearTattooTexture()
        BodyMaterial.shared.RemoveBodyColor()
        HeadMaterial.shared.RemoveBodyColor()
        HeadMaterial.shared.RemoveTattooTexture()
        HeadMaterial.shared.RemoveHeadHairTex()
        HeadMaterial.shared.RemoveHairColor()
        HeadMaterial.shared.RemoveBeardTex()
        HeadMaterial.shared.RemoveBreardColor()
        HeadMaterial.shared.RemoveEyebrowTex()
        HeadMaterial.shared.RemoveEyebrowColor()
        HeadMaterial.shared.RemoveLipTex()
        HeadMaterial.shared.RemoveLipColor()
        EyeballMaterial.shared.RemoveEyeballTex()
        BodyMaterial.shared.ResetSkinTonetexture()
        HeadMaterial.shared.RemoveSkinTonetexture()
        FacialhairMaterial.shared.RemoveFacialhaiColor()
        HairMaterial.shared.RemovehaiColor()
        //    CurrentSelectedAvatarDetail.shared.ChangedAvatarColor = UserDetailHolder.shared.userDetail.currentUserSelectedAvatar.avatardata.ColorMeta
        for childNoade in headNode.childNodes
        {
            for layer2 in childNoade.childNodes
            {
                if(layer2.name! == "head_generic")
                {
                    for layer3 in layer2.childNodes
                    {
                        layer3.childNodes.map
                        {
                            for i in 0..<($0.morpher?.targets.count)!
                            {
                                $0.morpher?.setWeight(0, forTargetAt: i)
                            }
                        }
                    }
                }
            }
        }
        LoadAllDefaultModel(OnComplete:
                            {
            
            
            ApiEvents.shared.HideLoading()
 
        })
    }
    
    public func LoadAllDefaultModel(OnComplete:@escaping () -> Void)
    {
        var modeldataList : [ModelData] = []
        var gender = "1"
        if(GetGender() == Gender.Male)
        {
            gender = "1"
        }
        if(GetGender() == Gender.Female)
        {
            gender = "2"
        }
        modeldataList = DefaultAvatarData.shared.GetDefaultModelList(gender: gender);
        for i in 0...modeldataList.count-1
        {
            defaultModelList.append(modeldataList[i])
        }
        OnQueueDefaultModel(OnComplete: OnComplete)
    }
    
    func OnQueueDefaultModel(OnComplete:@escaping () -> Void)
    {
        if(defaultModelList.count > 0)
        {
            let modelta = defaultModelList[0]
            defaultModelList.remove(at: 0)
            DownloadDefaultModel( defaultModel: modelta,OnComplete: OnComplete)
        }
        else
        {
            OnComplete()
        }
    }
    
    func DownloadDefaultModel(defaultModel: ModelData,OnComplete:@escaping () -> Void)
    {
        LoadModelData(urlstr:defaultModel.GlbPath!, completionHandler:
        {
            (data) in
            let sceneSource = GLTFSceneSource(data: data)
            self.AddDefaultBodyPart(model:sceneSource,modelData: defaultModel,completionHandler:
                                        {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3)
                {
                    self.OnQueueDefaultModel(OnComplete: OnComplete)
                }
            })
        })
    }
    
    //This method reset to current selected model
    func ResetToCurrentSelectedModel()
    {
        
        //DataHolder.shared.currentSelectedBodyParts = []
        //DataHolder.shared.itemsTobuy  = []
        //CurrentSelectedAvatarDetail.shared.ChangedAvatarColor = UserDetailHolder.shared.userDetail.currentUserSelectedAvatar.avatardata.ColorMeta
        ApiEvents.shared.ShowLoading()
        currentSelectedTop = nil
        currentSelectedBottom = nil
        currentSelectedOutfit = nil
        currentSelectedHandwear = nil
        currentSelectedFootwear = nil
        currentWristwearData = nil
        currentEyeballData = nil
        currentLipsData = nil
        currentEyebrowData = nil
        currentSkinToneData = nil
        currentFaceShapeData = nil
        currentNoseShapeData = nil
        currentEyebrowshapeData = nil
        currentEyeShapeData = nil
        currentLipShapeData = nil
        currentEarshapeData = nil
        networkModelQueueList = []
        
        for item in bodyPoints
        {
            if(item.childNodes.count>0)
            {
                for child in item.childNodes
                {
                    child.removeFromParentNode()
                }
            }
        }
        for item in facevertexlist
        {
            if(item.Point.childNodes.count>0)
            {
                for child in item.Point.childNodes
                {
                    child.removeFromParentNode()
                }
            }
        }
        BodyMaterial.shared.clearTattooTexture()
        BodyMaterial.shared.RemoveBodyColor()
        HeadMaterial.shared.RemoveBodyColor()
        HeadMaterial.shared.RemoveTattooTexture()
        HeadMaterial.shared.RemoveHeadHairTex()
        HeadMaterial.shared.RemoveHairColor()
        HeadMaterial.shared.RemoveBeardTex()
        HeadMaterial.shared.RemoveBreardColor()
        HeadMaterial.shared.RemoveEyebrowTex()
        HeadMaterial.shared.RemoveEyebrowColor()
        HeadMaterial.shared.RemoveLipTex()
        HeadMaterial.shared.RemoveLipColor()
        EyeballMaterial.shared.RemoveEyeballTex()
        BodyMaterial.shared.ResetSkinTonetexture()
        HeadMaterial.shared.RemoveSkinTonetexture()
        FacialhairMaterial.shared.RemoveFacialhaiColor()
        HairMaterial.shared.RemovehaiColor()
        HeadMaterial.shared.RemoveTattooTexture()
        HeadMaterial.shared.RemoveHeadHairTex()
        HeadMaterial.shared.RemoveHairColor()
        HeadMaterial.shared.RemoveBeardTex()
        HeadMaterial.shared.RemoveBreardColor()
        HeadMaterial.shared.RemoveEyebrowTex()
        HeadMaterial.shared.RemoveEyebrowColor()
        HeadMaterial.shared.RemoveLipTex()
        HeadMaterial.shared.RemoveLipColor()
        EyeballMaterial.shared.RemoveEyeballTex()
        BodyMaterial.shared.ResetSkinTonetexture()
        HeadMaterial.shared.RemoveSkinTonetexture()
        FacialhairMaterial.shared.RemoveFacialhaiColor()
        HairMaterial.shared.RemovehaiColor()
        
        
        for childNoade in headNode.childNodes
        {
            for layer2 in childNoade.childNodes
            {
                if(layer2.name! == "head_generic")
                {
                    for layer3 in layer2.childNodes
                    {
                        layer3.childNodes.map
                        {
                            for i in 0..<($0.morpher?.targets.count)!
                            {
                                $0.morpher?.setWeight(0, forTargetAt: i)
                            }
                        }
                    }
                }
            }
        }
        LoadAllDefaultModel(OnComplete:
                            {
            
//                        let modelList = UserDetailHolder.shared.userDetail.currentUserSelectedAvatar.avatardata.BucketData
//                        var id : [String] = []
//                        for item in modelList
//                        {
//                            if(!DataHolder.shared.IsItemPresentInCurrentSelected(ID:  item.ID))
//                            {
//                                id.append(item.ID)
//                            }
//                        }
//                        if(id.count > 0)
//                        {
//                            for item in id
//                            {
//                                let modeldata =  EconomyItemHolder.shared.EconomyItems.first(where:  { $0.ID == item })
//                                if(modeldata != nil)
//                                {
//                                    self.netwrokModelList.append(modeldata!)
//                                }
//                            }
//                        }
//                        else
//                        {
//                            ApiEvents.shared.HideLoading()
//                        }
            self.OnQueueNetworkModel()
            
        })
    }
    
    func GetVertex()
    {
        
        for childNoade in headNode.childNodes
        {
            for layer2 in childNoade.childNodes
            {
                if(layer2.name! == "head_generic")
                {
                    for layer3 in layer2.childNodes
                    {
                        layer3.childNodes.map
                        {
                            let verteslist : [SCNVector3] = ($0.geometry?.GetVertices()!)!
                            if($0.geometry?.firstMaterial?.name == "inner_mouth")
                            {
                                innermouthmorpherModel = $0.morpher
                            }
                            
                            if(verteslist.count > 1500)
                            {
                                headGeometryModel = $0.geometry
                                headmorpherModel = $0.morpher
                                let vertes =  $0.geometry?.GetVertices()
                                var poselement: [SCNVector3] = []
                                for i in 0...vertes!.count-1
                                {
                                    poselement.append(vertes![i])
                                }
                                
                                for i in 0...($0.morpher?.targets.count)!-1
                                {
                                    let influ =  $0.morpher?.weight(forTargetAt: i)
                                    let arr =  $0.morpher?.targets[i].GetVertices()
                                    let inf = Float(influ!)
                                    for j in 0...poselement.count-1
                                    {
                                        let xval = arr![j].x * inf
                                        let yval = arr![j].y * inf
                                        let zval = arr![j].z * inf
                                        poselement[j].x += xval
                                        poselement[j].y += yval
                                        poselement[j].z += zval
                                    }
                                }
                                VertexList = poselement
                                
                                for verts in facevertexlist
                                {
                                    verts.Point.worldPosition = verteslist[verts.VertexNo]
                                }
                            }
                            
                        }
                    }
                }
            }
        }
        
    }
    
    //This method extract animation from glb model
    func LoadAnimationFromBone(_bone :SCNNode!)
    {
        if(!_bone.isEqual(nil))
        {
            boneAnimationList.append(_bone)
        }
        if(_bone.childNodes.count>0)
        {
            for i in 0..._bone.childNodes.count-1
            {
                LoadAnimationFromBone(_bone: _bone.childNodes[i]);
            }
        }
    }
    
    func LoopAllNodes(_bone :SCNNode!,completionHandler: @escaping (SCNNode) -> Void)
    {
        if(!_bone.isEqual(nil))
        {
            if _bone.name != nil{
                
                completionHandler(_bone)
            }
        }
        if(_bone.childNodes.count>0)
        {
            for i in 0..._bone.childNodes.count-1
            {
                LoopAllNodes(_bone: _bone.childNodes[i],completionHandler:completionHandler);
            }
        }
    }
    
    
    
    
    // This method loop
    func GetBones(_bone :SCNNode!)
    {
        if(!_bone.isEqual(nil))
        {
            clipBones.append(_bone)
        }
        if(_bone.childNodes.count>0)
        {
            for i in 0..._bone.childNodes.count-1
            {
                GetBones(_bone: _bone.childNodes[i]);
            }
        }
    }
    
    
    func RemoveAllDefault()
    {
        if (bodyPoints.count > 0)
        {
            for item in bodyPoints
            {
                if(item.childNodes.count > 0)
                {
                    for child in item.childNodes
                    {
                        child.removeFromParentNode()
                    }
                }
            }
        }
    }
    
    
    // This method add animation clip
    public func SetClips(clip : AvatarClip,completionHandler: @escaping () -> Void)
    {
        if(clip.artifacts.count>0)
        {
            ApiEvents.shared.ShowLoading()
            LoadModelData(urlstr: clip.artifacts[0].mesh_url, completionHandler:
                            {
                data in
                self.RemoveClip()
                let sceneSource = GLTFSceneSource(data: data)
                let scene = try! sceneSource.scene()
                self.clipBones = []
                self.GetBones(_bone: scene.rootNode.childNodes[0])
                self.modelBone = []
                self.GetSceneBone(_bone: self.CustomizeModelParent)
                for mBone in self.modelBone
                {
                    mBone.removeAllAnimations()
                }
                for i in 0...self.clipBones.count-1
                {
                    for mBone in  self.modelBone
                    {
                        if(mBone.name == self.clipBones[i].name)
                        {
                            if(self.clipBones[i].animationPlayer(forKey: "rotation") != nil){
                                mBone.addAnimationPlayer(self.clipBones[i].animationPlayer(forKey: "rotation")!,  forKey: "rotation")
                                mBone.animationPlayer(forKey:"rotation")?.stop()
                            }
                            if(self.clipBones[i].animationPlayer(forKey: "translation") != nil){
                                mBone.addAnimationPlayer(self.clipBones[i].animationPlayer(forKey: "translation")!,  forKey: "translation")
                                mBone.animationPlayer(forKey:"translation")?.stop()
                            }
                                                        if(mBone.animationPlayer(forKey: "scale") != nil){
                                                            mBone.addAnimationPlayer(self.clipBones[i].animationPlayer(forKey: "scale")!,  forKey: "scale")
                                                        }
                        }
                    }
                }
                for mBone in  self.modelBone
                {
                    if(mBone.animationPlayer(forKey: "rotation") != nil)
                    {
                        mBone.animationPlayer(forKey:"rotation")?.play()
                    }
                    if(mBone.animationPlayer(forKey: "translation") != nil)
                    {
                        mBone.animationPlayer(forKey:"translation")?.play()
                    }
                }
                self.GetVertex()
                ApiEvents.shared.HideLoading()
                completionHandler()
            })
        }
    }
    
    
    // This method check queue list if list is not empty then load next model
    func OnQueueNetworkModel() {
        if networkModelQueueList.count > 0 {
            let modeldta = networkModelQueueList[0]
            networkModelQueueList.remove(at: 0)
            DownloadNetworkModel(modelData: modeldta)
        } else {
            isClicked = false
            ApiEvents.shared.HideLoading()
        }
    }

    
    // This method Check Item Category based on category Call different method to load model
    private func DownloadNetworkModel(modelData: GetEconomyItemsResultDataInner) {
        if AvataryugData.shared.IsBodyPartCategory(category: modelData.itemCategory)! {
            LoadBodyPart(modelData: modelData)
        } else if AvataryugData.shared.IsBodywearCategory(category: modelData.itemCategory)! {
            LoadBodywearPart(modelData: modelData)
        } else if AvataryugData.shared.IsBodyTattoCategory(category: modelData.itemCategory)! {
            DownloadTattoos(modelData: modelData)
        } else if AvataryugData.shared.IsHeadFaceWearCategory3D(category: modelData.itemCategory)! {
            LoadHeadFaceWearCategory3D(modelData: modelData)
        } else if AvataryugData.shared.IsHeadFaceWearCategory2D(category: modelData.itemCategory)! {
            LoadFaceWearCategory2D(modelData: modelData)
        } else if AvataryugData.shared.IsBlendshapeCategory(category: modelData.itemCategory)! {
            LoadBlendshape(modelData: modelData)
        }
    }

    
    // This method return bucket name from core bucket
    private func GetBucketName(coreBucket: String) -> String {
        var bucketName = ""
        if !coreBucket.isEmpty {
            let buckets = coreBucket.split(separator: "/")
            bucketName = String(buckets[0])
            if buckets.count > 1 {
                bucketName = String(buckets[1])
            }
        }
        return bucketName
    }

    
    //This method load body parts like top, bottom ,outfit ,handwear ,footwear
    func LoadBodyPart(modelData: GetEconomyItemsResultDataInner) {
        let bucketname = GetBucketName(coreBucket: modelData.coreBucket)

        var isModelPresent: Bool = false

        if modelData.itemCategory == Category.Top.rawValue {
            if currentSelectedTop != nil {
                if currentSelectedTop.ID == modelData.ID {
                    DestroyModel(
                        bucketname: bucketname, category: modelData.itemCategory,
                        completionHandler: {
                            isPresent in
                            isModelPresent = isPresent
                            //DataHolder.shared.RemovePart(economyItem: modelData)
                            self.currentSelectedTop = nil
                            self.CheckMissingModelAfterRemovingSameModel(modelData: modelData)
                        })
                } else {
                    //DataHolder.shared.RemovePart(category:  Category.Outfit.rawValue)
                    currentSelectedTop = modelData
                    currentSelectedOutfit = nil
                    //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                }
            } else {
                //DataHolder.shared.RemovePart(category:  Category.Outfit.rawValue)
                currentSelectedTop = modelData
                currentSelectedOutfit = nil
                //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
            }
        }

        if modelData.itemCategory == Category.Bottom.rawValue {
            if currentSelectedBottom != nil {
                if currentSelectedBottom.ID == modelData.ID {
                    DestroyModel(
                        bucketname: bucketname, category: modelData.itemCategory,
                        completionHandler: {
                            isPresent in
                            isModelPresent = isPresent
                            //DataHolder.shared.RemovePart(economyItem: modelData)
                            self.currentSelectedBottom = nil
                            self.CheckMissingModelAfterRemovingSameModel(modelData: modelData)
                        })
                } else {
                    //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    //DataHolder.shared.RemovePart(category:  Category.Outfit.rawValue)
                    currentSelectedBottom = modelData
                    currentSelectedOutfit = nil
                }
            } else {
                //DataHolder.shared.RemovePart(category:  Category.Outfit.rawValue)
                currentSelectedBottom = modelData
                currentSelectedOutfit = nil
                //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
            }
        }
        if modelData.itemCategory == Category.Outfit.rawValue {
            if currentSelectedOutfit != nil {
                if currentSelectedOutfit.ID == modelData.ID {
                    DestroyModel(
                        bucketname: bucketname, category: modelData.itemCategory,
                        completionHandler: {
                            isPresent in
                            isModelPresent = isPresent
                            //DataHolder.shared.RemovePart(economyItem: modelData)
                            self.currentSelectedOutfit = nil
                            self.CheckMissingModelAfterRemovingSameModel(modelData: modelData)
                        })
                } else {
                    //DataHolder.shared.RemovePart(category:  Category.Top.rawValue)
                    //DataHolder.shared.RemovePart(category:  Category.Bottom.rawValue)
                    //DataHolder.shared.RemovePart(category:  Category.Outfit.rawValue)
                    currentSelectedOutfit = modelData
                    currentSelectedBottom = nil
                    currentSelectedTop = nil
                    //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                }
            } else {

                //DataHolder.shared.RemovePart(category:  Category.Outfit.rawValue)
                //DataHolder.shared.RemovePart(category:  Category.Top.rawValue)
                //DataHolder.shared.RemovePart(category:  Category.Bottom.rawValue)
                currentSelectedOutfit = modelData
                currentSelectedBottom = nil
                currentSelectedTop = nil
                //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
            }
        }

        if modelData.itemCategory == Category.Footwear.rawValue {
            if currentSelectedFootwear != nil {
                if currentSelectedFootwear.ID == modelData.ID {
                    DestroyModel(
                        bucketname: bucketname, category: modelData.itemCategory,
                        completionHandler: {
                            isPresent in
                            isModelPresent = isPresent
                            //DataHolder.shared.RemovePart(economyItem: modelData)
                            self.currentSelectedFootwear = nil
                            self.CheckMissingModelAfterRemovingSameModel(modelData: modelData)
                        })
                } else {
                    //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    currentSelectedFootwear = modelData
                }
            } else {

                //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                currentSelectedFootwear = modelData
            }
        }

        if modelData.itemCategory == Category.Handwear.rawValue {
            if currentSelectedHandwear != nil {
                if currentSelectedHandwear.ID == modelData.ID {
                    DestroyModel(
                        bucketname: bucketname, category: modelData.itemCategory,
                        completionHandler: {
                            isPresent in
                            isModelPresent = isPresent
                            //DataHolder.shared.RemovePart(economyItem: modelData)
                            self.currentSelectedHandwear = nil
                            self.CheckMissingModelAfterRemovingSameModel(modelData: modelData)
                        })
                } else {
                    currentSelectedHandwear = modelData
                    //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                }
            } else {
                currentSelectedHandwear = modelData
                //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
            }
        }

        if !isModelPresent {
            let jsonData = modelData.artifacts.data(using: .utf8)!
            do {
                ApiEvents.shared.ShowLoading()
                let artifacts = try JSONDecoder().decode([ThreeDArtifact].self, from: jsonData)
                if(artifacts.count > 0)
                {
                    let artifact = artifacts.first(where:  {$0.device == Int(GetPlatfrom().rawValue) })
                    if(artifact != nil)
                    {
                        LoadModelData(
                            urlstr: (artifact?.url!)!,
                            completionHandler: {
                                (data) in
                                ModelDecryptionHandler.shared.GetModelData(
                                    data: data,
                                    completionHandler: {
                                        decdata in
                                        let sceneSource = GLTFSceneSource(data: decdata)
                                        //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                        self.AddNetworkBodyPart(
                                            model: sceneSource, modelData: modelData,
                                            closure: {
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                                    ApiEvents.shared.HideLoading()
                                                    self.OnQueueNetworkModel()
                                                }
                                            })
                                    })
                            })
                    }
           

                }
            } catch {
                if(ProjectSettings.shared.isDebug)
                {
                    print(error.localizedDescription)
                }
            }
        }
    }

    
    //This method load bodywear part like wrist watch
    func LoadBodywearPart(modelData : GetEconomyItemsResultDataInner)
    {
        ApiEvents.shared.ShowLoading()
        
        let bucketname = GetBucketName(coreBucket: modelData.coreBucket)
        
        var isModelPresent : Bool = false;
        
        if(modelData.itemCategory == Category.Wristwear.rawValue)
        {
            if(currentWristwearData != nil)
            {
                if(currentWristwearData.ID == modelData.ID)
                {
                    DestroyModel(bucketname: bucketname,category: modelData.itemCategory, completionHandler:
                                    {
                        isPresent in
                        isModelPresent = isPresent
                        //DataHolder.shared.RemovePart(economyItem: modelData)
                        self.currentWristwearData = nil
                    })
                }
                else
                {
                    currentWristwearData = modelData
                    //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                }
            }
            else
            {
                currentWristwearData = modelData
                //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
            }
        }
        
        if(!isModelPresent )
        {
            let jsonData = modelData.artifacts.data(using: .utf8)!
            do
            {
                var artifacts : [ThreeDArtifact] = []
                artifacts = try JSONDecoder().decode([ThreeDArtifact].self, from: jsonData)
                if(artifacts.count > 0)
                {
                    let artifact = artifacts.first(where:  {$0.device == Int(GetPlatfrom().rawValue) })
                    if(artifact != nil)
                    {
                        LoadModelData(urlstr: (artifact?.url!)!, completionHandler:
                                        {
                            (data) in
                            ModelDecryptionHandler.shared.GetModelData(data: data,completionHandler:
                                                                        {
                                decdata in
                                let sceneSource = GLTFSceneSource(data: decdata)
                                //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                self.AddNetworkBodywearPart(model: sceneSource, modelData: modelData, closure:
                                                                {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                                    {
                                        ApiEvents.shared.HideLoading()
                                        self.OnQueueNetworkModel();
                                    }
                                })
                            })
                        })
                    }
               
                }
                else
                {
                    ApiEvents.shared.ShowPopupMessage(message: "Data not available")
                    self.OnQueueNetworkModel();
                }
            }
            catch
            {
                ApiEvents.shared.ShowPopupMessage(message: error.localizedDescription)
                self.OnQueueNetworkModel();
            }
        }
    }
    
    // This methos set loaded model in its proper bucket
    func AddNetworkBodywearPart(model:GLTFSceneSource,modelData: GetEconomyItemsResultDataInner,closure:()->Void)
    {
        let bucketname = GetBucketName(coreBucket: modelData.coreBucket)
        var isPresent : Bool = false;
        var bodyPoint : SCNNode!
        if(bodyPoints.count > 0)
        {
            for item in bodyPoints
            {
                if(item.name == bucketname)
                {
                    isPresent = true
                    bodyPoint = item
                }
            }
        }
        let conflict = try? JSONDecoder().decode([Conflict].self, from: modelData.conflictingBuckets.data(using: .utf8)!)
        if (bodyPoints.count > 0)
        {
            for item in bodyPoints
            {
                if(item.name == bucketname)
                {
                    if(item.childNodes.count > 0)
                    {
                        for child in item.childNodes
                        {
                            child.removeFromParentNode()
                        }
                    }
                }
            }
        }
        if(bodyPoints.count > 0)
        {
            for item in bodyPoints
            {
                for conflictBucket in conflict!
                {
                    if(item.name == conflictBucket.name)
                    {
                        if(item.childNodes.count > 0)
                        {
                            for child in item.childNodes
                            {
                                child.removeFromParentNode()
                            }
                        }
                    }
                }
            }
        }
        
        if(!isPresent)
        {
            bodyPoint =  SCNNode()
            bodyPoint.name = bucketname
            bodyPoint.position = SCNVector3(0,0,0)
            bodyPoint.eulerAngles = SCNVector3(0,0,0)
            bodyPoints.append(bodyPoint)
            let bodywearPoints: [BodywearPointDetail] = DefaultAvatarData.shared.GetBodyLodalPointList()
            var pointdetail :BodywearPointDetail!
            for item in bodywearPoints
            {
                if(item.PointName == bucketname)
                {
                    pointdetail = item
                    break
                }
            }
            if(pointdetail != nil)
            {
                let bonename =  pointdetail.BoneName
                let bonePoint = headNode.childNode(withName:"mixamorig:"+bonename , recursively: true)
                bonePoint?.addChildNode(bodyPoint)
                bodyPoint.position = pointdetail!.Position
                bodyPoint.eulerAngles = pointdetail!.Rotation
            }
            do
            {
                let scene = try model.scene()
                for item in scene.rootNode.childNodes
                {
                    bodyPoint.addChildNode(item)
                }
            }
            catch
            {
                if(ProjectSettings.shared.isDebug)
                {
                    print("\(error.localizedDescription)")
                }
                return
            }
            closure()
        }
        else
        {
            do
            {
                let scene = try model.scene()
                for item in scene.rootNode.childNodes
                {
                    bodyPoint.addChildNode(item)
                }
            }
            catch
            {
                if(ProjectSettings.shared.isDebug)
                {
                    print("\(error.localizedDescription)")
                }
                return
            }
            closure()
        }
    }
    
    
    // This method load different category of tattoo
    private func DownloadTattoos(modelData : GetEconomyItemsResultDataInner)
    {
        var isPresentSameCat : Bool = false
        var isPresentLatstId : Bool = false
        var tatooSameIDindex : Int = -1
        var tatooSameCatindex : Int = -1
        
        if (lastLoadedTattoos.count > 0)
        {
            for i in 0..<lastLoadedTattoos.count
            {
                if (lastLoadedTattoos[i].ItemCategory == modelData.itemCategory)
                {
                    isPresentSameCat = true
                    tatooSameCatindex = i
                    if (lastLoadedTattoos[i].tattooid == modelData.ID)
                    {
                        isPresentLatstId = true
                        tatooSameIDindex = i
                    }
                }
            }
        }
        var addNew : Bool = false
        
        if (isPresentSameCat)
        {
            if (isPresentLatstId)
            {
                //DataHolder.shared.RemovePart(economyItem: modelData)
                lastLoadedTattoos.remove(at: tatooSameIDindex)
                OnProcessModelTexture(closure: {
                    OnQueueNetworkModel();
                })
            }
            else
            {
                //DataHolder.shared.RemovePart(economyItem: modelData)
                lastLoadedTattoos.remove(at: tatooSameCatindex)
                addNew = true
            }
        }
        else
        {
            addNew = true
        }
        
        if(addNew)
        {
            let jsonData = modelData.artifacts.data(using: .utf8)!
            do
            {
                ApiEvents.shared.ShowLoading()
                let artifacts = try JSONDecoder().decode([TwoDArtifact].self, from: jsonData)
                if(artifacts.count > 0)
                {
                    guard let url = URL(string:  artifacts[0].link! )else{
                        return
                    }
                    let getDataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
                        guard let data = data ,  error == nil else {
                            return
                        }
                        self.lastLoadedTattoos.append( LoadedTattoo(ItemCategory: modelData.itemCategory, tattooTex: data, tattooid: modelData.ID))
                        
                        self.OnProcessModelTexture(closure: {
                            //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                ApiEvents.shared.HideLoading()
                                self.OnQueueNetworkModel();
                            }
                        })
                    })
                    getDataTask.resume()
                }
                else
                {
                    self.OnQueueNetworkModel();
                }
            }
            catch
            {
                if(ProjectSettings.shared.isDebug)
                {
                    print(error)
                }
            }
        }
    }
    
    // This method clear all body and head tattoo and then apply all loaded tattoos from list
    func OnProcessModelTexture(closure: () -> Void) {
        BodyMaterial.shared.clearTattooTexture()
        HeadMaterial.shared.RemoveTattooTexture()
        if lastLoadedTattoos.count > 0 {
            for tattoo in lastLoadedTattoos {
                if tattoo.ItemCategory == Category.HeadTattoo.rawValue {
                    HeadMaterial.shared.SetTattooTexture(tatto: UIImage(data: tattoo.tattooTex)!)
                } else {
                    BodyMaterial.shared.SetTattooTexture(
                        key: tattoo.ItemCategory, texture: UIImage(data: tattoo.tattooTex)!)
                }
            }
        }
        closure()
    }
    
    
    // This method check category and call method depend on cagegory model
    private func LoadHeadFaceWearCategory3D(modelData : GetEconomyItemsResultDataInner)
    {
        GetVertex()
        Category.Eyebrowswear.rawValue
        if(modelData.itemCategory ==  Category.Eyewear.rawValue || modelData.itemCategory == Category.Mouthwear.rawValue || modelData.itemCategory == Category.Earwear.rawValue || modelData.itemCategory == Category.Eyebrowswear.rawValue ||
           modelData.itemCategory == Category.Facewear.rawValue || modelData.itemCategory == Category.Neckwear.rawValue || modelData.itemCategory == Category.Nosewear.rawValue)
        {
            LoadFacewear(modelData: modelData)
        }
        
        if( modelData.itemCategory == Category.Hair.rawValue )
        {
            ResetBlendshapes()
            LoadHair(modelData: modelData)
        }
        if( modelData.itemCategory == Category.Facialhair.rawValue)
        {
            LoadFacialHair(modelData: modelData)
        }
        if( modelData.itemCategory == Category.Headwear.rawValue )
        {
            ResetBlendshapes()
            LoadHeadwear(modelData: modelData)
        }
    }
    
    func ResetBlendshapes()
    {
        if (hairModelNode != nil)
        {
            hairModelNode.isHidden = false
            CheckBlendshape(_bone:hairModelNode)
            if (headwearModelNode == nil)
            {
                HeadCoreBuck = "";
            }
        }
    }
    
    func LoadFacewear(modelData : GetEconomyItemsResultDataInner)
    {
        ApiEvents.shared.ShowLoading()
        let bucketname = GetBucketName(coreBucket: modelData.coreBucket)
        var isSameModelPresent : Bool = false;
        var currentNodePoint : SCNNode!
        let verteslist : [SCNVector3] = headGeometryModel.GetVertices()!
        for verts in facevertexlist
        {
            verts.Point.worldPosition = verteslist[verts.VertexNo]
        }
        for vertP in facevertexlist
        {
            if( vertP.Point.name == bucketname)
            {
                currentNodePoint = vertP.Point
                break;
            }
        }
        if(currentNodePoint != nil)
        {
            if(currentNodePoint.childNodes.count > 0)
            {
                let nodename = currentNodePoint.childNodes[0].name!
                if(nodename.contains(modelData.ID))
                {
                    isSameModelPresent = true
                    //DataHolder.shared.RemovePart(economyItem: modelData)
                    isClicked = false
                    
                    for item in currentNodePoint.childNodes
                    {
                        item.removeFromParentNode()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                    {
                        ApiEvents.shared.HideLoading()
                        self.OnQueueNetworkModel();
                    }
                }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
        {
            if(!isSameModelPresent)
            {
                let conflict = try? JSONDecoder().decode([Conflict].self, from: modelData.conflictingBuckets.data(using: .utf8)!)
                for vertP in self.facevertexlist
                {
                    for conf in conflict!
                    {
                        if(vertP.Point.name?.lowercased() == conf.name.lowercased())
                        {
                            if(vertP.Point.childNodes.count > 0)
                            {
                                for child in vertP.Point.childNodes
                                {
                                    child.removeFromParentNode()
                                }
                            }
                        }
                    }
                }
                if(currentNodePoint != nil)
                {
                    if(currentNodePoint.childNodes.count > 0 )
                    {
                        for item in currentNodePoint.childNodes
                        {
                            item.removeFromParentNode()
                        }
                    }
                }
                
                if( self.hairModelNode != nil)
                {
                    self.ResetBlendshapes()
                }
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                {
                    let jsonData = modelData.artifacts.data(using: .utf8)!
                    do
                    {
                        let artifacts = try JSONDecoder().decode([ThreeDArtifact].self, from: jsonData)
                        ApiEvents.shared.ShowLoading()
                        
                        if(artifacts.count > 0)
                        {
                            let artifact = artifacts.first(where:  {$0.device == Int(GetPlatfrom().rawValue) })
                            
                            if(artifact != nil)
                            {
                                self.LoadModelData(urlstr: (artifact?.url!)!, completionHandler:
                                                    {
                                    data in
                                    ModelDecryptionHandler.shared.GetModelData(data: data, completionHandler:
                                                                                {
                                        decdata in
                                        do
                                        {
                                            let sceneSource = GLTFSceneSource(data: decdata)
                                            let scene = try sceneSource.scene()
                                            let tempnode = SCNNode()
                                            tempnode.name = bucketname + "+" + modelData.ID
                                            for meshdata  in scene.rootNode.childNodes
                                            {
                                                tempnode.addChildNode(meshdata)
                                                meshdata.position = SCNVector3(0,0,0)
                                                meshdata.eulerAngles = SCNVector3(0,0,0)
                                            }
                                            if(currentNodePoint != nil)
                                            {
                                                if(currentNodePoint.childNodes.count > 0 )
                                                {
                                                    for item in currentNodePoint.childNodes
                                                    {
                                                        item.removeFromParentNode()
                                                    }
                                                }
                                                currentNodePoint.addChildNode(tempnode)
                                                self.facewearModelNode = tempnode
                                                if( self.hairModelNode != nil)
                                                {
                                                    var blendbucket = false
                                                    
                                                    if(blendbucket == false)
                                                    {
                                                        
                                                        if(self.headwearModelNode != nil)
                                                        {
                                                            GetMorphtargetnode(_bone: self.hairModelNode, completionHandler:
                                                                                {
                                                                node in
                                                                
                                                                for i in  0..<(node.morpher?.targets.count)!
                                                                {
                                                                    if(self.HeadCoreBuck.contains((node.morpher?.targets[i].name)!))
                                                                    {
                                                                        blendbucket = true
                                                                        node.morpher?.setWeight(1.0, forTargetNamed: (node.morpher?.targets[i].name!)!)
                                                                    }
                                                                }
                                                            })
                                                        }
                                                        else
                                                        {
                                                            if(self.headwearModelNode == nil)
                                                            {
                                                                if(ProjectSettings.shared.isDebug)
                                                                {
                                                                    print("HEADWEAR IS NOT PRESENT----->>")
                                                                }
                                                                self.ResetBlendshapes()
                                                            }
                                                        }
                                                    }
                                                }
                                                tempnode.isHidden = false
                                                self.GetVertex()
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                                                {
                                                    self.OnQueueNetworkModel();
                                                }
                                            }
                                            else
                                            {
                                                self.isClicked = false;
                                                ApiEvents.shared.ShowPopupMessage(message: "CAN'T LOAD THIS ITEM")
                                                self.OnQueueNetworkModel();
                                            }
                                        }
                                        catch
                                        {
                                            self.isClicked = false;
                                            ApiEvents.shared.ShowPopupMessage(message: error.localizedDescription)
                                            self.OnQueueNetworkModel();
                                        }
                                    })
                                })
                            }
                            
                        
                        }
                       
                        
                  
                    }
                    catch
                    {
                        self.isClicked = false;
                        ApiEvents.shared.ShowPopupMessage(message: error.localizedDescription)
                        self.OnQueueNetworkModel();
                    }
                }
            }
        }
    }
    
    // This method specialy load hairs hairs are  available in both category 2d and 3d
    // With headwear ares are changing its shape to handle  it has seperate function
    func LoadHair(modelData: GetEconomyItemsResultDataInner) {
        ApiEvents.shared.ShowLoading()
        let config = try? JSONDecoder().decode(Configs.self, from: modelData.config.data(using: .utf8)!)
        var bucketname: String
        let buckets = modelData.coreBucket.split(separator: "/")
        bucketname = String(buckets[0])
        var isSameModelPresent: Bool = false
        var currentNodePoint: SCNNode!
        if buckets.count > 1 {
            bucketname = String(buckets[1])
        } else {
            bucketname = String(buckets[0])
        }
        let verteslist: [SCNVector3] = headGeometryModel.GetVertices()!
        for verts in facevertexlist {
            verts.Point.worldPosition = verteslist[verts.VertexNo]
        }
        for vertP in facevertexlist {
            if vertP.Point.name == bucketname {
                currentNodePoint = vertP.Point
                break
            }
        }

        if currentNodePoint.childNodes.count > 0 {
            let nodename = currentNodePoint.childNodes[0].name!
            if nodename.contains(modelData.ID) {
                isSameModelPresent = true
                //   DataHolder.shared.RemovePart(economyItem: modelData)
                isClicked = false
                for item in currentNodePoint.childNodes {
                    item.removeFromParentNode()
                }
                if hairModelNode != nil {
                    hairModelNode.isHidden = false
                }
                HeadMaterial.shared.RemoveHeadHairTex()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    ApiEvents.shared.HideLoading()
                    self.OnQueueNetworkModel()
                }
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if isSameModelPresent {
                if self.headwearModelNode == nil {
                    self.HeadCoreBuck = ""
                    self.ResetBlendshapes()
                }
                //DataHolder.shared.RemovePart(economyItem: modelData)
            }
            if !isSameModelPresent {
                let conflict = try? JSONDecoder().decode(
                    [Conflict].self, from: modelData.conflictingBuckets.data(using: .utf8)!)
                for vertP in self.facevertexlist {
                    for conf in conflict! {
                        if vertP.Point.name?.lowercased() == conf.name.lowercased() {
                            if vertP.Point.childNodes.count > 0 {
                                for child in vertP.Point.childNodes {
                                    child.removeFromParentNode()
                                }
                            }
                        }
                    }
                }
                if currentNodePoint.childNodes.count > 0 {
                    for item in currentNodePoint.childNodes {
                        item.removeFromParentNode()
                    }
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if config?.isTwoD == 1 {
                        let tempnode = SCNNode()
                        tempnode.name = bucketname + "+" + modelData.ID
                        if currentNodePoint.childNodes.count > 0 {
                            for item in currentNodePoint.childNodes {
                                item.removeFromParentNode()
                            }
                        }
                        currentNodePoint.addChildNode(tempnode)
                        tempnode.isHidden = true
                        let imgsrc =
                            "https://avataryug.b-cdn.net/files/diffuse/" + modelData.templateID + ".png"
                        guard let url = URL(string: imgsrc) else { return }
                        //ApiEvents.shared.ShowLoading()
                        let task = URLSession.shared.dataTask(with: url) {
                            (data, Urlresponse, error) in
                            HeadMaterial.shared.SetHeadHairTex(texture: UIImage(data: data!)!)
                            // DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                ApiEvents.shared.HideLoading()
                                self.OnQueueNetworkModel()
                            }
                        }
                        task.resume()
                    } else {
                        let jsonData = modelData.artifacts.data(using: .utf8)!
                        do {
                            let artifacts = try JSONDecoder().decode(
                                [ThreeDArtifact].self, from: jsonData)
                            //ApiEvents.shared.ShowLoading()
                            if(artifacts.count > 0)
                            {
                                let artifact = artifacts.first(where:  {$0.device == Int(GetPlatfrom().rawValue) })
                                
                                if(artifact != nil)
                                {
                                    self.LoadModelData(urlstr: (artifact?.url!)!,completionHandler: {
                                            data in
                                            ModelDecryptionHandler.shared.GetModelData(
                                                data: data,
                                                completionHandler: {
                                                    decdata in
                                                    do {
                                                        let sceneSource = GLTFSceneSource(data: decdata)
                                                        let scene = try sceneSource.scene()
                                                        let tempnode = SCNNode()
                                                        tempnode.name = bucketname + "+" + modelData.ID
                                                        for meshdata in scene.rootNode.childNodes {
                                                            tempnode.addChildNode(meshdata)
                                                            meshdata.position = SCNVector3(0, 0, 0)
                                                            meshdata.eulerAngles = SCNVector3(0, 0, 0)
                                                        }
                                                        if currentNodePoint.childNodes.count > 0 {
                                                            for item in currentNodePoint.childNodes {
                                                                item.removeFromParentNode()
                                                            }
                                                        }
                                                        currentNodePoint.addChildNode(tempnode)
                                                        //   DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)

                                                        HeadMaterial.shared.RemoveHeadHairTex()
                                                        GetMeshNode(
                                                            _bone: tempnode,
                                                            completionHandler: {
                                                                node in
                                                                node.geometry?.firstMaterial =
                                                                    HairMaterial.shared.hairMaterial
                                                                //     HairMaterial.shared.SethairColor(_color: UIColor(hex:   CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.HairColor)!)
                                                            })
                                                        tempnode.isHidden = false
                                                        if self.headwearModelNode != nil {
                                                            if(ProjectSettings.shared.isDebug)
                                                            {
                                                                print("THE Head Wear BUCKET---", self.HeadCoreBuck)
                                                            }
                                                            GetMorphtargetnode(
                                                                _bone: tempnode,
                                                                completionHandler: {
                                                                    node in
                                                                    if (node.morpher?.targets.count)! > 0 {
                                                                        self.hairModelNode = tempnode
                                                                    }
                                                                    for i in 0..<(node.morpher?.targets.count)!
                                                                    {
                                                                        if self.HeadCoreBuck.contains(
                                                                            (node.morpher?.targets[i].name)!)
                                                                        {
                                                                            node.morpher?.setWeight(
                                                                                1.0,
                                                                                forTargetNamed: (node.morpher?
                                                                                    .targets[i].name!)!)
                                                                        }
                                                                    }

                                                                })
                                                        } else {
                                                            GetMorphtargetnode(
                                                                _bone: tempnode,
                                                                completionHandler: {
                                                                    node in
                                                                    if (node.morpher?.targets.count)! > 0 {
                                                                        self.hairModelNode = tempnode
                                                                    }
                                                                    for i in 0..<(node.morpher?.targets.count)!
                                                                    {
                                                                        if self.HeadCoreBuck.contains(
                                                                            (node.morpher?.targets[i].name)!)
                                                                        {
                                                                            node.morpher?.setWeight(
                                                                                1.0,
                                                                                forTargetNamed: (node.morpher?
                                                                                    .targets[i].name!)!)
                                                                        }
                                                                    }
                                                                })
                                                        }
                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                            ApiEvents.shared.HideLoading()
                                                            self.OnQueueNetworkModel()
                                                        }
                                                    } catch {
                                                        self.isClicked = false
                                                        ApiEvents.shared.HideLoading()
                                                        ApiEvents.shared.ShowPopupMessage(
                                                            message: error.localizedDescription)
                                                    }
                                                })
                                        })
                                    
                                }
                            }
                            
                            
                         
                        } catch {
                            if(ProjectSettings.shared.isDebug)
                            {
                                print(error)
                            }
                            self.isClicked = false
                            ApiEvents.shared.HideLoading()
                            ApiEvents.shared.ShowPopupMessage(message: error.localizedDescription)
                        }
                    }
                }
            }
        }
    }

    
    //This method load facial hair model
    func LoadFacialHair(modelData : GetEconomyItemsResultDataInner)
    {
        ApiEvents.shared.ShowLoading()
        let config = try? JSONDecoder().decode(Configs.self, from: modelData.config.data(using: .utf8)!)
        var bucketname : String;
        let buckets = modelData.coreBucket.split(separator: "/");
        bucketname = String(buckets[0])
        var isSameModelPresent : Bool = false;
        var currentNodePoint : SCNNode!
        if(buckets.count>1)
        {
            bucketname = String(buckets[1])
        }
        else
        {
            bucketname = String(buckets[0])
        }
        let verteslist : [SCNVector3] = headGeometryModel.GetVertices()!
        for verts in facevertexlist
        {
            verts.Point.worldPosition = verteslist[verts.VertexNo]
        }
        for vertP in facevertexlist
        {
            if( vertP.Point.name == bucketname)
            {
                currentNodePoint = vertP.Point
                break;
            }
        }
        
        if(currentNodePoint.childNodes.count > 0)
        {
            let nodename = currentNodePoint.childNodes[0].name!
            if(nodename.contains(modelData.ID))
            {
                isSameModelPresent = true
                // DataHolder.shared.RemovePart(economyItem: modelData)
                isClicked = false
                for item in currentNodePoint.childNodes
                {
                    item.removeFromParentNode()
                }
                HeadMaterial.shared.RemoveBeardTex()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                {
                    ApiEvents.shared.HideLoading()
                    self.OnQueueNetworkModel();
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
        {
            if(!isSameModelPresent)
            {
                let conflict = try? JSONDecoder().decode([Conflict].self, from: modelData.conflictingBuckets.data(using: .utf8)!)
                for vertP in self.facevertexlist
                {
                    for conf in conflict!
                    {
                        if(vertP.Point.name?.lowercased() == conf.name.lowercased())
                        {
                            if(vertP.Point.childNodes.count > 0)
                            {
                                for child in vertP.Point.childNodes
                                {
                                    child.removeFromParentNode()
                                }
                            }
                        }
                    }
                }
                if(currentNodePoint.childNodes.count > 0 )
                {
                    for item in currentNodePoint.childNodes
                    {
                        item.removeFromParentNode()
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                {
                    if(config?.isTwoD == 1)
                    {
                        let tempnode = SCNNode()
                        tempnode.name = bucketname + "+" + modelData.ID
                        if(currentNodePoint.childNodes.count > 0 )
                        {
                            for item in currentNodePoint.childNodes
                            {
                                item.removeFromParentNode()
                            }
                        }
                        currentNodePoint.addChildNode(tempnode)
                        tempnode.isHidden = true
                        let imgsrc =  "https://avataryug.b-cdn.net/files/diffuse/" + modelData.templateID + ".png"
                        guard let url = URL(string: imgsrc) else {  return  }
                        ApiEvents.shared.ShowLoading()
                        let task = URLSession.shared.dataTask(with: url)
                        {
                            (data,Urlresponse ,error) in
                            //  DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                            HeadMaterial.shared.SetBeardTex(texture: UIImage(data: data! )!)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                            {
                                ApiEvents.shared.HideLoading()
                                self.OnQueueNetworkModel();
                            }
                        }
                        task.resume()
                    }
                    else
                    {
                        let jsonData = modelData.artifacts.data(using: .utf8)!
                        do
                        {
                            let artifacts = try JSONDecoder().decode([ThreeDArtifact].self, from: jsonData)
                            ApiEvents.shared.ShowLoading()
                            if(artifacts.count > 0){
                                let artifact = artifacts.first(where:  {$0.device == Int(GetPlatfrom().rawValue) })
                                if(artifact != nil)
                                {
                                    self.LoadModelData(urlstr: (artifact?.url!)!, completionHandler:
                                                        {
                                        data in
                                        ModelDecryptionHandler.shared.GetModelData(data: data, completionHandler:
                                                                                    {
                                            decdata in
                                            do
                                            {
                                                let sceneSource = GLTFSceneSource(data: decdata)
                                                let scene = try sceneSource.scene()
                                                let tempnode = SCNNode()
                                                
                                                tempnode.name = bucketname + "+" + modelData.ID
                                                for meshdata  in scene.rootNode.childNodes
                                                {
                                                    
                                                    tempnode.addChildNode(meshdata)
                                                    meshdata.position = SCNVector3(0,0,0)
                                                    meshdata.eulerAngles = SCNVector3(0,0,0)
                                                }
                                                if(currentNodePoint.childNodes.count > 0 )
                                                {
                                                    for item in currentNodePoint.childNodes
                                                    {
                                                        item.removeFromParentNode()
                                                    }
                                                }
                                                
                                                currentNodePoint.addChildNode(tempnode)
                                                self.SelectFacialHairMorpher(_bone: tempnode)
                                                // DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                                HeadMaterial.shared.RemoveBeardTex()
                                                GetMeshNode(_bone:tempnode, completionHandler:
                                                                {
                                                    node in
                                                    node.geometry?.firstMaterial = FacialhairMaterial.shared.facialhairMaterial
                                                    //                                        FacialhairMaterial.shared.SetFacialhairColor(_color: UIColor(hex: CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.FacialHairColor)! )
                                                    
                                                })
                                                tempnode.isHidden = false
                                                
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                                                {
                                                    ApiEvents.shared.HideLoading()
                                                    if(ProjectSettings.shared.isDebug)
                                                    {
                                                        print("======",currentNodePoint.childNodes.count)
                                                    }
                                                    self.OnQueueNetworkModel();
                                                }
                                            }
                                            catch
                                            {
                                                self.isClicked = false;
                                                if(ProjectSettings.shared.isDebug)
                                                {
                                                    print("Checkinggg--Error-->>")
                                                    print("\(error.localizedDescription)")
                                                }
                                                ApiEvents.shared.HideLoading()
                                                ApiEvents.shared.ShowPopupMessage(message: error.localizedDescription)
                                            }
                                        })
                                    })
                                }
                            }
                            
                    
                        }
                        catch
                        {
                            if(ProjectSettings.shared.isDebug)
                            {
                                print(error)
                            }
                            self.isClicked = false;
                            ApiEvents.shared.HideLoading()
                            ApiEvents.shared.ShowPopupMessage(message: error.localizedDescription)
                        }
                    }
                }
            }
        }
    }
    
    // This function download eyeball,lip,eyebrow ,and skintone texture
    func LoadFaceWearCategory2D(modelData: GetEconomyItemsResultDataInner) {
        if modelData.itemCategory == Category.Eyeball.rawValue {
            ApiEvents.shared.ShowLoading()
            var addnew: Bool = true
            if currentEyeballData != nil {
                if currentEyeballData.ID == modelData.ID {
                    //DataHolder.shared.RemovePart(economyItem: modelData)
                    addnew = false
                    isClicked = false
                    currentEyeballData = EmptyEconomy()
                    EyeballMaterial.shared.RemoveEyeballTex()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        ApiEvents.shared.HideLoading()
                    }
                }
            }
            if addnew {
                currentEyeballData = modelData
                let jsonData = modelData.artifacts.data(using: .utf8)!
                do {
                    let artifacts = try JSONDecoder().decode([TwoDArtifact].self, from: jsonData)
                    if artifacts.count > 0 {
                        guard let url = URL(string: artifacts[0].link!) else { return }
                        let getDataTask = URLSession.shared.dataTask(
                            with: url,
                            completionHandler: {
                                data, _, error in
                                guard let data = data, error == nil else { return }
                                //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                EyeballMaterial.shared.SetEyeballTex(texture: UIImage(data: data)!)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    ApiEvents.shared.HideLoading()
                                    self.isClicked = false
                                    self.OnQueueNetworkModel()
                                }
                            })
                        getDataTask.resume()
                    } else {
                        self.isClicked = false
                        ApiEvents.shared.HideLoading()
                        ApiEvents.shared.ShowPopupMessage(message: "CAN'T LOAD THIS ITEM")
                    }
                } catch {
                    self.isClicked = false
                    ApiEvents.shared.HideLoading()
                    ApiEvents.shared.ShowPopupMessage(message: "CAN'T LOAD THIS ITEM")
                }
            }
        }

        if modelData.itemCategory == Category.Lips.rawValue {
            ApiEvents.shared.ShowLoading()
            var addnew: Bool = true
            if currentLipsData != nil {
                if currentLipsData.ID == modelData.ID {
                    //DataHolder.shared.RemovePart(economyItem:  modelData)
                    addnew = false
                    isClicked = false
                    HeadMaterial.shared.RemoveLipTex()
                    currentLipsData = EmptyEconomy()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        ApiEvents.shared.HideLoading()
                    }
                }
            }
            if addnew {
                currentLipsData = modelData
                let jsonData = modelData.artifacts.data(using: .utf8)!
                do {
                    let artifacts = try JSONDecoder().decode([TwoDArtifact].self, from: jsonData)
                    if artifacts.count > 0 {
                        guard let url = URL(string: artifacts[0].link!) else {
                            return
                        }

                        let getDataTask = URLSession.shared.dataTask(
                            with: url,
                            completionHandler: { data, _, error in
                                guard let data = data, error == nil else {
                                    return
                                }
                                HeadMaterial.shared.SetLipTex(texture: UIImage(data: data)!)
                                //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    self.OnQueueNetworkModel()
                                }
                            })
                        getDataTask.resume()
                    } else {
                        isClicked = false
                        ApiEvents.shared.HideLoading()
                        ApiEvents.shared.ShowPopupMessage(message: "CAN'T LOAD THIS ITEM")
                    }
                } catch {
                    isClicked = false
                    ApiEvents.shared.HideLoading()
                    ApiEvents.shared.ShowPopupMessage(message: "CAN'T LOAD THIS ITEM")
                }
            }
        }

        if modelData.itemCategory == Category.Eyebrow.rawValue {
            ApiEvents.shared.ShowLoading()
            var addnew: Bool = true
            if currentEyebrowData != nil {
                if currentEyebrowData.ID == modelData.ID {
                    //DataHolder.shared.RemovePart(economyItem:  modelData)
                    addnew = false
                    isClicked = false
                    HeadMaterial.shared.RemoveEyebrowTex()
                    currentEyebrowData = EmptyEconomy()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        ApiEvents.shared.HideLoading()
                    }
                }
            }
            if addnew {
                currentEyebrowData = modelData
                let jsonData = modelData.artifacts.data(using: .utf8)!
                do {
                    let artifacts = try JSONDecoder().decode([TwoDArtifact].self, from: jsonData)
                    if artifacts.count > 0 {
                        guard let url = URL(string: artifacts[0].link!) else {
                            return
                        }

                        let getDataTask = URLSession.shared.dataTask(
                            with: url,
                            completionHandler: { data, _, error in
                                guard let data = data, error == nil else {
                                    return
                                }
                                HeadMaterial.shared.SetEyebrowTex(texture: UIImage(data: data)!)
                                //    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    ApiEvents.shared.HideLoading()
                                    self.OnQueueNetworkModel()
                                }
                            })
                        getDataTask.resume()
                    } else {
                        isClicked = false
                        ApiEvents.shared.HideLoading()
                        ApiEvents.shared.ShowPopupMessage(message: "CAN'T LOAD THIS ITEM")
                    }
                } catch {
                    isClicked = false
                    ApiEvents.shared.HideLoading()
                    ApiEvents.shared.ShowPopupMessage(message: "CAN'T LOAD THIS ITEM")
                }

            }
        }
        if modelData.itemCategory == Category.SkinTone.rawValue {
            ApiEvents.shared.ShowLoading()
            var addnew: Bool = true
            if currentSkinToneData != nil {
                if currentSkinToneData.ID == modelData.ID {
                    // DataHolder.shared.RemovePart(economyItem: modelData)
                    addnew = false
                    isClicked = false
                    HeadMaterial.shared.RemoveSkinTonetexture()
                    BodyMaterial.shared.RemoveSkinTonetexture()
                    currentSkinToneData = EmptyEconomy()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        ApiEvents.shared.HideLoading()
                    }
                }
            }
            if addnew {

                currentSkinToneData = modelData
                if !currentSkinToneData.artifacts.isEmpty {
                    let jsonData = modelData.artifacts.data(using: .utf8)!
                    do {
                        var artifacts: [SkinToneArtifact] = []
                        artifacts = try JSONDecoder().decode([SkinToneArtifact].self, from: jsonData)
                        if(ProjectSettings.shared.isDebug)
                        {
                            print(artifacts)
                        }
                        if artifacts.count > 0 {
                            guard let url = URL(string: artifacts[0].face_path!) else {
                                return
                            }

                            let getDataTask = URLSession.shared.dataTask(
                                with: url,
                                completionHandler: { data, _, error in
                                    guard let data = data, error == nil else {
                                        return
                                    }
                                    HeadMaterial.shared.SetSkinTonetexture(
                                        skinTex: UIImage(data: data)!)

                                    guard let url2 = URL(string: artifacts[0].body_path!) else {
                                        return
                                    }
                                    let getDataTask2 = URLSession.shared.dataTask(
                                        with: url2,
                                        completionHandler: { data, _, error in
                                            guard let data = data, error == nil else {
                                                return
                                            }
                                            BodyMaterial.shared.SetSkinTonetexture(
                                                skinTex: UIImage(data: data)!)
                                            //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                ApiEvents.shared.HideLoading()
                                                self.OnQueueNetworkModel()
                                            }
                                        })
                                    getDataTask2.resume()
                                })
                            getDataTask.resume()
                        } else {
                            isClicked = false
                            ApiEvents.shared.ShowPopupMessage(message: "CAN'T LOAD THIS ITEM")
                            self.OnQueueNetworkModel()
                        }
                    } catch {
                        isClicked = false
                        ApiEvents.shared.ShowPopupMessage(message: "CAN'T LOAD THIS ITEM")
                        self.OnQueueNetworkModel()
                    }
                } else {
                    isClicked = false
                    ApiEvents.shared.ShowPopupMessage(message: "CAN'T LOAD THIS ITEM")
                    self.OnQueueNetworkModel()
                }
            }
        }
    }

    
    //This method load blendshape data from network and change face blendhsape to get diffrent look of face
    func LoadBlendshape(modelData: GetEconomyItemsResultDataInner) {
        var addNew = false
        if modelData.itemCategory == Category.FaceShape.rawValue {
            ResetPerticaulerBlendshape(names: "Face_")
            if currentFaceShapeData != nil {
                if currentFaceShapeData.ID == modelData.ID {
                    //DataHolder.shared.RemovePart(economyItem: modelData)
                    addNew = false
                } else {
                    //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    currentFaceShapeData = modelData
                    addNew = true
                }
            } else {
                //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                currentFaceShapeData = modelData
                addNew = true
            }
        }

        if modelData.itemCategory == Category.EyeShape.rawValue {
            ResetPerticaulerBlendshape(names: "Eyeshape_")
            if currentEyeShapeData != nil {
                if currentEyeShapeData.ID == modelData.ID {
                    //DataHolder.shared.RemovePart(economyItem: modelData)
                    addNew = false
                } else {
                    //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    currentEyeShapeData = modelData
                    addNew = true
                }
            } else {
                //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                currentEyeShapeData = modelData
                addNew = true
            }
        }

        if modelData.itemCategory == Category.EyebrowShape.rawValue {
            ResetPerticaulerBlendshape(names: "Eyebrows_")
            if currentEyebrowshapeData != nil {
                if currentEyebrowshapeData.ID == modelData.ID {
                    //DataHolder.shared.RemovePart(economyItem: modelData)
                    addNew = false
                } else {
                    //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    currentEyebrowshapeData = modelData
                    addNew = true
                }
            } else {
                //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                currentEyebrowshapeData = modelData
                addNew = true
            }
        }

        if modelData.itemCategory == Category.NoseShape.rawValue {
            ResetPerticaulerBlendshape(names: "Nose_")
            if currentNoseShapeData != nil {
                if currentNoseShapeData.ID == modelData.ID {
                    //DataHolder.shared.RemovePart(economyItem: modelData)
                    addNew = false
                } else {
                    //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    currentNoseShapeData = modelData
                    addNew = true
                }
            } else {
                //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                currentNoseShapeData = modelData
                addNew = true
            }
        }

        if modelData.itemCategory == Category.LipShape.rawValue {
            ResetPerticaulerBlendshape(names: "Lips_")
            if currentLipShapeData != nil {
                if currentLipShapeData.ID == modelData.ID {
                    //DataHolder.shared.RemovePart(economyItem: modelData)
                    addNew = false
                } else {
                    //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    currentLipShapeData = modelData
                    addNew = true
                }
            } else {
                //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                currentLipShapeData = modelData
                addNew = true
            }
        }

        if modelData.itemCategory == Category.EarShape.rawValue {
            ResetPerticaulerBlendshape(names: "Ears_")
            if currentEarshapeData != nil {
                if currentEarshapeData.ID == modelData.ID {
                    //DataHolder.shared.RemovePart(economyItem: modelData)
                    addNew = false
                } else {
                    //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    currentEarshapeData = modelData
                    addNew = true
                }
            } else {
                //DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                currentEarshapeData = modelData
                addNew = true
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.GetVertex()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                if addNew {
                    do {
                        let jsonData = modelData.blendshapeKeys.data(using: .utf8)!
                        let keyswithvalue = try JSONDecoder().decode([BlendShape].self, from: jsonData)
                        for keys in keyswithvalue {
                            let floatvalue = Float(keys.value)
                            self.SetBlenshape(names: keys.shapekeys, value: floatvalue)
                        }
                        self.GetVertex()
                    } catch {

                    }
                }
                self.OnQueueNetworkModel()
            }
        }
    }

    
    //This method is responsible for checking the type of model that was removed and identifying which models are missing to complete the avatar.
    func CheckMissingAfterModelLoad(modelData: GetEconomyItemsResultDataInner) {
        var loadTop: Bool = false
        var loadBottom: Bool = false
        var loadFootwear: Bool = false
        var loadHandwear: Bool = false

        if modelData.itemCategory == Category.Top.rawValue {
            var isbottomPresent: Bool = false
            var isFootwearPresent: Bool = false
            for item in bodyPoints {
                if !isbottomPresent
                    && (item.name == "lowerbody_without_foot" || item.name == "lowerbody_till_knee")
                {
                    isbottomPresent = item.childNodes.count > 0
                }
                if !isFootwearPresent && (item.name == "lowerbody_foot_both") {
                    isFootwearPresent = item.childNodes.count > 0
                }
            }
            loadBottom = !isbottomPresent
            loadFootwear = !isFootwearPresent
        }

        if modelData.itemCategory == Category.Bottom.rawValue {
            var isTOpPresent: Bool = false
            var isFootwearPresent: Bool = false
            for item in bodyPoints {
                if !isTOpPresent
                    && (item.name == "upperbody_sleeve_short" || item.name == "upperbody_sleeve_full"
                        || item.name == "upperbody_sleeveless")
                {
                    isTOpPresent = item.childNodes.count > 0
                }
                if !isFootwearPresent && (item.name == "lowerbody_foot_both") {
                    isFootwearPresent = item.childNodes.count > 0
                }
            }
            loadTop = !isTOpPresent
            loadFootwear = !isFootwearPresent
        }

        if modelData.itemCategory == Category.Outfit.rawValue {
            var isFootwearPresent: Bool = false
            var isHandPResent: Bool = false
            for item in bodyPoints {
                if !isFootwearPresent && (item.name == "lowerbody_foot_both") {
                    isFootwearPresent = item.childNodes.count > 0
                }
                if !isHandPResent && (item.name == "upperbody_hand_both") {
                    isHandPResent = item.childNodes.count > 0
                }
            }
            loadFootwear = !isFootwearPresent
            loadHandwear = !isHandPResent
        }

        if modelData.itemCategory == Category.Footwear.rawValue {
            var isTOpPresent: Bool = false
            var isBottomPresent: Bool = false
            var isOutfitpresnet: Bool = false
            for item in bodyPoints {
                if !isTOpPresent
                    && (item.name == "upperbody_sleeve_short" || item.name == "upperbody_sleeve_full"
                        || item.name == "upperbody_sleeveless")
                {
                    isTOpPresent = item.childNodes.count > 0
                }
                if !isBottomPresent
                    && (item.name == "lowerbody_without_foot" || item.name == "lowerbody_till_knee")
                {
                    isBottomPresent = item.childNodes.count > 0
                }
                if !isOutfitpresnet
                    && (item.name == "fullbody_without_head" || item.name == "fullbody_with_head_foot"
                        || item.name == "fullbody_without_head_foot")
                {
                    isOutfitpresnet = item.childNodes.count > 0
                }
            }
            if !isOutfitpresnet {
                loadTop = !isTOpPresent
                loadBottom = !isBottomPresent
            }
        }

        var gender = "1"
        if GetGender() == .Male {
            gender = "1"
        } else if GetGender() == .Female {
            gender = "2"
        }
        if loadTop {
            defaultModelList.append(DefaultAvatarData.shared.GetDefaultModelList(gender: gender)[0])
            OnQueueDefaultModel()
        }
        if loadBottom {
            defaultModelList.append(DefaultAvatarData.shared.GetDefaultModelList(gender: gender)[1])
            OnQueueDefaultModel()
        }
        if loadFootwear {
            defaultModelList.append(DefaultAvatarData.shared.GetDefaultModelList(gender: gender)[2])
            OnQueueDefaultModel()
        }
        if loadHandwear {
            defaultModelList.append(DefaultAvatarData.shared.GetDefaultModelList(gender: gender)[3])
            OnQueueDefaultModel()
        }
    }

    
    
    //This method is responsible for checking the type of model that was removed and identifying which models are missing to complete the avatar.
    func CheckMissingModelAfterRemovingSameModel(modelData: GetEconomyItemsResultDataInner) {
        var loadTop: Bool = false
        var loadBottom: Bool = false
        var loadFootwear: Bool = false
        var loadHandwear: Bool = false

        if modelData.itemCategory == Category.Top.rawValue {
            var istopPresent: Bool = false
            var isbottomPresent: Bool = false
            var isFootwearPresent: Bool = false
            for item in bodyPoints {
                if !istopPresent
                    && (item.name == "upperbody_sleeve_short" || item.name == "upperbody_sleeve_full"
                        || item.name == "upperbody_sleeveless")
                {
                    istopPresent = item.childNodes.count > 0
                }
                if !isbottomPresent
                    && (item.name == "lowerbody_without_foot" || item.name == "lowerbody_till_knee")
                {
                    isbottomPresent = item.childNodes.count > 0
                }
                if !isFootwearPresent && (item.name == "lowerbody_foot_both") {
                    isFootwearPresent = item.childNodes.count > 0
                }
            }
            loadTop = !istopPresent
            loadBottom = !isbottomPresent
            loadFootwear = !isFootwearPresent
        }

        if modelData.itemCategory == Category.Bottom.rawValue {
            var isBottomPresent: Bool = false
            var isTOpPresent: Bool = false
            var isFootwearPresent: Bool = false
            for item in bodyPoints {
                if !isBottomPresent
                    && (item.name == "lowerbody_without_foot" || item.name == "lowerbody_till_knee")
                {
                    isBottomPresent = item.childNodes.count > 0
                }
                if !isTOpPresent
                    && (item.name == "upperbody_sleeve_short" || item.name == "upperbody_sleeve_full"
                        || item.name == "upperbody_sleeveless")
                {
                    isTOpPresent = item.childNodes.count > 0
                }
                if !isFootwearPresent && item.name == "lowerbody_foot_both" {
                    isFootwearPresent = item.childNodes.count > 0
                }
            }
            loadBottom = !isBottomPresent
            loadTop = !isTOpPresent
            loadFootwear = !isFootwearPresent
        }

        if modelData.itemCategory == Category.Outfit.rawValue{
            var isFootwearPresent: Bool = false
            var isTOpPresent: Bool = false
            var isBottomPresent: Bool = false
            var isHandPResent: Bool = false
            for item in bodyPoints {
                if !isBottomPresent
                    && (item.name == "lowerbody_without_foot" || item.name == "lowerbody_till_knee")
                {
                    isBottomPresent = item.childNodes.count > 0
                }
                if !isTOpPresent
                    && (item.name == "upperbody_sleeve_short" || item.name == "upperbody_sleeve_full"
                        || item.name == "upperbody_sleeveless")
                {
                    isTOpPresent = item.childNodes.count > 0
                }
                if !isFootwearPresent && (item.name == "lowerbody_foot_both") {
                    isFootwearPresent = item.childNodes.count > 0
                }
                if !isHandPResent && (item.name == "upperbody_hand_both") {
                    isHandPResent = item.childNodes.count > 0
                }
            }

            loadTop = !isTOpPresent
            loadBottom = !isBottomPresent
            loadFootwear = !isFootwearPresent
            loadHandwear = !isHandPResent
        }

        if modelData.itemCategory == Category.Footwear.rawValue {
            var isFootwearPresent: Bool = false
            for item in bodyPoints {
                if !isFootwearPresent && item.name == "lowerbody_foot_both" {
                    isFootwearPresent = item.childNodes.count > 0
                }
            }
            loadFootwear = !isFootwearPresent
        }

        if modelData.itemCategory == Category.Handwear.rawValue {
            var isHandPResent: Bool = false
            for item in bodyPoints {
                if !isHandPResent && item.name == "upperbody_hand_both" {
                    isHandPResent = item.childNodes.count > 0
                }
            }
            loadHandwear = !isHandPResent
        }

        var gender = "1"
        if GetGender() == .Male {
            gender = "1"
        } else if GetGender() == .Female {
            gender = "2"
        }
        if loadTop {
            defaultModelList.append(DefaultAvatarData.shared.GetDefaultModelList(gender: gender)[0])
            OnQueueDefaultModel()
        }
        if loadBottom {
            defaultModelList.append(DefaultAvatarData.shared.GetDefaultModelList(gender: gender)[1])
            OnQueueDefaultModel()
        }
        if loadFootwear {
            defaultModelList.append(DefaultAvatarData.shared.GetDefaultModelList(gender: gender)[2])
            OnQueueDefaultModel()
        }
        if loadHandwear {
            defaultModelList.append(DefaultAvatarData.shared.GetDefaultModelList(gender: gender)[3])
            OnQueueDefaultModel()
        }
    }

    
    //This method clears all data when logout
    public func Logout() {
        //DataHolder.shared.currentSelectedBodyParts = []
        //DataHolder.shared.itemsTobuy  = []
        clipBones = []
        headGeometryModel = nil
        innermouthmorpherModel = nil
        headmorpherModel = nil
        VertexList = []
        EyeballMaterial.shared.RemoveEyeballTex()
        BodyMaterial.shared.RemoveBodyColor()
        BodyMaterial.shared.clearTattooTexture()
        HeadMaterial.shared.RemoveBodyColor()
        HeadMaterial.shared.RemoveTattooTexture()
        HeadMaterial.shared.RemoveHeadHairTex()
        HeadMaterial.shared.RemoveHairColor()
        HeadMaterial.shared.RemoveBeardTex()
        HeadMaterial.shared.RemoveBreardColor()
        HeadMaterial.shared.RemoveEyebrowTex()
        HeadMaterial.shared.RemoveEyebrowColor()
        HeadMaterial.shared.RemoveLipTex()
        HeadMaterial.shared.RemoveLipColor()
        boneAnimationList = []
        modelBone = []
        ModelParentNode.removeFromParentNode()
        defaultModelList = []
        HeadCoreBuck = ""
        lastLoadedTattoos = []
        networkModelQueueList = []
        facevertexlist = []
        firstTime = false
        bodyPoints = []
        hairModelNode = nil
        headwearModelNode = nil
        CustomizeModelParent = nil
        currentWristwearData = nil
        currentEyeballData = nil
        currentLipsData = nil
        currentEyebrowData = nil
        OnBoardingModelst = []
        headNode = nil
        ModelParentNode = nil
        currentSelectedTop = nil
        currentSelectedBottom = nil
        currentSelectedOutfit = nil
        currentSelectedHandwear = nil
        currentSelectedFootwear = nil
        currentWristwearData = nil
        currentFaceShapeData = nil
        currentNoseShapeData = nil
        currentEyebrowshapeData = nil
        currentEyeShapeData = nil
        currentLipShapeData = nil
        currentEarshapeData = nil
        currentSkinToneData = nil
    }
}
