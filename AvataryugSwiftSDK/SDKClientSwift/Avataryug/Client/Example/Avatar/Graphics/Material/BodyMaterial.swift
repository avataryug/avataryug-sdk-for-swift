

import Foundation
import SceneKit

struct TattoDetail
{
    var tattooCategory:String!;
    var image : UIImage!;
}

//This class is used for  body material
//This class containes shader for  body material
//This class create mateterial for body
//This class handles changing  body color and texture

class BodyMaterial
{
     static let shared = BodyMaterial()

     var bodyMaterial = SCNMaterial()

     let empty = SCNMaterialProperty(contents: UIImage(named: "empty.png")!)
     let bodyTex = SCNMaterialProperty(contents: UIImage(named: "body_diffuse.jpg")!)
     private init()
     {
         bodyMaterial.lightingModel = SCNMaterial.LightingModel.physicallyBased
         bodyMaterial.shaderModifiers = [SCNShaderModifierEntryPoint.surface: BodyShader]


         bodyMaterial.setValue(bodyTex, forKey: "bodyTexture")
         //bodyMaterial.normal.contents = UIImage(named: "Body_Normal_Raw.jpg")
//         bodyMaterial.roughness.contents = UIImage(named: "Body_Roughness_Raw.jpg")
//         bodyMaterial.specular.contents = UIImage(named: "Body_Specular_Raw.jpg")
         for category in BodyTattoCategory
         {
             bodyMaterial.setValue(empty, forKey: category)
         }
     }

    let BodyShader = """

            uniform sampler2D bodyTexture;

            uniform sampler2D BackBodyTattoo;
            uniform sampler2D RightArmTattoo;
            uniform sampler2D LeftArmTattoo;
            uniform sampler2D FrontRightLegTattoo;
            uniform sampler2D FrontLeftLegTattoo;
            uniform sampler2D BackRightLegTattoo;
            uniform sampler2D BackLeftLegTattoo;

            vec4 _bodyTexture = texture2D(bodyTexture, _surface.diffuseTexcoord) ;
            vec4 _BackBodyTattoo = texture2D(BackBodyTattoo, _surface.diffuseTexcoord);
            vec4 _RightArmTattoo = texture2D(RightArmTattoo, _surface.diffuseTexcoord);
            vec4 _LeftArmTattoo = texture2D(LeftArmTattoo, _surface.diffuseTexcoord);
            vec4 _FrontRightLegTattoo = texture2D(FrontRightLegTattoo, _surface.diffuseTexcoord);
            vec4 _FrontLeftLegTattoo = texture2D(FrontLeftLegTattoo, _surface.diffuseTexcoord);
            vec4 _BackRightLegTattoo = texture2D(BackRightLegTattoo, _surface.diffuseTexcoord);
            vec4 _BackLeftLegTattoo = texture2D(BackLeftLegTattoo, _surface.diffuseTexcoord);
            
            vec4 layer1 = mix(_bodyTexture,_BackBodyTattoo,_BackBodyTattoo.w);
            vec4 layer2 = mix(layer1,_RightArmTattoo,_RightArmTattoo.w);
            vec4 layer3 = mix(layer2,_LeftArmTattoo,_LeftArmTattoo.w);
            vec4 layer4 = mix(layer3,_FrontRightLegTattoo,_FrontRightLegTattoo.w);
            vec4 layer5 = mix(layer4,_FrontLeftLegTattoo,_FrontLeftLegTattoo.w);
            vec4 layer6 = mix(layer5,_BackRightLegTattoo,_BackRightLegTattoo.w);
            vec4 layer7 = mix(layer6,_BackLeftLegTattoo,_BackLeftLegTattoo.w);

            _surface.diffuse = layer7;
            _surface.roughness = 0.8;
            """




    
     func SetSkinTonetexture(skinTex:UIImage)
     {
         let tex = SCNMaterialProperty(contents: skinTex)
         bodyMaterial.setValue(tex, forKey: "bodyTexture")
     }
     func RemoveSkinTonetexture()
     {

         bodyMaterial.setValue(bodyTex, forKey: "bodyTexture")
     }
    func SetTattooTexture(key:String, texture: UIImage)
    {
        let tex = SCNMaterialProperty(contents:texture)
        bodyMaterial.setValue(tex, forKey: key)
    }
     func clearTattooTexture()
     {
         for category in BodyTattoCategory
         {
             bodyMaterial.setValue(empty, forKey: category)
         }
     }

    var BodyTattoCategory : [String] = [ "LeftArmTattoo","RightArmTattoo",
        "FrontLeftLegTattoo","FrontRightLegTattoo",  "BackBodyTattoo", "BackLeftLegTattoo", "BackRightLegTattoo","HeadTattoo"]
}
