import Foundation
import SceneKit

//This class is used for  hair material
//This class containes shader for  hair material
//This class create mateterial for hair
//This class handles changing  hair color and texture

class HairMaterial
{
    static let shared = HairMaterial()
    
    var hairMaterial = SCNMaterial()
    
    let empty = SCNMaterialProperty(contents: UIImage(named: "empty.png")!)
    
    var HairColor : String = "#2a2a2a"
    
    private  init()
    {
        hairMaterial.lightingModel = SCNMaterial.LightingModel.physicallyBased
        hairMaterial.shaderModifiers = [SCNShaderModifierEntryPoint.surface: HeadShader]
        hairMaterial.setValue(UIColor.black, forKey: "hairColor")
        hairMaterial.setValue(empty, forKey: "hairTexture")
    }

    let HeadShader = """
           uniform sampler2D hairTexture;
           uniform vec4 hairColor;
                       
            vec4 _hairTexture = texture2D(hairTexture, _surface.diffuseTexcoord) * hairColor;
           _surface.diffuse = hairColor;
           _surface.roughness = 0.5;
           """

    func SetHairTex(texture:UIImage)
    {
        let tex = SCNMaterialProperty(contents: texture)
        hairMaterial.setValue(tex, forKey: "hairTexture")
    }
    
    func RemovehairTex()
    {
        hairMaterial.setValue(empty, forKey: "hairTexture")
    }
   
    func SethairColor(_color:UIColor)
    {
        hairMaterial.setValue( _color , forKey: "hairColor")
        HairColor = _color.toHexString()
    }

    func RemovehaiColor()
    {
        hairMaterial.setValue( UIColor(red: 0, green: 0, blue: 0) , forKey: "hairColor")
        HairColor = "#2a2a2a"
    }
}
