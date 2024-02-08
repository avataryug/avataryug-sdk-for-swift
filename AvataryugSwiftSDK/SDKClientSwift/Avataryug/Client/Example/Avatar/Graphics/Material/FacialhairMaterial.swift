import Foundation
import SceneKit

//This class is used for facial hair material
//This class containes shader for facial hair material
//This class create mateterial for facial
//This class handles changing facial hair color and texture

class FacialhairMaterial
{
    static let shared = FacialhairMaterial()
    
    var facialhairMaterial = SCNMaterial()
    var FacialHairColor : String = "#3b3b3b"

    private init()
    {
        facialhairMaterial.lightingModel = SCNMaterial.LightingModel.physicallyBased
        facialhairMaterial.shaderModifiers = [SCNShaderModifierEntryPoint.surface: HeadShader]
        facialhairMaterial.setValue(UIColor(red: 0, green: 0, blue: 0, alpha: 1), forKey: "bodyColor")
        facialhairMaterial.setValue(UIColor.black, forKey: "hairColor")
    }

   let HeadShader = """

           uniform vec4 hairColor;
           
           _surface.diffuse = hairColor;
           _surface.roughness = 0.5;
           """

   func SetFacialhairColor(_color:UIColor)
   {
       facialhairMaterial.setValue( _color , forKey: "hairColor")
       FacialHairColor =  _color.toHexString()
   }

    func RemoveFacialhaiColor()
    {
        facialhairMaterial.setValue( UIColor(red: 0, green: 0, blue: 0) , forKey: "hairColor")
        FacialHairColor = "#3b3b3b"
    }

}
