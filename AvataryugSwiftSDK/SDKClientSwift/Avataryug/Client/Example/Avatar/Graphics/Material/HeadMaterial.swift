import Foundation
import SceneKit

//This class is used for  head material
//This class containes shader for  head material
//This class create mateterial for head
//This class handles changing  body head and texture

class HeadMaterial
{
    static let shared = HeadMaterial()
    
    var headMaterial = SCNMaterial()
    
    let empty = SCNMaterialProperty(contents: UIImage(named: "empty.png")!)
    let headTex = SCNMaterialProperty(contents: UIImage(named: "face_diffuse.jpg")!)
    let lipTex = SCNMaterialProperty(contents: UIImage(named: "lips.png")!)
    let eyebrowTex = SCNMaterialProperty(contents: UIImage(named: "eyebrow.png")!)
    let eyelinerTex = SCNMaterialProperty(contents: UIImage(named: "Eyeliner.png")!)
    private init()
    {
        headMaterial.name = "head"
        headMaterial.lightingModel = SCNMaterial.LightingModel.physicallyBased
        //headMaterial.lightingModel = SCNMaterial.LightingModel.phong
        headMaterial.shaderModifiers = [SCNShaderModifierEntryPoint.surface: HeadShader]
        
//        headMaterial.setValue(UIColor(red: 255, green: 156, blue: 64), forKey: "bodyColor")
        headMaterial.setValue(UIColor(red: 255, green: 255, blue: 255), forKey: "bodyColor")
        headMaterial.setValue(headTex, forKey: "bodyTexture")
        
        headMaterial.setValue(empty, forKey: "HeadTattoo")
        
        headMaterial.setValue(empty, forKey: "HairTexture")
        headMaterial.setValue(UIColor.black, forKey: "HairColor")
        
        headMaterial.setValue(empty, forKey: "BeardTexture")
        headMaterial.setValue(UIColor.black, forKey: "BeardColor")
        
        headMaterial.setValue(eyebrowTex, forKey: "EyebrowTexture")
        headMaterial.setValue(UIColor.black, forKey: "EyebrowColor")
        
        headMaterial.setValue(eyelinerTex, forKey: "EyelinerTexture")
        headMaterial.setValue(UIColor.black, forKey: "EyelinerColor")
        
        headMaterial.setValue(lipTex, forKey: "LipsTexture")
        headMaterial.setValue(UIColor.red, forKey: "LipsColor")
    
    }
    
    var HairColor : String = "#2a2a2a"
    var EyebrowColor : String = "#272727"
    var FacialHairColor : String = "#3b3b3b"
    var LipColor :String = "#ff9e7e"
    var FaceColor : String = "#FFFFFF"

   let HeadShader = """

           uniform sampler2D bodyTexture;
           uniform vec4 bodyColor;
           
           uniform sampler2D HeadTattoo;
           
           uniform sampler2D HairTexture;
           uniform vec4 HairColor;

           uniform sampler2D BeardTexture;
           uniform vec4 BeardColor;

           uniform sampler2D EyebrowTexture;
           uniform vec4 EyebrowColor;

           uniform sampler2D EyelinerTexture;
           uniform vec4 EyelinerColor;

           uniform sampler2D LipsTexture;
           uniform vec4 LipsColor;

           vec4 _bodyTexture = texture2D(bodyTexture, _surface.diffuseTexcoord) * bodyColor;
           vec4 _tattooTexture = texture2D(HeadTattoo, _surface.diffuseTexcoord);
           
            vec4 _hairTexture = texture2D(HairTexture, _surface.diffuseTexcoord) * HairColor;
            vec4 _beardTexture = texture2D(BeardTexture, _surface.diffuseTexcoord) * BeardColor;
            vec4 _eyebrowTexture = texture2D(EyebrowTexture, _surface.diffuseTexcoord) * EyebrowColor;
            vec4 _eyelinerTexture = texture2D(EyelinerTexture, _surface.diffuseTexcoord) * EyelinerColor;
            vec4 _lipsTexture = texture2D(LipsTexture, _surface.diffuseTexcoord) * LipsColor;
           
           vec4 layer1 = mix(_bodyTexture,_tattooTexture,_tattooTexture.w);
           vec4 layer2 = mix(layer1,_hairTexture,_hairTexture.w);
           vec4 layer3 = mix(layer2,_beardTexture,_beardTexture.w);
           vec4 layer4 = mix(layer3,_eyebrowTexture,_eyebrowTexture.w);
           vec4 layer5 = mix(layer4,_eyelinerTexture,_eyelinerTexture.w);
           vec4 layer6 = mix(layer5,_lipsTexture,_lipsTexture.w);
           _surface.diffuse = layer6;
           _surface.roughness = 0.5;
           """


   func SetBodyColor(_color:UIColor)
   {
       headMaterial.setValue( _color , forKey: "bodyColor")
       FaceColor =  _color.toHexString()
   }

    func RemoveBodyColor()
    {
        headMaterial.setValue( UIColor(red: 255, green: 255, blue: 255) , forKey: "bodyColor")
        FaceColor = "#FFFFFF"
    }

    func SetSkinTonetexture(skinTex:UIImage)
    {
        FaceColor = "#FFFFFF"
        headMaterial.setValue(UIColor(red: 255, green: 255, blue: 255), forKey: "bodyColor")
        let tex = SCNMaterialProperty(contents: skinTex)
        headMaterial.setValue(tex, forKey: "bodyTexture")
        FaceColor = "#FFFFFF"
    }
    func RemoveSkinTonetexture()
    {
        let tex = SCNMaterialProperty(contents: headTex)
        headMaterial.setValue(tex, forKey: "bodyTexture")
        FaceColor = "#FFFFFF"
        headMaterial.setValue(UIColor(red: 255, green: 255, blue: 255), forKey: "bodyColor")
    }
    func SetTattooTexture(tatto:UIImage)
    {
        let tex = SCNMaterialProperty(contents: tatto)
        headMaterial.setValue(tex, forKey: "HeadTattoo")
    }
     
    func RemoveTattooTexture()
    {
        headMaterial.setValue(empty, forKey: "HeadTattoo")
    }
    
    //hair
    func SetHeadHairTex(texture:UIImage)
    {
        let tex = SCNMaterialProperty(contents: texture)
        headMaterial.setValue(tex, forKey: "HairTexture")
    }
    func RemoveHeadHairTex()
    {
        headMaterial.setValue(empty, forKey: "HairTexture")
    }
    func SetHairColor(color:UIColor)
    {
        headMaterial.setValue(color, forKey: "HairColor")
        HairColor  =  color.toHexString()
    }
    func RemoveHairColor()
    {
        headMaterial.setValue(UIColor.black, forKey: "HairColor")
        HairColor  = "#2a2a2a"
    }
    
    //beard
    func SetBeardTex(texture:UIImage)
    {
        let tex = SCNMaterialProperty(contents: texture)
        headMaterial.setValue(tex, forKey: "BeardTexture")
    }
    func RemoveBeardTex()
    {
        headMaterial.setValue(empty, forKey: "BeardTexture")
    }
    func SetBreadColor(color:UIColor)
    {
        headMaterial.setValue(color, forKey: "BeardColor")
        FacialHairColor = color.toHexString()
    }
    func RemoveBreardColor()
    {
        headMaterial.setValue(UIColor.black, forKey: "BeardColor")
        FacialHairColor = "#3b3b3b"
    }
    
    //eyebrow
    func SetEyebrowTex(texture:UIImage)
    {
        let tex = SCNMaterialProperty(contents: texture)
        headMaterial.setValue(tex, forKey: "EyebrowTexture")
    }
    func RemoveEyebrowTex()
    {
        headMaterial.setValue(eyebrowTex, forKey: "EyebrowTexture")
    }
    func SetEyebrowColor(color:UIColor)
    {
        headMaterial.setValue(color, forKey: "EyebrowColor")
        EyebrowColor = color.toHexString()
    }
    func RemoveEyebrowColor()
    {
        headMaterial.setValue(UIColor.black, forKey: "EyebrowColor")
        EyebrowColor = "#272727"
    }
    
    //lips
    func SetLipTex(texture:UIImage)
    {
        let tex = SCNMaterialProperty(contents: texture)
        headMaterial.setValue(tex, forKey: "LipsTexture")
    }
    func RemoveLipTex()
    {
        headMaterial.setValue(lipTex, forKey: "LipsTexture")
    }
    func SetLipColor(color:UIColor)
    {
        headMaterial.setValue(color, forKey: "LipsColor")
        LipColor = color.toHexString()
    }
    func RemoveLipColor()
    {
        headMaterial.setValue(UIColor.red, forKey: "LipsColor")
        LipColor = "#ff9e7e"
    }
}
