import Foundation
import SceneKit
import GLTFKit2

// The "AvatarLoaderBase" class is a base class responsible for managing the process of loading and handling avatar mesh information.
// It serves as a foundation for performing tasks like managing conflict buckets,
// loading different parts of the avatar, and handling textures and blendshapes for the face.
// This class encapsulates the core functionality related to avatar mesh processing and provides
// a framework for derived classes to extend and customize the behavior as needed.

class AvatarLoaderBase
{
    
    public init()
    {
        GLTFAsset.dracoDecompressorClassName = "DracoDecompressor"
    }
    
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
    
    var currentHairData : GetEconomyItemsResultDataInner!
    var currentFacialhairData : GetEconomyItemsResultDataInner!
    
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
    

     var boneAnimationList = [GLTFSCNAnimation]()

    var modelBone : [SCNNode] = []
    var bodyPoints : [SCNNode] = []

    var clipBones : [SCNNode] = []
    
    var VertexList : [SCNVector3] = []
    
    var HeadCoreBuck :String = ""
    
    var firstTime = false;


    
    //This method load head model from network
    //Also load vertex point detail for facewear models
    func LoadHeadModelVertices(completionHandler: @escaping () -> Void) {
//      ApiEvents.shared.ShowLoading()
//      let auth = AvatarManagementHandler(
//        ApiBase: GetGetallbucketvertices(
//          platform: AvatarManagementAPI.Platform_getGetallbucketvertices.ios))
//      auth.GetGetallbucketvertices(completionHandler: {
//        (response) in
//        switch response
//        {
//        case .success(let success):
//          ApiEvents.shared.HideLoading()
        do {
            
            let vertresult  = try? JSONDecoder().decode(GetAllBucketVerticesResult.self, from: VertexPointList.shared.vertexlist.data(using: .utf8)!)
            
            self.vertexData =      (vertresult?.data)!
            if self.headNode.childNodes.count == 0 {
                self.firstTime = true
                self.LoadHeadModel(completionHandler: {
                    self.RemoveClip()
                    self.SetAnimation(_bone: self.topNodes)
                    
                    completionHandler()
                })
            }
        }
//        case .failure(let failure):
//          ApiEvents.shared.HideLoading()
//          ApiEvents.shared.ShowPopupMessage(message: failure.localizedDescription)
//        }
//      })
    }

    //Load head glb from local path
    public func LoadHeadModel(completionHandler: @escaping () -> Void)
    {
        guard let assetURL = Bundle.main.url(forResource: "head_generic",withExtension: "glb")
        else {
            print("Failed to find asset for URL")
            return
        }

        GLTFAsset.load(with: assetURL, options: [:]) { (progress, status, maybeAsset, maybeError, _) in
            let sceneSource =  GLTFSCNSceneSource(asset: maybeAsset!)
            let scene = sceneSource.defaultScene
            self.LoopAllMixamoNodes(_bone: scene?.rootNode, completionHandler: { nod in})
            for item in scene!.rootNode.childNodes {
                self.headNode.addChildNode(item)
            }
            self.SetHeadMaterialAndFacewearPoints(_bone: self.headNode)
            completionHandler()
        }
    }

    // This method retunr gender form user profile or return hard coded gender
    func GetGender() -> Gender {
        var gender = Gender.Male
#if AVATARYUG_DEMO
        if(UserDetailHolder.shared.userDetail.Genders  == Gender.Male)
        {
            gender = Gender.Male
        }
        else
        {
            gender = Gender.Female
        }
        #endif
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
            #if AVATARYUG_DEMO
          DataHolder.shared.RemovePart(economyItem: modelData)
            #endif
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
#if AVATARYUG_DEMO
          DataHolder.shared.RemovePart(economyItem: modelData)
            #endif
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
                let artifact = artifacts.first(where: {$0.device == Int(GetPlatfrom().rawValue) })
                if(artifact != nil)
                {
                    self.LoadModelData(urlstr: (artifact?.url!)!,  completionHandler: {
                        data in
                        ModelDecryptionHandler.shared.GetModelData(
                          data: data,
                          completionHandler: {
                            decdata in
                              
                              GLTFAsset.load(with: decdata, options: [:]) { (progress, status, maybeAsset, maybeError, _) in
                                      
                                  let sceneSource = GLTFSCNSceneSource(asset: maybeAsset!)
                                  let scene = sceneSource.defaultScene
                                  let tempnode = SCNNode()
                                  tempnode.name = bucketname + "+" + modelData.ID
                                  for meshdata in scene!.rootNode.childNodes {
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
#if AVATARYUG_DEMO
                                  DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                  #endif
                                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    ApiEvents.shared.HideLoading()
                                    self.OnQueueNetworkModel()
                                  }
                                }
                          })
                      })
                }else
                {
                    ApiEvents.shared.HideLoading()
                    ApiEvents.shared.ShowPopupMessage(message: "data not available")
                    self.OnQueueNetworkModel()
                }
           
            } catch {
   
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
 
        if firstTime {
          firstTime = false
          onCompleteLoadDefaultModel?(true)
        }
      }
    }
    
    //This method load default model glb model
    func LoadDefaultModel(defaultModel: ModelData) {
       ApiEvents.shared.ShowLoading()
        
        guard let assetURL = Bundle.main.url(forResource: defaultModel.GlbPathOffline,withExtension: "glb")
        else {
            print("Failed to find asset for URL")
            return
        }

        GLTFAsset.load(with: assetURL, options: [:]) { (progress, status, maybeAsset, maybeError, _) in
            let sceneSource = GLTFSCNSceneSource(asset: maybeAsset!)

            self.AddDefaultBodyPart(
              model: sceneSource, modelData: defaultModel,
              completionHandler: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                  ApiEvents.shared.HideLoading()
                  self.OnQueueDefaultModel()
                }
              })
        }

        
//      LoadModelData(
//        urlstr: defaultModel.GlbPath,
//        completionHandler: {
//          (data) in
//          let sceneSource = GLTFSceneSource(data: data)
//
//          self.AddDefaultBodyPart(
//            model: sceneSource, modelData: defaultModel,
//            completionHandler: {
//              DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                ApiEvents.shared.HideLoading()
//                self.OnQueueDefaultModel()
//              }
//            })
//        })
        
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
    func AddDefaultBodyPart(model:GLTFSCNSceneSource,modelData: ModelData,completionHandler: @escaping () -> Void)
    {
        var bucketname : String;
        let buckets = modelData.CoreBucket.split(separator: "/");
        bucketname = String(buckets[0])
        var isPresent : Bool = false;
        if(buckets.count>1){
            bucketname = String(buckets[1])
        }
        var bodyPoint : SCNNode!
        
       
        var allConflictNames : [Conflict] = []
        if( !modelData.ConflictingBuckets.isEmpty)
        {
            let jsonArrayData = modelData.ConflictingBuckets.data(using: .utf8)!
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
     
            }
        }
        
        RemoveBodyPoint(name: bucketname)
     
        for conflictBucket in allConflictNames
        {
            RemoveBodyPoint(name: conflictBucket.name)
        }
      
        if(bodyPoints.count > 0)
        {
            for item in bodyPoints{
                if(item.name == bucketname){
                    isPresent = true
                    bodyPoint = item
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
        
      
            let scene =  model.defaultScene
        self.LoopAllMixamoNodes(_bone: scene?.rootNode, completionHandler: { nod in})
            for item in scene!.rootNode.childNodes
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

            
            LoopAllMesh(_bone: bodyPoint, completionHandler: {
                node in
                if(node.firstMaterial?.name ==  "body" || node.firstMaterial?.name ==  "body.001")
                {
                    node.firstMaterial = BodyMaterial.shared.bodyMaterial
                }
               
                if(modelData.Gender == 0){
                    if(node.firstMaterial?.name == "upperbody_sleeveless.001" ){
                        node.firstMaterial = DefaultModelMaterial.shared.maleTopMaterial
                    }
                    if(node.firstMaterial?.name == "lowerbody_till_knee"){
                        node.firstMaterial = DefaultModelMaterial.shared.maleBottomMaterial
                    }
                    
                }else{
                    if(node.firstMaterial?.name == "upperbody_sleeveless"  || node.firstMaterial?.name == "upperbody_sleeve_short"){
                        node.firstMaterial = DefaultModelMaterial.shared.femaleTopMaterial
                    }
                    if(node.name == "lowerbody_till_knee"){
                        node.firstMaterial = DefaultModelMaterial.shared.femaleBottomMaterial
                    }
                }
            })
            completionHandler()
    }
    
    //This Method Add Animation to loaded model
    func SetAnimation(_bone: SCNNode!) {
        
        if let defaultAnimation = self.boneAnimationList.first {
            defaultAnimation.animationPlayer.animation.usesSceneTimeBase = false
            defaultAnimation.animationPlayer.animation.repeatCount = .greatestFiniteMagnitude
            if(self.topNodes != nil){
                self.topNodes.childNodes[0].addAnimationPlayer(defaultAnimation.animationPlayer, forKey: nil)
            }
            if(self.bottomNodes != nil){
                self.bottomNodes.childNodes[0].addAnimationPlayer(defaultAnimation.animationPlayer, forKey: nil)
            }
            if(self.handwearNodes != nil){
                self.handwearNodes.childNodes[0].addAnimationPlayer(defaultAnimation.animationPlayer, forKey: nil)
            }
            if(self.footwearNodes != nil){
                self.footwearNodes.childNodes[0].addAnimationPlayer(defaultAnimation.animationPlayer, forKey: nil)
            }
            if(self.outfitnodes != nil){
                self.outfitnodes.childNodes[0].addAnimationPlayer(defaultAnimation.animationPlayer, forKey: nil)
            }
            if(self.headNode != nil){
                self.headNode.childNodes[0].addAnimationPlayer(defaultAnimation.animationPlayer, forKey: nil)
            }
            defaultAnimation.animationPlayer.play()
        }

    }
    //This Method add loaded body part from network to its bucket
    func AddNetworkBodyPart(model:GLTFSCNSceneSource,modelData: GetEconomyItemsResultDataInner,closure:()->Void)
    {
       let bucketname = GetBucketName(coreBucket: modelData.coreBucket)
    
        var conflict :[Conflict] = []
        conflict = try! JSONDecoder().decode([Conflict].self, from: modelData.conflictingBuckets.data(using: .utf8)!)

        RemoveBodyPoint(name: bucketname)
        

        for conflictBucket in conflict
        {
            RemoveBodyPoint(name: conflictBucket.name)
          
        }
 
        var isPresent : Bool = false;
        var bodyPoint : SCNNode!
        if(bodyPoints.count > 0)
        {
            for item in bodyPoints{
                print(item)
                if(item.name == bucketname){
                    isPresent = true
                    bodyPoint = item
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
     
            let scene = model.defaultScene
            
            LoopAllMixamoNodes(_bone: scene?.rootNode, completionHandler: {
                tempnode in
    
            
            })
            
          
            for item in scene!.rootNode.childNodes
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

            
            LoopAllMesh(_bone: bodyPoint, completionHandler:  {
                node in
                if(node.firstMaterial?.name ==  "body")
                {
                    node.firstMaterial = BodyMaterial.shared.bodyMaterial
                }
            })
       
        closure()
   
      
        CheckMissingAfterModelLoad(modelData: modelData);
    }

    func RemoveBodyPoint(name:String){
        var index = -1
        if(bodyPoints.count > 0)
        {
            for i in 0..<(bodyPoints.count)
            {
                if(bodyPoints[i].name == name)
                {
                    index = i;
                }
            }
        }
        if(index > -1)
        {
            bodyPoints[index].removeFromParentNode()
            bodyPoints.remove(at: index)
        }
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
    
    func EyeBlinkers()
    {
        var time: Float = 0.0
        for childNode in headNode.childNodes
        {
            for layer2 in childNode.childNodes
            {
                if layer2.name == "head_generic"
                {
                    for layer3 in layer2.childNodes
                    {
                        for i in 0..<(layer3.morpher?.targets.count ?? 0)
                        {
                            // Get the blend shape target
                            let blendShapeName = layer3.morpher?.targets[i].name ?? ""
                            if blendShapeName.contains("EyeClosed")
                            {
                                
                                // Calculate the blink weight based on time
                                // This will create a smooth blink effect
                                let blinkSpeed: Float = 2 // Adjust the blink speed as desired
                                let blinkWeight = (sin(time * blinkSpeed) + 1.0) / 2.0

                                // Set the weight of the blend shape target
                                layer3.morpher?.setWeight(CGFloat(blinkWeight), forTargetAt: i)
                            }
                        }
                    }
                }
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
                                    if(facialHairMorpher != nil){
                                        facialHairMorpher.setWeight( ($0.morpher?.weight(forTargetNamed:  ($0.morpher?.targets[0].name)!))!, forTargetNamed:  ($0.morpher?.targets[0].name)!)
                                    }
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
            ApiEvents.shared.HideProgressLoading()
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
                if(_bone.name == "Head")
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
        var gender = "0"
        if(GetGender() == Gender.Male)
        {
            gender = "0"
        }
        if(GetGender() == Gender.Female)
        {
            gender = "1"
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
        var gender = "0"
        if(GetGender() == Gender.Male)
        {
            gender = "0"
        }
        if(GetGender() == Gender.Female)
        {
            gender = "1"
#if AVATARYUG_DEMO
            DataHolder.shared.defaultModelFromNetwork = true
            #endif
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
            ApiEvents.shared.ShowLoading()
            
            guard let assetURL = Bundle.main.url(forResource: defaultModelList[0].GlbPathOffline,     withExtension: "glb" )
            else {
                        print("Failed to find asset for URL")
                        return
            }
            
            GLTFAsset.load(with: assetURL, options: [:]) { (progress, status, maybeAsset, maybeError, _) in
                let sceneSource = GLTFSCNSceneSource(asset: maybeAsset!)
                self.AddDefaultBodyPart(model:sceneSource,modelData: self.defaultModelList[0],completionHandler: {
                self.defaultModelList.remove(at: 0)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        ApiEvents.shared.HideLoading()
                        self.LoadDefaultModel_start(completionHandler: completionHandler)
                    }
                })
            }
                
//            LoadModelData(urlstr:defaultModelList[0].GlbPath, completionHandler:
//                            {
//                (data) in
//                let sceneSource = GLTFSceneSource(data: data)
//                self.AddDefaultBodyPart(model:sceneSource,modelData: self.defaultModelList[0],completionHandler: {
//                    self.defaultModelList.remove(at: 0)
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                        ApiEvents.shared.HideLoading()
//                        self.LoadDefaultModel_start(completionHandler: completionHandler)
//                    }
//                })
//            })
        }
        else
        {
            completionHandler()
        }
    }
    
    //This method Set face blendshape
    //Set single blendshape value
    public  func SetBlenshape(names:String,value: Float)
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
    
    public func GetBlendshapeValue(names:String)-> Float
    {
        var value :CGFloat = 0.0
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
                            value = ($0.morpher?.weight(forTargetNamed: names))!
                        }
                    }
                }
            }
        }
        return Float(value)
    }

    
    // This method set expression on face for different look
     func SetExpression(names:String,value: Float)
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
                        layer3.morpher?.setWeight(CGFloat(value), forTargetNamed: names + "1")
                        layer3.morpher?.calculationMode = .additive
                        for layer4 in layer3.childNodes
                        {
                            layer4.morpher?.setWeight(CGFloat(value), forTargetNamed: names + "1")
                            layer4.morpher?.calculationMode = .additive
                        }
                       
//                        print(layer3)
//                        layer3.childNodes.map
//                        {
//
//                            $0.morpher?.setWeight(CGFloat(value), forTargetNamed: names + "1")
//                            $0.morpher?.calculationMode = .additive
//                        }
                    }
                }
            }
        }
    }

    //This method remove all changes and reset to default model
    func ResetToDefault()
    {
        ApiEvents.shared.ShowLoading()
#if AVATARYUG_DEMO
        DataHolder.shared.currentSelectedBodyParts = []
        DataHolder.shared.itemsTobuy  = []
        #endif
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
        BodyMaterial.shared.RemoveSkinTonetexture()
        HeadMaterial.shared.RemoveSkinTonetexture()
        FacialhairMaterial.shared.RemoveFacialhaiColor()
        HairMaterial.shared.RemovehaiColor()
#if AVATARYUG_DEMO
        CurrentSelectedAvatarDetail.shared.ChangedAvatarColor = UserDetailHolder.shared.userDetail.currentUserSelectedAvatar.avatardata.ColorMeta
        #endif
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
            ApiEvents.shared.OnItemSelectUpdate()
            ApiEvents.shared.HideLoading()
        })
    }
    
    public func LoadAllDefaultModel(OnComplete:@escaping () -> Void)
    {
        var modeldataList : [ModelData] = []
        var gender = "0"
        if(GetGender() == Gender.Male)
        {
            gender = "0"
        }
        if(GetGender() == Gender.Female)
        {
            gender = "1"
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
        guard let assetURL = Bundle.main.url(forResource: defaultModel.GlbPathOffline,withExtension: "glb")
        else {
            print("Failed to find asset for URL")
            return
        }

        GLTFAsset.load(with: assetURL, options: [:]) { (progress, status, maybeAsset, maybeError, _) in
            let sceneSource = GLTFSCNSceneSource(asset: maybeAsset!)
            self.AddDefaultBodyPart(model:sceneSource,modelData: defaultModel,completionHandler:
            {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3)
                {
                    self.OnQueueDefaultModel(OnComplete: OnComplete)
                }
            })
        }
    }
    
    //This method reset to current selected model
    func ResetToCurrentSelectedModel()
    {
#if AVATARYUG_DEMO
        DataHolder.shared.currentSelectedBodyParts = []
        DataHolder.shared.itemsTobuy  = []
        CurrentSelectedAvatarDetail.shared.ChangedAvatarColor = UserDetailHolder.shared.userDetail.currentUserSelectedAvatar.avatardata.ColorMeta
        #endif
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
        BodyMaterial.shared.RemoveSkinTonetexture()
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
        BodyMaterial.shared.RemoveSkinTonetexture()
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
#if AVATARYUG_DEMO
            let modelList = UserDetailHolder.shared.userDetail.currentUserSelectedAvatar.avatardata.BucketData
            var id : [String] = []
            for item in modelList
            {
                id.append(item.ID)
            }
                        if(id.count > 0)
                        {
                            for item in id
                            {
                                let modeldata =  EconomyItemHolder.shared.EconomyItems.first(where:  { $0.ID == item })
                                if(modeldata != nil)
                                {
                                    self.networkModelQueueList.append(modeldata!)
                                }
                            }
                        }
                        else
                        {
                            ApiEvents.shared.HideLoading()
                        }
            self.OnQueueNetworkModel()
            #endif
            
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
                                    verts.Point.worldPosition = VertexList[verts.VertexNo]
                                }
                            }
                            
                        }
                    }
                }
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
    func LoopAllMixamoNodes(_bone :SCNNode!,completionHandler: @escaping (SCNNode) -> Void)
    {
        if(!_bone.isEqual(nil))
        {
            if _bone.name != nil{
                if((_bone.name?.contains("mixamorig:")) != nil)
                {
                    _bone.name = _bone.name!.replacingOccurrences(of: "mixamorig:", with: "")
                }
                completionHandler(_bone)
            }
        }
        if(_bone.childNodes.count>0)
        {
            for i in 0..._bone.childNodes.count-1
            {
                LoopAllMixamoNodes(_bone: _bone.childNodes[i],completionHandler:completionHandler);
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
    
    private var clipAnimations = [GLTFSCNAnimation]()
    // This method add animation clip
    public func SetClips(clip : AvatarClip,completionHandler: @escaping () -> Void)
    {
        if(clip.artifacts.count>0)
        {
            ApiEvents.shared.ShowLoading()
            let artifact = clip.artifacts.first(where: { $0.device == Int(GetPlatfrom().rawValue)})
            if(artifact != nil)
            {
                LoadModelData(urlstr: (artifact?.url!)!, completionHandler:
                {
                    data in
                    GLTFAsset.load(with: data, options: [:]) { (progress, status, maybeAsset, maybeError, _) in
                        DispatchQueue.main.async {
                                       if status == .complete {
                                           let sceneSource = GLTFSCNSceneSource(asset: maybeAsset!)
                                           self.RemoveClip()
                                           self.clipAnimations = sceneSource.animations
                                           if let defaultAnimation = self.clipAnimations.first {
                                               defaultAnimation.animationPlayer.animation.usesSceneTimeBase = false
                                               defaultAnimation.animationPlayer.animation.repeatCount = .greatestFiniteMagnitude
                                               if(self.topNodes != nil){
                                                   self.topNodes.childNodes[0].addAnimationPlayer(defaultAnimation.animationPlayer, forKey: nil)
                                               }
                                               if(self.bottomNodes != nil){
                                                   self.bottomNodes.childNodes[0].addAnimationPlayer(defaultAnimation.animationPlayer, forKey: nil)
                                               }
                                               if(self.handwearNodes != nil){
                                                   self.handwearNodes.childNodes[0].addAnimationPlayer(defaultAnimation.animationPlayer, forKey: nil)
                                               }
                                               if(self.footwearNodes != nil){
                                                   self.footwearNodes.childNodes[0].addAnimationPlayer(defaultAnimation.animationPlayer, forKey: nil)
                                               }
                                               if(self.outfitnodes != nil){
                                                   self.outfitnodes.childNodes[0].addAnimationPlayer(defaultAnimation.animationPlayer, forKey: nil)
                                               }
                                               if(self.headNode != nil){
                                                   self.headNode.childNodes[0].addAnimationPlayer(defaultAnimation.animationPlayer, forKey: nil)
                                               }
                                               defaultAnimation.animationPlayer.play()
                                           }
                                           self.GetVertex()
                                       }
                                   }
                        
                        
                    }
                    completionHandler()
                })
            }
            else
            {
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    
    // This method check queue list if list is not empty then load next model
    func OnQueueNetworkModel() {
        if networkModelQueueList.count > 0 {
            let modeldta = networkModelQueueList[0]
            networkModelQueueList.remove(at: 0)
            DownloadNetworkModel(modelData: modeldta)
        } else {

            ApiEvents.shared.HideLoading()
        }
    }

    
    // This method Check Item Category based on category Call different method to load model
    private func DownloadNetworkModel(modelData: GetEconomyItemsResultDataInner)
    {
        if AvataryugData.shared.IsBodyPartCategory(category: modelData.itemCategory)!
        {
            LoadBodyPart(modelData: modelData)
        }
        else if AvataryugData.shared.IsBodywearCategory(category: modelData.itemCategory)!
        {
            LoadBodywearPart(modelData: modelData)
        }
        else if AvataryugData.shared.IsBodyTattoCategory(category: modelData.itemCategory)!
        {
            DownloadTattoos(modelData: modelData)
        }
        else if AvataryugData.shared.IsHeadFaceWearCategory3D(category: modelData.itemCategory)!
        {
            LoadHeadFaceWearCategory3D(modelData: modelData)
        }
        else if AvataryugData.shared.IsHeadFaceWearCategory2D(category: modelData.itemCategory)!
        {
            LoadFaceWearCategory2D(modelData: modelData)
        }
        else if AvataryugData.shared.IsBlendshapeCategory(category: modelData.itemCategory)!
        {
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
#if AVATARYUG_DEMO
                            DataHolder.shared.RemovePart(economyItem: modelData)
                            #endif
                            self.currentSelectedTop = nil
                            self.CheckMissingModelAfterRemovingSameModel(modelData: modelData)
                        })
                } else {
#if AVATARYUG_DEMO
                    DataHolder.shared.RemovePart(category:  Category.Outfit.rawValue)
                    #endif
                    currentSelectedTop = modelData
                    currentSelectedOutfit = nil
#if AVATARYUG_DEMO
                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    #endif
                }
            } else {
#if AVATARYUG_DEMO
                DataHolder.shared.RemovePart(category:  Category.Outfit.rawValue)
                #endif
                currentSelectedTop = modelData
                currentSelectedOutfit = nil
#if AVATARYUG_DEMO
                DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                #endif
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
#if AVATARYUG_DEMO
                            DataHolder.shared.RemovePart(economyItem: modelData)
                            #endif
                            self.currentSelectedBottom = nil
                            self.CheckMissingModelAfterRemovingSameModel(modelData: modelData)
                        })
                } else {
#if AVATARYUG_DEMO
                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    DataHolder.shared.RemovePart(category:  Category.Outfit.rawValue)
                    #endif
                    currentSelectedBottom = modelData
                    currentSelectedOutfit = nil
                }
            } else {
#if AVATARYUG_DEMO
                DataHolder.shared.RemovePart(category:  Category.Outfit.rawValue)
                #endif
                currentSelectedBottom = modelData
                currentSelectedOutfit = nil
#if AVATARYUG_DEMO
                DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                #endif
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
#if AVATARYUG_DEMO
                            DataHolder.shared.RemovePart(economyItem: modelData)
                            #endif
                            self.currentSelectedOutfit = nil
                            self.CheckMissingModelAfterRemovingSameModel(modelData: modelData)
                        })
                } else {
#if AVATARYUG_DEMO
                    DataHolder.shared.RemovePart(category:  Category.Top.rawValue)
                    DataHolder.shared.RemovePart(category:  Category.Bottom.rawValue)
                    DataHolder.shared.RemovePart(category:  Category.Outfit.rawValue)
                    #endif
                    currentSelectedOutfit = modelData
                    currentSelectedBottom = nil
                    currentSelectedTop = nil
#if AVATARYUG_DEMO
                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    #endif
                }
            } else {
#if AVATARYUG_DEMO
                DataHolder.shared.RemovePart(category:  Category.Outfit.rawValue)
                DataHolder.shared.RemovePart(category:  Category.Top.rawValue)
                DataHolder.shared.RemovePart(category:  Category.Bottom.rawValue)
                #endif
                currentSelectedOutfit = modelData
                currentSelectedBottom = nil
                currentSelectedTop = nil
#if AVATARYUG_DEMO
                DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                #endif
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
#if AVATARYUG_DEMO
                            DataHolder.shared.RemovePart(economyItem: modelData)
                            #endif
                            self.currentSelectedFootwear = nil
                            self.CheckMissingModelAfterRemovingSameModel(modelData: modelData)
                        })
                } else {
#if AVATARYUG_DEMO
                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    #endif
                    currentSelectedFootwear = modelData
                }
            } else {
#if AVATARYUG_DEMO
                DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                #endif
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
#if AVATARYUG_DEMO
                            DataHolder.shared.RemovePart(economyItem: modelData)
                            #endif
                            self.currentSelectedHandwear = nil
                            self.CheckMissingModelAfterRemovingSameModel(modelData: modelData)
                        })
                } else {
                    currentSelectedHandwear = modelData
#if AVATARYUG_DEMO
                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    #endif
                }
            } else {
                currentSelectedHandwear = modelData
#if AVATARYUG_DEMO
                DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                #endif
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
                        if(artifact?.url != nil)
                        {
                            LoadModelData( urlstr: (artifact?.url!)!, completionHandler: {(data) in
                                    ModelDecryptionHandler.shared.GetModelData(data: data, completionHandler: {decdata in
                                        GLTFAsset.load(with: decdata, options: [:]) { (progress, status, maybeAsset, maybeError, _) in
                                            if let error = maybeError {
                                                print("Failed to load glTF asset: \(error)")
                                            }
                                            else
                                            {
                                                let sceneSource = GLTFSCNSceneSource(asset: maybeAsset!)
#if AVATARYUG_DEMO
                                                DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                                #endif
                                                self.AddNetworkBodyPart(model: sceneSource, modelData: modelData, closure: {
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                                        ApiEvents.shared.HideLoading()
                                                        self.OnQueueNetworkModel()
                                                    }
                                                })
                                             }
                                        }
                                    })
                            })
                        }
                        else
                        {
                            ApiEvents.shared.ShowPopupMessage(message: "Model url not available ")
                            ApiEvents.shared.HideLoading()
                            self.OnQueueNetworkModel()
                        }
                    }
                    else
                    {
                        ApiEvents.shared.ShowPopupMessage(message: "Model data not available")
                        ApiEvents.shared.HideLoading()
                        self.OnQueueNetworkModel()
                    }
                }
                else
                {
                    ApiEvents.shared.ShowPopupMessage(message: "Model data not available")
                    ApiEvents.shared.HideLoading()
                    self.OnQueueNetworkModel()
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
#if AVATARYUG_DEMO
                        DataHolder.shared.RemovePart(economyItem: modelData)
                        #endif
                        self.currentWristwearData = nil
                    })
                }
                else
                {
                    currentWristwearData = modelData
#if AVATARYUG_DEMO
                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    #endif
                }
            }
            else
            {
                currentWristwearData = modelData
#if AVATARYUG_DEMO
                DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                #endif
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
                    let artifact = artifacts.first(where: { $0.device == Int(GetPlatfrom().rawValue)})
                    if(artifact != nil)
                    {
                        LoadModelData(urlstr: (artifact?.url!)!, completionHandler:
                                        {
                            (data) in
                            ModelDecryptionHandler.shared.GetModelData(data: data,completionHandler:
                                                                        {
                                decdata in
#if AVATARYUG_DEMO
                                DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                #endif
                                GLTFAsset.load(with: decdata, options: [:]) { (progress, status, maybeAsset, maybeError, _) in
                                    DispatchQueue.main.async {
                                        let sceneSource = GLTFSCNSceneSource(asset: maybeAsset!)
                                        self.AddNetworkBodywearPart(model: sceneSource, modelData: modelData, closure:
                                        {
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                                            {
                                                ApiEvents.shared.HideLoading()
                                                self.OnQueueNetworkModel();
                                            }
                                        })
                                    }
                                }
                            })
                        })
                    }
                    else
                    {
                        ApiEvents.shared.ShowPopupMessage(message: "Data not available")
                        self.OnQueueNetworkModel();
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
                ApiEvents.shared.ShowPopupMessage(message: "Artifacts are not available")
                self.OnQueueNetworkModel();
            }
        }
        else
        {
            self.OnQueueNetworkModel();
        }
    }
    
    // This methos set loaded model in its proper bucket
    func AddNetworkBodywearPart(model:GLTFSCNSceneSource,modelData: GetEconomyItemsResultDataInner,closure:()->Void)
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
                let bonePoint = headNode.childNode(withName:bonename , recursively: true)
                bonePoint?.addChildNode(bodyPoint)
                bodyPoint.position = pointdetail!.Position
                bodyPoint.eulerAngles = pointdetail!.Rotation
            }
         
            let scene = model.defaultScene
            for item in scene!.rootNode.childNodes
            {
                bodyPoint.addChildNode(item)
            }
            closure()
        }
        else
        {
            let scene = model.defaultScene
            for item in scene!.rootNode.childNodes
            {
                bodyPoint.addChildNode(item)
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
#if AVATARYUG_DEMO
                DataHolder.shared.RemovePart(economyItem: modelData)
                #endif
                lastLoadedTattoos.remove(at: tatooSameIDindex)
                OnProcessModelTexture(closure: {
                    OnQueueNetworkModel();
                })
            }
            else
            {
#if AVATARYUG_DEMO
                DataHolder.shared.RemovePart(economyItem: modelData)
                #endif
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
                    let artifact = artifacts.first(where: { $0.device == Int(GetPlatfrom().rawValue)})
                    if(artifact != nil)
                    {
                        guard let url = URL(string:  (artifact?.url!)! )else{
                            return
                        }
                        let getDataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
                            guard let data = data ,  error == nil else {
                                return
                            }
                            
                            if let image = UIImage(data: data) {
                                self.lastLoadedTattoos.append( LoadedTattoo(ItemCategory: modelData.itemCategory, tattooTex: data, tattooid: modelData.ID))
                                
                                self.OnProcessModelTexture(closure: {
#if AVATARYUG_DEMO
                                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                    #endif
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        ApiEvents.shared.HideLoading()
                                        self.OnQueueNetworkModel();
                                    }
                                })
                                   } else {
                                       ApiEvents.shared.ShowPopupMessage(message: "data not available")
                                       self.OnQueueNetworkModel();
                                   }
                            
                     
                        })
                        getDataTask.resume()
                    }
                    else
                    {
                        self.OnQueueNetworkModel();
                    }
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
#if AVATARYUG_DEMO
                    DataHolder.shared.RemovePart(economyItem: modelData)
    
                    #endif
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
                        
                        let artifact = artifacts.first(where: { $0.device == Int(GetPlatfrom().rawValue)})
                        if(artifact != nil)
                        {
                            self.LoadModelData(urlstr: (artifact?.url!)!, completionHandler:
                                                {
                                data in
                                ModelDecryptionHandler.shared.GetModelData(data: data, completionHandler:
                                    {
                                    decdata in
                                        GLTFAsset.load(with: decdata, options: [:]) { (progress, status, maybeAsset, maybeError, _) in
                                            let sceneSource = GLTFSCNSceneSource(asset: maybeAsset!)
                                            let scene = sceneSource.defaultScene
                                            let tempnode = SCNNode()
                                            tempnode.name = bucketname + "+" + modelData.ID
                                            for meshdata  in scene!.rootNode.childNodes
                                            {
                                                tempnode.addChildNode(meshdata)
                                                meshdata.position = SCNVector3(0,0,0)
                                                meshdata.eulerAngles = SCNVector3(0,0,0)
                                            }
#if AVATARYUG_DEMO
                                            DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                            #endif
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
                                                
                                                ApiEvents.shared.ShowPopupMessage(message: "CAN'T LOAD THIS ITEM")
                                                self.OnQueueNetworkModel();
                                            }
                                        }
                                 
                                })
                            })
                        }else
                        {
                            ApiEvents.shared.ShowPopupMessage(message: "CAN'T LOAD THIS ITEM")
                            self.OnQueueNetworkModel();
                        }
                    }
                    catch
                    {

                        ApiEvents.shared.ShowPopupMessage(message: "Artifacts are not available")
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
        var addNew:Bool = true

        if(currentHairData != nil)
        {
            if(currentHairData.ID == modelData.ID)
            {
                isSameModelPresent = true
                addNew = false
                currentHairData  = nil
                if currentNodePoint.childNodes.count > 0 {
                    let nodename = currentNodePoint.childNodes[0].name!
                    if nodename.contains(modelData.ID) {
                        for item in currentNodePoint.childNodes {
                            item.removeFromParentNode()
                        }
                    }
                }
#if AVATARYUG_DEMO
                DataHolder.shared.RemovePart(economyItem: modelData)
                #endif
            }
            else
            {
                currentHairData = modelData
#if AVATARYUG_DEMO
                DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                #endif
            }
        }
        else
        {
            currentHairData = modelData
#if AVATARYUG_DEMO
            DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
            #endif
        }
       
        HeadMaterial.shared.RemoveHeadHairTex()
      
       

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if isSameModelPresent {
                if self.headwearModelNode == nil {
                    self.HeadCoreBuck = ""
                    self.ResetBlendshapes()
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
                    if(addNew)
                    {
                        if config?.isTwoD == 1 {
                            let jsonData = modelData.artifacts.data(using: .utf8)!
                            do {
                                let artifacts = try JSONDecoder().decode(
                                    [TwoDArtifact].self, from: jsonData)
                                if(artifacts.count > 0){
                                    ApiEvents.shared.ShowLoading()
                                    
                                    let artifact = artifacts.first(where: { $0.device == Int(GetPlatfrom().rawValue)})
                                    if( artifact != nil)
                                    {
                                        guard let url2 = URL(string: (artifact?.url!)!) else {
                                            return
                                        }
                                        let getDataTask2 = URLSession.shared.dataTask(
                                            with: url2,
                                            completionHandler: { data, _, error in
                                                guard let data = data, error == nil else {
                                                    return
                                                }
                                                HeadMaterial.shared.SetHeadHairTex(texture: UIImage(data: data)!)
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                    ApiEvents.shared.HideLoading()
                                                    self.OnQueueNetworkModel()
                                                }
                                            })
                                        getDataTask2.resume()
                                        
                                    }
                                    else
                                    {
                                        ApiEvents.shared.HideLoading()
                                        self.OnQueueNetworkModel();
                                    }
                                    
                                }
                                
                            } catch {
                                if(ProjectSettings.shared.isDebug)
                                {
                                    print(error)
                                }
                                
                                ApiEvents.shared.HideLoading()
                                ApiEvents.shared.ShowPopupMessage(message: error.localizedDescription)
                            }
                        } else {
                            let jsonData = modelData.artifacts.data(using: .utf8)!
                            do {
                                let artifacts = try JSONDecoder().decode(
                                    [ThreeDArtifact].self, from: jsonData)
                                if(artifacts.count > 0){
                                    ApiEvents.shared.ShowLoading()
                                    
                                    let artifact = artifacts.first(where: { $0.device == Int(GetPlatfrom().rawValue)})
                                    if( artifact != nil)
                                    {
                                        self.LoadModelData(   urlstr: (artifact?.url!)!,     completionHandler: {
                                            data in
                                            ModelDecryptionHandler.shared.GetModelData( data: data, completionHandler: {
                                                decdata in
                                                
                                                GLTFAsset.load(with: decdata, options: [:]) { (progress, status, maybeAsset, maybeError, _) in
                                                    let sceneSource = GLTFSCNSceneSource(asset: maybeAsset!)
                                                    let scene =  sceneSource.defaultScene
                                                    let tempnode = SCNNode()
                                                    tempnode.name = bucketname + "+" + modelData.ID
                                                    for meshdata in scene!.rootNode.childNodes {
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
#if AVATARYUG_DEMO
                                                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                                    #endif
                                                    HeadMaterial.shared.RemoveHeadHairTex()
                                                    GetMeshNode(
                                                        _bone: tempnode,
                                                        completionHandler: {
                                                            node in
                                                            node.geometry?.firstMaterial =                                       HairMaterial.shared.hairMaterial
#if AVATARYUG_DEMO
                                                            if(!CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.HairColor.isEmpty){
                                                                HairMaterial.shared.SethairColor(_color: UIColor(hex:   CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.HairColor)!)
                                                            }
                                                            #endif
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
                                                }
                                                
                                            })
                                        })
                                    }else
                                    {
                                        ApiEvents.shared.HideLoading()
                                        self.OnQueueNetworkModel();
                                    }
                                    
                                }
                                
                            } catch {
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
            }else{
                ApiEvents.shared.HideLoading()
                    self.OnQueueNetworkModel();
            }
        }
    }
    
    func Set2Dhairs(modelData : GetEconomyItemsResultDataInner,paretnodescenn:SCNNode){
        self.Loop2Dhair(_bone: paretnodescenn)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
        {
            ApiEvents.shared.HideLoading()
            self.OnQueueNetworkModel();
        }
    }
    func Loop2Dhair(_bone: SCNNode!) {
      if _bone != nil {
        if _bone.geometry?.firstMaterial != nil {
            HeadMaterial.shared.SetHeadHairTex(texture: (_bone.geometry?.firstMaterial!.diffuse.contents)! as! UIImage)
#if AVATARYUG_DEMO
            HeadMaterial.shared.SetHairColor(color: UIColor(hex: CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.HairColor)!)
            #endif
        }
      }
      if _bone.childNodes.count > 0 {
        for i in 0..._bone.childNodes.count - 1 {
            Loop2Dhair(_bone: _bone.childNodes[i])
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
        
        var addNew:Bool = true
        
        if(currentFacialhairData != nil)
        {
                    if(currentFacialhairData.ID == modelData.ID)
                    {
                        isSameModelPresent = true
                        addNew = false
                        currentFacialhairData  = nil
                        if currentNodePoint.childNodes.count > 0 {
                            let nodename = currentNodePoint.childNodes[0].name!
                            if nodename.contains(modelData.ID) {
                                for item in currentNodePoint.childNodes {
                                    item.removeFromParentNode()
                                }
                            }
                        }
#if AVATARYUG_DEMO
                        DataHolder.shared.RemovePart(economyItem: modelData)
                        #endif
                    }
                    else
                    {
                        currentFacialhairData = modelData
#if AVATARYUG_DEMO
                        DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                        #endif
                    }
        }
        else
        {
                    currentFacialhairData = modelData
#if AVATARYUG_DEMO
                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
            #endif
        }
        HeadMaterial.shared.RemoveBeardTex()
        
        
        if(currentNodePoint.childNodes.count > 0)
        {
            let nodename = currentNodePoint.childNodes[0].name!
            if(nodename.contains(modelData.ID))
            {
             
                for item in currentNodePoint.childNodes
                {
                    item.removeFromParentNode()
                }
            }
        }
        
     
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
            }
                if(currentNodePoint.childNodes.count > 0 )
                {
                    for item in currentNodePoint.childNodes
                    {
                        item.removeFromParentNode()
                    }
                }
                
        if(addNew)
        {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
            {
                if(config?.isTwoD == 1)
                {
                    let jsonData = modelData.artifacts.data(using: .utf8)!
                    do
                    {
                        let artifacts = try JSONDecoder().decode([ThreeDArtifact].self, from: jsonData)
                        ApiEvents.shared.ShowLoading()
                        let artifact = artifacts.first(where: { $0.device == Int(GetPlatfrom().rawValue)})
                        if(artifact != nil)
                        {
                            if(artifacts.count > 0){
                                ApiEvents.shared.ShowLoading()
                                
                                let artifact = artifacts.first(where: { $0.device == Int(GetPlatfrom().rawValue)})
                                if( artifact != nil)
                                {
                                    guard let url2 = URL(string: (artifact?.url!)!) else {
                                        return
                                    }
                                    let getDataTask2 = URLSession.shared.dataTask(
                                        with: url2,
                                        completionHandler: { data, _, error in
                                            guard let data = data, error == nil else {
                                                return
                                            }
                                            HeadMaterial.shared.SetBeardTex(texture: UIImage(data: data)!)
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                ApiEvents.shared.HideLoading()
                                                self.OnQueueNetworkModel()
                                            }
                                        })
                                    getDataTask2.resume()
                                    
                                }
                                else
                                {
                                    ApiEvents.shared.HideLoading()
                                    self.OnQueueNetworkModel();
                                }
                                
                            }
                        }else{
                            ApiEvents.shared.HideLoading()
                            ApiEvents.shared.ShowPopupMessage(message: "data not available")
                            self.OnQueueNetworkModel()
                        }
                     
                    }
                    catch
                    {
                        if(ProjectSettings.shared.isDebug)
                        {
                            print(error)
                        }

                        ApiEvents.shared.HideLoading()
                        ApiEvents.shared.ShowPopupMessage(message: error.localizedDescription)
                    }
                
                }
                else
                {
                    let jsonData = modelData.artifacts.data(using: .utf8)!
                    do
                    {
                        let artifacts = try JSONDecoder().decode([ThreeDArtifact].self, from: jsonData)
                        ApiEvents.shared.ShowLoading()
                        let artifact = artifacts.first(where: { $0.device == Int(GetPlatfrom().rawValue)})
                        if(artifact != nil)
                        {
                            self.LoadModelData(urlstr: (artifact?.url!)!, completionHandler:
                                                {
                                data in
                                ModelDecryptionHandler.shared.GetModelData(data: data, completionHandler:
                                                                            {
                                    decdata in
                                    
                                    GLTFAsset.load(with: decdata, options: [:]) { (progress, status, maybeAsset, maybeError, _) in
                                        let sceneSource = GLTFSCNSceneSource(asset: maybeAsset!)
                                        let scene = sceneSource.defaultScene
                                        let tempnode = SCNNode()
                                        
                                        tempnode.name = bucketname + "+" + modelData.ID
                                        for meshdata  in scene!.rootNode.childNodes
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
#if AVATARYUG_DEMO
                                        DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                        #endif
                                        HeadMaterial.shared.RemoveBeardTex()
                                        GetMeshNode(_bone:tempnode, completionHandler:
                                                        {
                                            node in
                                            node.geometry?.firstMaterial = FacialhairMaterial.shared.facialhairMaterial
                                           //  FacialhairMaterial.shared.SetFacialhairColor(_color: UIColor(hex: CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.FacialHairColor)! )
                                            
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
                                   
                                })
                            })
                        }else{
                            ApiEvents.shared.HideLoading()
                            ApiEvents.shared.ShowPopupMessage(message: "data not available")
                            self.OnQueueNetworkModel()
                        }
                     
                    }
                    catch
                    {
                        if(ProjectSettings.shared.isDebug)
                        {
                            print(error)
                        }

                        ApiEvents.shared.HideLoading()
                        ApiEvents.shared.ShowPopupMessage(message: error.localizedDescription)
                    }
                }
            
        }
        }else{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                ApiEvents.shared.HideLoading()
                self.OnQueueNetworkModel()
            }
        }
              
        
    }
    func Set2DFacialhairs(modelData : GetEconomyItemsResultDataInner,paretnodescenn:SCNNode){
        self.Loop2DFacialhair(_bone: paretnodescenn)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
        {
            ApiEvents.shared.HideLoading()
            self.OnQueueNetworkModel();
        }
    }
    func Loop2DFacialhair(_bone: SCNNode!) {
      if _bone != nil {
        if _bone.geometry?.firstMaterial != nil {
            HeadMaterial.shared.SetBeardTex(texture: (_bone.geometry?.firstMaterial!.diffuse.contents)! as! UIImage)
#if AVATARYUG_DEMO
            HeadMaterial.shared.SetBreadColor(color: UIColor(hex: CurrentSelectedAvatarDetail.shared.ChangedAvatarColor.FacialHairColor)!)
            #endif
        }
      }
      if _bone.childNodes.count > 0 {
        for i in 0..._bone.childNodes.count - 1 {
            Loop2DFacialhair(_bone: _bone.childNodes[i])
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
#if AVATARYUG_DEMO
                    DataHolder.shared.RemovePart(economyItem: modelData)
                    #endif
                    addnew = false
     
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
                        
                        let artifacr = artifacts.first(where:  {$0.device == Int(GetPlatfrom().rawValue) })
                        
                        if(artifacr != nil)
                        {
                            guard let url = URL(string: (artifacr?.url)!) else { return }
                            let getDataTask = URLSession.shared.dataTask(
                                with: url,
                                completionHandler: {
                                    data, _, error in
//                                    guard let data = data, error == nil else { return }
//                                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
//                                    EyeballMaterial.shared.SetEyeballTex(texture: UIImage(data: data)!)
//                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                                        ApiEvents.shared.HideLoading()
//
//                                        self.OnQueueNetworkModel()
//                                    }
                                    if let imageData = data, let image = UIImage(data: imageData) {
#if AVATARYUG_DEMO
                                        DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                        #endif
                                        EyeballMaterial.shared.SetEyeballTex(texture: image)
#if AVATARYUG_DEMO
                                        DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                        #endif
                                       DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                           ApiEvents.shared.HideLoading()
                                           self.OnQueueNetworkModel()
                                       }
                                    } else {
                                        // Handle the case where data is nil or couldn't be converted to an image
                                        ApiEvents.shared.HideLoading ()
                                        ApiEvents.shared.ShowPopupMessage (message: "Data is missing")
                                    }
                                })
                            getDataTask.resume()
                        }
                        else
                        {
                            ApiEvents.shared.HideLoading()
                            ApiEvents.shared.ShowPopupMessage(message: "Eyeball data not available")
                            self.OnQueueNetworkModel()
                        }
                    } else {
        
                        ApiEvents.shared.HideLoading()
                        ApiEvents.shared.ShowPopupMessage(message: "Eyeball data not available")
                        self.OnQueueNetworkModel()
                    }
                } catch {

                    ApiEvents.shared.HideLoading()
                    ApiEvents.shared.ShowPopupMessage(message: "Eyeball data not available")
                    self.OnQueueNetworkModel()
                }
            }
        }

        if modelData.itemCategory == Category.Lips.rawValue {
            ApiEvents.shared.ShowLoading()
            var addnew: Bool = true
            if currentLipsData != nil {
                if currentLipsData.ID == modelData.ID {
#if AVATARYUG_DEMO
                    DataHolder.shared.RemovePart(economyItem:  modelData)
                    #endif
                    addnew = false
  
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
                        let artifacr = artifacts.first(where:  {$0.device == Int(GetPlatfrom().rawValue) })
                        if(artifacr != nil)
                        {
                            guard let url = URL(string: (artifacr?.url!)!) else {
                                return
                            }
                            
                            let getDataTask = URLSession.shared.dataTask(
                                with: url,
                                completionHandler: { data, _, error in
                                    guard let data = data, error == nil else {
                                        return
                                    }
                                    HeadMaterial.shared.SetLipTex(texture: UIImage(data: data)!)
#if AVATARYUG_DEMO
                                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                    #endif
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        self.OnQueueNetworkModel()
                                    }
                                })
                            getDataTask.resume()
                        }
                        else
                        {
                            ApiEvents.shared.HideLoading()
                            ApiEvents.shared.ShowPopupMessage(message: "Lips data not available")
                            self.OnQueueNetworkModel()
                        }
                    } else {
     
                        ApiEvents.shared.HideLoading()
                        ApiEvents.shared.ShowPopupMessage(message: "Lips data not available")
                        self.OnQueueNetworkModel()
                    }
                } catch {

                    ApiEvents.shared.HideLoading()
                    ApiEvents.shared.ShowPopupMessage(message: "Lips data not available")
                    self.OnQueueNetworkModel()
                }
            }
        }

        if modelData.itemCategory == Category.Eyebrow.rawValue {
            ApiEvents.shared.ShowLoading()
            var addnew: Bool = true
            if currentEyebrowData != nil {
                if currentEyebrowData.ID == modelData.ID {
#if AVATARYUG_DEMO
                    DataHolder.shared.RemovePart(economyItem:  modelData)
                    #endif
                    addnew = false
            
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
                        let artifacr = artifacts.first(where:  {$0.device == Int(GetPlatfrom().rawValue) })
                        if(artifacr != nil)
                        {
                            guard let url = URL(string: (artifacr?.url!)!) else {
                                return
                            }
                            
                            let getDataTask = URLSession.shared.dataTask(
                                with: url,
                                completionHandler: { data, _, error in
                                    guard let data = data, error == nil else {
                                        return
                                    }
                                    HeadMaterial.shared.SetEyebrowTex(texture: UIImage(data: data)!)
#if AVATARYUG_DEMO
                                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                    #endif
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        ApiEvents.shared.HideLoading()
                                        self.OnQueueNetworkModel()
                                    }
                                })
                            getDataTask.resume()
                        }else
                        {
                            ApiEvents.shared.HideLoading()
                            ApiEvents.shared.ShowPopupMessage(message: "Eyebrow data not available")
                            self.OnQueueNetworkModel()
                        }
                    } else {

                        ApiEvents.shared.HideLoading()
                        ApiEvents.shared.ShowPopupMessage(message: "Eyebrow data not available")
                        self.OnQueueNetworkModel()
                    }
                } catch {

                    ApiEvents.shared.HideLoading()
                    ApiEvents.shared.ShowPopupMessage(message: "Eyebrow data not available")
                    self.OnQueueNetworkModel()
                }

            }
        }
        if modelData.itemCategory == Category.SkinTone.rawValue {
            ApiEvents.shared.ShowLoading()
            var addnew: Bool = true
            if currentSkinToneData != nil {
                if currentSkinToneData.ID == modelData.ID {
#if AVATARYUG_DEMO
                    DataHolder.shared.RemovePart(economyItem: modelData)
                    #endif
                    addnew = false

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
                        if (artifacts.count > 0)
                        {
                            
                            let artifacr = artifacts.first(where:  {$0.device == Int(GetPlatfrom().rawValue) })
                            if(artifacr != nil)
                            {
                                guard let url = URL(string: (artifacr?.face_path!)!) else {
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
                                        
                                        guard let url2 = URL(string: (artifacr?.body_path!)!) else {
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
#if AVATARYUG_DEMO
                                                DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                                                #endif
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                    ApiEvents.shared.HideLoading()
                                                    self.OnQueueNetworkModel()
                                                }
                                            })
                                        getDataTask2.resume()
                                    })
                                getDataTask.resume()
                            }
                            else
                            {
                                ApiEvents.shared.ShowPopupMessage(message: "Skintone data not available")
                                self.OnQueueNetworkModel()
                            }
                        } else {
  
                            ApiEvents.shared.ShowPopupMessage(message: "Skintone data not available")
                            self.OnQueueNetworkModel()
                        }
                    } catch {
              
                        ApiEvents.shared.ShowPopupMessage(message: "Skintone data not available")
                        self.OnQueueNetworkModel()
                    }
                } else {
     
                    ApiEvents.shared.ShowPopupMessage(message: "Skintone data not available")
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
#if AVATARYUG_DEMO
                    DataHolder.shared.RemovePart(economyItem: modelData)
                    #endif
                    addNew = false
                } else {
#if AVATARYUG_DEMO
                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    #endif
                    currentFaceShapeData = modelData
                    addNew = true
                }
            } else {
#if AVATARYUG_DEMO
                DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                #endif
                currentFaceShapeData = modelData
                addNew = true
            }
        }

        if modelData.itemCategory == Category.EyeShape.rawValue {
            ResetPerticaulerBlendshape(names: "Eyeshape_")
            if currentEyeShapeData != nil {
                if currentEyeShapeData.ID == modelData.ID {
#if AVATARYUG_DEMO
                    DataHolder.shared.RemovePart(economyItem: modelData)
                    #endif
                    addNew = false
                } else {
#if AVATARYUG_DEMO
                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    #endif
                    currentEyeShapeData = modelData
                    addNew = true
                }
            } else {
#if AVATARYUG_DEMO
                DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                #endif
                currentEyeShapeData = modelData
                addNew = true
            }
        }

        if modelData.itemCategory == Category.EyebrowShape.rawValue {
            ResetPerticaulerBlendshape(names: "Eyebrows_")
            if currentEyebrowshapeData != nil {
                if currentEyebrowshapeData.ID == modelData.ID {
#if AVATARYUG_DEMO
                    DataHolder.shared.RemovePart(economyItem: modelData)
                    #endif
                    addNew = false
                } else {
#if AVATARYUG_DEMO
                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    #endif
                    currentEyebrowshapeData = modelData
                    addNew = true
                }
            } else {
#if AVATARYUG_DEMO
                DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                #endif
                currentEyebrowshapeData = modelData
                addNew = true
            }
        }

        if modelData.itemCategory == Category.NoseShape.rawValue {
            ResetPerticaulerBlendshape(names: "Nose_")
            if currentNoseShapeData != nil {
                if currentNoseShapeData.ID == modelData.ID {
#if AVATARYUG_DEMO
                    DataHolder.shared.RemovePart(economyItem: modelData)
                    #endif
                    addNew = false
                } else {
#if AVATARYUG_DEMO
                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    #endif
                    currentNoseShapeData = modelData
                    addNew = true
                }
            } else {
#if AVATARYUG_DEMO
                DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                #endif
                currentNoseShapeData = modelData
                addNew = true
            }
        }

        if modelData.itemCategory == Category.LipShape.rawValue {
            ResetPerticaulerBlendshape(names: "Lips_")
            if currentLipShapeData != nil {
                if currentLipShapeData.ID == modelData.ID {
#if AVATARYUG_DEMO
                    DataHolder.shared.RemovePart(economyItem: modelData)
                    #endif
                    addNew = false
                } else {
#if AVATARYUG_DEMO
                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    #endif
                    currentLipShapeData = modelData
                    addNew = true
                }
            } else {
#if AVATARYUG_DEMO
                DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                #endif
                currentLipShapeData = modelData
                addNew = true
            }
        }

        if modelData.itemCategory == Category.EarShape.rawValue {
            ResetPerticaulerBlendshape(names: "Ears_")
            if currentEarshapeData != nil {
                if currentEarshapeData.ID == modelData.ID {
#if AVATARYUG_DEMO
                    DataHolder.shared.RemovePart(economyItem: modelData)
                    #endif
                    addNew = false
                } else {
#if AVATARYUG_DEMO
                    DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                    #endif
                    currentEarshapeData = modelData
                    addNew = true
                }
            } else {
#if AVATARYUG_DEMO
                DataHolder.shared.AddCurrentBodyPart(economyItem: modelData)
                #endif
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

        var gender = "0"
        if GetGender() == .Male {
            gender = "0"
        } else if GetGender() == .Female {
            gender = "1"
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

        var gender = "0"
        if GetGender() == .Male {
            gender = "0"
        } else if GetGender() == .Female {
            gender = "1"
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
    public func Logout()
    {
#if AVATARYUG_DEMO
        DataHolder.shared.currentSelectedBodyParts = []
        DataHolder.shared.itemsTobuy  = []
        #endif
        clipBones = []
        headGeometryModel = nil
        innermouthmorpherModel = nil
        headmorpherModel = nil
        VertexList = []
        EyeballMaterial.shared.RemoveEyeballTex()
      
        BodyMaterial.shared.clearTattooTexture()
      
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
