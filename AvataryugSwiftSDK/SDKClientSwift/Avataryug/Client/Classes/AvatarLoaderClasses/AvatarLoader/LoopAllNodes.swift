import Foundation
import SceneKit

// This method loop throuth all bone of givent model and check morpth target geometry
func LoopAllMorpherMesh(_bone: SCNNode!, completionHandler: @escaping (SCNNode) -> Void) {
  if !_bone.isEqual(nil) {
    if let morpher = _bone.morpher {
        if(ProjectSettings.shared.isDebug)
        {
            print("***", morpher.targets.count)
        }
      completionHandler(_bone)
    }
  }
  if _bone.childNodes.count > 0 {
    for i in 0..._bone.childNodes.count - 1 {
      LoopAllMorpherMesh(_bone: _bone.childNodes[i], completionHandler: completionHandler)
    }
  }
}

// This method loop throuth all bone of and return bone names
func LoopBoneName(_bone: SCNNode!, completionHandler: @escaping (SCNNode) -> Void) {
  if !_bone.isEqual(nil) {
    if _bone.name != nil {
      completionHandler(_bone)
    }
  }
  if _bone.childNodes.count > 0 {
    for i in 0..._bone.childNodes.count - 1 {
      LoopBoneName(_bone: _bone.childNodes[i], completionHandler: completionHandler)
    }
  }
}

// This method loop throuth all bone of givent model and check morpth target geometry
func GetMorphtargetnode(_bone: SCNNode!, completionHandler: @escaping (SCNNode) -> Void) {
  if _bone != nil {
    if _bone.morpher != nil {
      if (_bone.morpher?.weights.count)! > 0 {
        completionHandler(_bone)
      }
    }
  }
  if _bone.childNodes.count > 0 {
    for i in 0..._bone.childNodes.count - 1 {
      GetMorphtargetnode(_bone: _bone.childNodes[i], completionHandler: completionHandler)
    }
  }
}

// This method loop throuth all bone of given model and check geometry with material
func GetMeshNode(_bone: SCNNode!, completionHandler: @escaping (SCNNode) -> Void) {
  if _bone != nil {
    if _bone.geometry?.firstMaterial != nil {
      completionHandler(_bone)
    }
  }
  if _bone.childNodes.count > 0 {
    for i in 0..._bone.childNodes.count - 1 {
      GetMeshNode(_bone: _bone.childNodes[i], completionHandler: completionHandler)
    }
  }
}

// This method loop throuth all bone of given model and check geometry
func LoopAllMesh(_bone: SCNNode!, completionHandler: @escaping (SCNGeometry) -> Void) {
  if !_bone.isEqual(nil) {
    if let geometry = _bone.geometry {
      if let _ = geometry.firstMaterial {
        completionHandler(geometry)
      }
    }
  }
  if _bone.childNodes.count > 0 {
    for i in 0..._bone.childNodes.count - 1 {
      LoopAllMesh(_bone: _bone.childNodes[i], completionHandler: completionHandler)
    }
  }
}
