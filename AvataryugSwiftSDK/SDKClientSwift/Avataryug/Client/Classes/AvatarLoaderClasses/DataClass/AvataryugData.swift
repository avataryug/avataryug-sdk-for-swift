import Foundation
import SceneKit

class AvataryugData
{
    static let shared = AvataryugData()
    
    let sceneView = SCNScene(named: "AvatarScene.scn")
    
    public func IsCommonGender( category:String)-> Bool?
     {
         var isCommon : Bool = true
         if (category == Category.Top.rawValue || category == Category.Bottom.rawValue || category == Category.Outfit.rawValue)
         {
             isCommon = false;
         }
         return isCommon;
     }
    
    var BodyPartCategory : [String] = ["Top","Bottom","Outfit","Footwear","Handwear"]
    
    public func IsBodyPartCategory( category:String)-> Bool?
    {
        var isPresent:Bool = false
        for item in BodyPartCategory
        {
            if (item == category)
            {
                isPresent = true
                break;
            }
        }
        return isPresent;
    }
    
    var BodywearCategory : [String] = ["Wristwear"]
    
    public func IsBodywearCategory( category:String)-> Bool?
    {
        var isPresent:Bool = false
        for item in BodywearCategory
        {
            if (item == category)
            {
                isPresent = true
                break;
            }
        }
        return isPresent;
    }
    //"FrontBodyTattoo",
    var BodyTattoCategory : [String] = [ "LeftHandTattoo","RightHandTattoo","LeftArmTattoo","RightArmTattoo","LeftFootTattoo","RightFootTattoo",
        "FrontLeftLegTattoo","FrontRightLegTattoo",  "BackBodyTattoo","FrontBodyTattoo",  "BackLeftLegTattoo", "BackRightLegTattoo","HeadTattoo"]
    
    public func IsBodyTattoCategory( category:String)-> Bool?
    {
        var isPresent:Bool = false
        for item in BodyTattoCategory
        {
            if (item == category)
            {
                isPresent = true
                break;
            }
        }
        return isPresent;
    }
    
    var HeadFaceWearCategory3D : [String] = [ "Hair","Facialhair","Headwear","Eyewear","Mouthwear","Earwear","Eyebrowswear","Facewear",  "Neckwear", "Nosewear"]
    public func IsHeadFaceWearCategory3D( category:String)-> Bool?
    {
        var isPresent:Bool = false
        for item in HeadFaceWearCategory3D
        {
            if (item == category)
            {
                isPresent = true
                break;
            }
        }
        return isPresent;
    }
    
    var HeadCat : [String] = [ "Hair","Facialhair","Headwear","Eyewear","Mouthwear","Earwear","Eyebrowswear","Facewear",  "Neckwear", "Nosewear", "Eyebrow","Eyeball","Lips","FaceShape", "EyeShape", "EyebrowShape", "NoseShape", "LipShape", "EarShape"]
    public func IsHeadCat( category:String)-> Bool?
    {
        var isPresent:Bool = false
        for item in HeadCat
        {
            if (item == category)
            {
                isPresent = true
                break;
            }
        }
        return isPresent;
    }
    
//    var inventoryItemList : [String] = [ "Avatar","Items"]
    var inventoryItemList : [String] = ["Avatars","All", "Top","Bottom","Outfit","Footwear","Handwear","Wristwear","LeftHandTattoo","RightHandTattoo","LeftArmTattoo","RightArmTattoo","LeftFootTattoo","RightFootTattoo",
                                                                "FrontLeftLegTattoo","FrontRightLegTattoo",  "BackBodyTattoo",  "BackLeftLegTattoo", "BackRightLegTattoo","HeadTattoo"]
    
    var inventoryItemList2 : [String] = [ "Top","Bottom","Outfit","Footwear","Handwear","Wristwear","LeftHandTattoo","RightHandTattoo","LeftArmTattoo","RightArmTattoo","LeftFootTattoo","RightFootTattoo",
                                                                "FrontLeftLegTattoo","FrontRightLegTattoo",  "BackBodyTattoo",  "BackLeftLegTattoo", "BackRightLegTattoo","HeadTattoo"]
    var HeadInventoryItemList : [String] = [ "All","SkinTone","Hair", "Eyebrow","Eyeball","Lips","Facialhair","Headwear","Eyewear","Mouthwear","Earwear","Eyebrowswear","Facewear",  "Neckwear", "Nosewear"]
    var HeadInventoryItemList2 : [String] = [ "SkinTone","Hair", "Eyebrow","Eyeball","Lips","Facialhair","Headwear","Eyewear","Mouthwear","Earwear","Eyebrowswear","Facewear",  "Neckwear", "Nosewear"]
    public func IsHeadInventoryCat( category:String)-> Bool?
    {
        var isPresent:Bool = false
        for item in HeadInventoryItemList
        {
            if (item == category)
            {
                isPresent = true
                break;
            }
        }
        return isPresent;
    }
    public func IsFullInventoryCat( category:String)-> Bool?
    {
        var isPresent:Bool = false
        for item in inventoryItemList
        {
            if (item == category)
            {
                isPresent = true
                break;
            }
        }
        return isPresent;
    }
    
    var HeadFaceWearCategory2D : [String] = ["SkinTone","Eyebrow","Eyeball","Lips"]
    public func IsHeadFaceWearCategory2D( category:String)-> Bool?
    {
        var isPresent:Bool = false
        for item in HeadFaceWearCategory2D
        {
            if (item == category)
            {
                isPresent = true
                break;
            }
        }
        return isPresent;
    }
    
    var BlendshapeCategory : [String] = ["FaceShape", "EyeShape", "EyebrowShape", "NoseShape", "LipShape", "EarShape"]
    public func IsBlendshapeCategory( category:String)-> Bool?
    {
        var isPresent:Bool = false
        for item in BlendshapeCategory
        {
            if (item == category)
            {
                isPresent = true
                break;
            }
        }
        return isPresent;
    }
}




struct BlendshapeData  : Codable
{
    var v:Float
    var k:String

    public init( val:Float, key :String) {
        self.v = val
        self.k = key
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case v = "v"
        case k = "k"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(v, forKey: .v)
        try container.encodeIfPresent(k, forKey: .k)
    }
};

struct BlendshapePatch : Codable
{
    public var Blendshapes :  [BlendshapeData] = []
}


struct PropBucketData : Codable
{
    public var ID :  String
    public var CoreBucket :  String
    public var TemplateID :  String
    public var ItemSkin :  String
    public var Config :  String
    public var ConflictingBuckets :  String
    public var Blendshapes :  String
    public var MainCatID :  String
}

struct ColorObj :Codable
{
    public var LipColor :  String
    public var FaceColor :  String
    public var HairColor :  String
    public var EyebrowColor :  String
    public var FacialHairColor :  String
}

struct FinalColor :Codable
{
    public var ColorMeta :  ColorObj = ColorObj(LipColor: "#FFFFFF", FaceColor: "#FFFFFF", HairColor: "#FFFFFF", EyebrowColor: "#FFFFFF", FacialHairColor: "#FFFFFF")
 
}
struct MeshData : Codable
{
    public var Platform : String=""
    public var MeshURL : String=""
}

struct ImageData : Codable
{
    public var Platform : String = ""
    public var ImageURL : String = ""
}

struct ImageResult: Codable
{
    public var Code: Int = 0
    public var Status: String = ""
    public var Data: ImageData = ImageData(Platform: "",ImageURL: "")
}

struct MeshResult: Codable
{
    public var Code: Int = 0
    public var Status: String = ""
    public var Data: MeshData = MeshData(Platform: "",MeshURL:  "")
}
