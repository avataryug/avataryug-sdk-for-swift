import Foundation
import GLTFSceneKit
import SceneKit
import SwiftUI
import ModelIO

class CustomizeAvatarLoader: AvatarLoaderBase {
  //    static let shared = CustomizeAvatarLoader()
  //    override init(){}

    //Set Model parent node where models will be added as child to show in scene
    public func SetupNodeInScene(closure:()->Void)
    {
        if(ModelParentNode == nil)
        {
            ModelParentNode = SCNNode()
            AvataryugData.shared.sceneView?.rootNode.addChildNode(ModelParentNode)
            ModelParentNode.worldPosition = SCNVector3(0,0,0)
        }
        if(CustomizeModelParent == nil)
        {
            CustomizeModelParent = SCNNode()
            ModelParentNode.addChildNode(CustomizeModelParent)
            CustomizeModelParent.worldPosition = SCNVector3(0,0,0)
        }
        if(headNode == nil)
        {
            headNode = SCNNode()
            CustomizeModelParent.addChildNode(headNode)
            headNode.worldPosition = SCNVector3(0,0,0)
        }
        LoadDefaultAnimation()
        closure()
    }
    
    //Standard_idle.glb
    //thank_you_05.glb
    //idel_well_05.glb
    //idel_hand_up_03.glb
    //idel breathing.glb
    //flying_kiss_05.glb
    var animationList = [ "idle_V02_calip.glb","Standard_idle.glb","thank_you_05.glb","idel_well_05.glb","idel_hand_up_03.glb","idel breathing.glb","flying_kiss_05.glb"]
  // This method load animation from glb file
  public func LoadDefaultAnimation() {
    if boneAnimationList.count <= 0 {
      do {
        let sceneSource = try GLTFSceneSource(
          path: animationList[0], options: [.animationImportPolicy: 10])
        let idleanimscene = try sceneSource.scene()
      
        LoadAnimationFromBone(_bone: idleanimscene.rootNode)
      } catch {
          if(ProjectSettings.shared.isDebug)
          {
              print("\(error.localizedDescription)")
          }
        return
      }
    }
  }

  //This method add model data to queue to load models in proper sequence to avoid data loss
  public func LoadNetworkModel(modelData: GetEconomyItemsResultDataInner, undo: Bool) {
    if !undo {
      //UndoHandler.shared.AddProChangeAction(_propitem: modelData)
      networkModelQueueList.append(modelData)
      OnQueueNetworkModel()
    } else {
      networkModelQueueList.append(modelData)
      OnQueueNetworkModel()
    }
  }
}
