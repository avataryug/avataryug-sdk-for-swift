import Foundation
import SceneKit

class DefaultModelMaterial
{
    static let shared = DefaultModelMaterial()
    
    var maleBottomMaterial = SCNMaterial()
    var femaleBottomMaterial = SCNMaterial()
    var maleTopMaterial = SCNMaterial()
    var femaleTopMaterial = SCNMaterial()
    
    
    let male_bottom_diffuse = SCNMaterialProperty(contents: UIImage(named: "male_bottom_diffuse.jpg")!)
    let male_bottom_normal = SCNMaterialProperty(contents: UIImage(named: "male_bottom_normal.jpg")!)
    let matShader = """

            uniform sampler2D bodyTexture;
            uniform sampler2D normalTexture;
            
            vec4 _bodyTexture = texture2D(bodyTexture, _surface.diffuseTexcoord) ;
            vec4 _normalTexture = texture2D(normalTexture, _surface.diffuseTexcoord) ;
            _surface.diffuse = _bodyTexture;
            _surface.roughness = 0.8;
            """
    
    let male_top_diffuse = SCNMaterialProperty(contents: UIImage(named: "male_top_diffuse.jpg")!)
    let male_top_normal = SCNMaterialProperty(contents: UIImage(named: "male_top_normal.jpg")!)
    
    
    let female_bottom_diffuse = SCNMaterialProperty(contents: UIImage(named: "female_bottom_diffuse.jpg")!)
    let female_top_diffuse = SCNMaterialProperty(contents: UIImage(named: "female_top_diffuse.jpg")!)
    private init()
    {
        maleBottomMaterial.name = "Male_Bottom"
        maleBottomMaterial.lightingModel = SCNMaterial.LightingModel.physicallyBased
        maleBottomMaterial.shaderModifiers = [SCNShaderModifierEntryPoint.surface: matShader]
        maleBottomMaterial.setValue(male_bottom_diffuse, forKey: "bodyTexture")

        maleTopMaterial.name = "Male_Top"
        maleTopMaterial.lightingModel = SCNMaterial.LightingModel.physicallyBased
        maleTopMaterial.shaderModifiers = [SCNShaderModifierEntryPoint.surface: matShader]
        maleTopMaterial.setValue(male_top_diffuse, forKey: "bodyTexture")
        
        femaleBottomMaterial.name = "Female_Bottom"
        femaleBottomMaterial.lightingModel = SCNMaterial.LightingModel.physicallyBased
        femaleBottomMaterial.shaderModifiers = [SCNShaderModifierEntryPoint.surface: matShader]
        femaleBottomMaterial.setValue(female_bottom_diffuse, forKey: "bodyTexture")
        
        femaleTopMaterial.name = "Female_Top"
        femaleTopMaterial.lightingModel = SCNMaterial.LightingModel.physicallyBased
        femaleTopMaterial.shaderModifiers = [SCNShaderModifierEntryPoint.surface: matShader]
        femaleTopMaterial.setValue(female_top_diffuse, forKey: "bodyTexture")
    }
}
