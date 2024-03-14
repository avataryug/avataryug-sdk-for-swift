//
//  CommomData.swift
//  SDKClientSwift
//
//  Created by Developer1 on 11/03/24.
//

import Foundation
import SceneKit

class CommomData
{
    static let shared = CommomData()
 
    public init()
    {
        
    }
    
    let sceneView = SCNScene(named: "ModelScene.scn")
    
    var cameraParent: SCNNode {
        return ( sceneView?.rootNode.childNode(withName: "cameraParent", recursively: true))!
    }
}
