import Foundation
import SceneKit

//This class is used for  eyeball material
//This class containes shader for  eyeball material
//This class create mateterial for eyeball
//This class handles changing  eyeball color and texture

class EyeballMaterial
{
    static let shared = EyeballMaterial()
    
    var eyeballMaterial = SCNMaterial()
    
    let eyeballTex = SCNMaterialProperty(contents: UIImage(named: "eyeball.jpg")!)
    
    let BodyShader = """

            uniform sampler2D bodyTexture;
            
            vec4 _bodyTexture = texture2D(bodyTexture, _surface.diffuseTexcoord) ;
            _surface.diffuse = _bodyTexture;
            """
    
   private init()
    {
        eyeballMaterial.name = "eye"
        eyeballMaterial.lightingModel = SCNMaterial.LightingModel.physicallyBased
        eyeballMaterial.shaderModifiers = [SCNShaderModifierEntryPoint.surface: BodyShader]
        eyeballMaterial.setValue(eyeballTex, forKey: "bodyTexture")
    }
    
    public func SetEyeballTex(texture : UIImage )
    {
        let tex = SCNMaterialProperty(contents: texture)
        eyeballMaterial.setValue(tex, forKey: "bodyTexture")
    }
    public func RemoveEyeballTex(){
        eyeballMaterial.setValue(eyeballTex, forKey: "bodyTexture")
    }
}
