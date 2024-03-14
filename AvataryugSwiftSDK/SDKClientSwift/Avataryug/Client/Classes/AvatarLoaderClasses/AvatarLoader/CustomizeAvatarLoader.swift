import Foundation

import SceneKit
import SwiftUI
import GLTFKit2

class CustomizeAvatarLoader: AvatarLoaderBase {
  //    static let shared = CustomizeAvatarLoader()
  //    override init(){}

    //Set Model parent node where models will be added as child to show in scene
    public func SetupNodeInScene(parentNode: SCNNode, closure:()->Void)
    {
        if(ModelParentNode == nil)
        {
            ModelParentNode = SCNNode()
            if(parentNode != nil)
            {
                parentNode.addChildNode(ModelParentNode)
            }
            else
            {
                CommomData.shared.sceneView?.rootNode.addChildNode(ModelParentNode)
            }

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
    

  // This method load animation from glb file
  public func LoadDefaultAnimation() {
 
    if boneAnimationList.count <= 0 {
        
        guard let assetURL = Bundle.main.url(forResource: "idle_V02_calip",withExtension: "glb"  )
        else {
            print("Failed to find asset for URL")
            return
        }
        
        GLTFAsset.load(with: assetURL, options: [:]) { (progress, status, maybeAsset, maybeError, _) in
            let source = GLTFSCNSceneSource(asset: maybeAsset!)
            self.boneAnimationList = source.animations
        }
    }
  }

  //This method add model data to queue to load models in proper sequence to avoid data loss
  public func LoadNetworkModel(modelData: GetEconomyItemsResultDataInner, undo: Bool) {
    if !undo {
     // UndoHandler.shared.AddProChangeAction(_propitem: modelData)
      networkModelQueueList.append(modelData)
      OnQueueNetworkModel()
    } else {
      networkModelQueueList.append(modelData)
      OnQueueNetworkModel()
    }
  }
}
