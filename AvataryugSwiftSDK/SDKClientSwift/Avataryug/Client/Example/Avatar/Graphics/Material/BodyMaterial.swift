

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

         bodyMaterial.setValue(UIColor(red: 255, green: 255, blue: 255), forKey: "bodyColor")
         bodyMaterial.setValue(bodyTex, forKey: "bodyTexture")

         for category in BodyTattoCategory
         {
             bodyMaterial.setValue(empty, forKey: category)
         }
     }

    let BodyShader = """

            uniform sampler2D bodyTexture;
            uniform vec4 bodyColor;

            uniform sampler2D FrontBodyTattoo;
            uniform sampler2D BackBodyTattoo;
            uniform sampler2D RightArmTattoo;
            uniform sampler2D LeftArmTattoo;
            uniform sampler2D FrontRightLegTattoo;
            uniform sampler2D FrontLeftLegTattoo;
            uniform sampler2D BackRightLegTattoo;
            uniform sampler2D BackLeftLegTattoo;
            uniform sampler2D RightHandTattoo;
            uniform sampler2D LeftHandTattoo;
            uniform sampler2D RightFootTattoo;
            uniform sampler2D LeftFootTattoo;


            vec4 _bodyTexture = texture2D(bodyTexture, _surface.diffuseTexcoord) * bodyColor;
            vec4 _FrontBodyTattoo = texture2D(FrontBodyTattoo, _surface.diffuseTexcoord);
            vec4 _BackBodyTattoo = texture2D(BackBodyTattoo, _surface.diffuseTexcoord);
            vec4 _RightArmTattoo = texture2D(RightArmTattoo, _surface.diffuseTexcoord);
            vec4 _LeftArmTattoo = texture2D(LeftArmTattoo, _surface.diffuseTexcoord);
            vec4 _FrontRightLegTattoo = texture2D(FrontRightLegTattoo, _surface.diffuseTexcoord);
            vec4 _FrontLeftLegTattoo = texture2D(FrontLeftLegTattoo, _surface.diffuseTexcoord);
            vec4 _BackRightLegTattoo = texture2D(BackRightLegTattoo, _surface.diffuseTexcoord);
            vec4 _BackLeftLegTattoo = texture2D(BackLeftLegTattoo, _surface.diffuseTexcoord);
            vec4 _RightHandTattoo = texture2D(RightHandTattoo, _surface.diffuseTexcoord);
            vec4 _LeftHandTattoo = texture2D(LeftHandTattoo, _surface.diffuseTexcoord);
            vec4 _RightFootTattoo = texture2D(RightFootTattoo, _surface.diffuseTexcoord);
            vec4 _LeftFootTattoo = texture2D(LeftFootTattoo, _surface.diffuseTexcoord);

            vec4 layer1 = mix(_bodyTexture,_FrontBodyTattoo,_FrontBodyTattoo.w);
            vec4 layer2 = mix(layer1,_BackBodyTattoo,_BackBodyTattoo.w);
            vec4 layer3 = mix(layer2,_RightArmTattoo,_RightArmTattoo.w);
            vec4 layer4 = mix(layer3,_LeftArmTattoo,_LeftArmTattoo.w);
            vec4 layer5 = mix(layer4,_FrontRightLegTattoo,_FrontRightLegTattoo.w);
            vec4 layer6 = mix(layer5,_FrontLeftLegTattoo,_FrontLeftLegTattoo.w);
            vec4 layer7 = mix(layer6,_BackRightLegTattoo,_BackRightLegTattoo.w);
            vec4 layer8 = mix(layer7,_BackLeftLegTattoo,_BackLeftLegTattoo.w);
            vec4 layer9 = mix(layer8,_RightHandTattoo,_RightHandTattoo.w);
            vec4 layer10 = mix(layer9,_LeftHandTattoo,_LeftHandTattoo.w);
            vec4 layer11 = mix(layer10,_RightFootTattoo,_RightFootTattoo.w);
            vec4 layer12 = mix(layer11,_LeftFootTattoo,_LeftFootTattoo.w);
            _surface.diffuse = layer12;
            _surface.roughness = 0.5;
            """


    public func SetBodyColor(_color:UIColor)
    {
        bodyMaterial.setValue( _color , forKey: "bodyColor")
    }
     func RemoveBodyColor()
     {
         bodyMaterial.setValue( UIColor(red: 255, green: 255, blue: 255) , forKey: "bodyColor")
     }
     func ResetSkinTonetexture()
     {
         bodyMaterial.setValue(bodyTex, forKey: "bodyTexture")
     }
     func SetSkinTonetexture(skinTex:UIImage)
     {
         let tex = SCNMaterialProperty(contents: skinTex)
         bodyMaterial.setValue(UIColor(red: 255, green: 255, blue: 255), forKey: "bodyColor")
         bodyMaterial.setValue(tex, forKey: "bodyTexture")
//         FaceColor = UIColor(.white)
     }
     func RemoveSkinTonetexture()
     {
         let tex = SCNMaterialProperty(contents: bodyTex)
         bodyMaterial.setValue(tex, forKey: "bodyTexture")
//         FaceColor = UIColor(.white)
         bodyMaterial.setValue(UIColor(red: 255, green: 255, blue: 255), forKey: "bodyColor")
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

    var BodyTattoCategory : [String] = [ "LeftHandTattoo","RightHandTattoo","LeftArmTattoo","RightArmTattoo","LeftFootTattoo","RightFootTattoo",
        "FrontLeftLegTattoo","FrontRightLegTattoo",  "BackBodyTattoo", "FrontBodyTattoo",  "BackLeftLegTattoo", "BackRightLegTattoo","HeadTattoo"]
}
