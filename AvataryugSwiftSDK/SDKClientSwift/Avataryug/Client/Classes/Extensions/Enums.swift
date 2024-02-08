import Foundation
///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
///Gender Enum
enum Gender:Int
{
    case Male = 1
    case Female = 2
}

///Used Platform in sdk
enum Platforms:Int
{
    case Android = 0
    case iOS = 1
    case Web = 2
    case Steam = 3
    case Meta = 4
    case Xbox = 5
    case Playstation = 6
    case Custom = 7
}

func GetPlatfrom() -> Platforms {
    let platform : Platforms = Platforms.iOS
    
    return platform
}

//Used Category
enum Category:String
{
    case Top = "Top"
    case Bottom = "Bottom"
    case Outfit = "Outfit"
    case Hair = "Hair"
    case Lips = "Lips"
    case Facialhair = "Facialhair"
    case Eyebrow = "Eyebrow"
    case Eyeball = "Eyeball"
    case Mouthwear = "Mouthwear"
    case Handwear = "Handwear"
    case Wristwear = "Wristwear"
    case Footwear = "Footwear"
    case Headwear = "Headwear"
    case Facewear = "Facewear"
    case Eyewear = "Eyewear"
    case Earwear = "Earwear"
    case Neckwear = "Neckwear"
    case Nosewear = "Nosewear"
    case Eyebrowswear = "Eyebrowswear"
    case FaceShape = "FaceShape"
    case NoseShape = "NoseShape"
    case LipShape = "LipShape"
    case EyeShape = "EyeShape"
    case EarShape = "EarShape"
    case EyebrowShape = "EyebrowShape"
    case HeadTattoo = "HeadTattoo"
    case FrontBodyTattoo = "FrontBodyTattoo"
    case BackBodyTattoo = "BackBodyTattoo"
    case RightArmTattoo = "RightArmTattoo"
    case LeftArmTattoo = "LeftArmTattoo"
    case RightHandTattoo = "RightHandTattoo"
    case LeftHandTattoo = "LeftHandTattoo"
    case FrontRightLegTattoo = "FrontRightLegTattoo"
    case BackRightLegTattoo = "BackRightLegTattoo"
    case FrontLeftLegTattoo = "FrontLeftLegTattoo"
    case BackLeftLegTattoo = "BackLeftLegTattoo"
    case RightFootTattoo = "RightFootTattoo"
    case LeftFootTattoo = "LeftFootTattoo"
    case SkinTone = "SkinTone"
}
