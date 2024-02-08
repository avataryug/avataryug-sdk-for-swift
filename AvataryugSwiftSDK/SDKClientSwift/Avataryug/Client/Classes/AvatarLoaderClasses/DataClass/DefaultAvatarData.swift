import Foundation
import SceneKit

///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
struct BodywearPointDetail
{
    var PointName:String = "";
    var BoneName :String = "";
    var Position : SCNVector3 = SCNVector3(0,0,0);
    var Rotation : SCNVector3 = SCNVector3(0,0,0);
};

struct ConflictNames : Codable,Hashable
{
    var name : String!
}

public class  DefaultAvatarData
{
    static let shared = DefaultAvatarData()
    init(){
        
    }
    
     func GetBodyLodalPointList() -> [BodywearPointDetail]
    {
        var bodyPoints: [BodywearPointDetail] = []
        
        var bodyPoint: BodywearPointDetail = BodywearPointDetail()
        
        bodyPoint.PointName = "upperbody_back";
        bodyPoint.BoneName = "Spine2" ;
        bodyPoint.Position = SCNVector3(0,0,0);
        bodyPoint.Rotation = SCNVector3(0, 0, 0);
        bodyPoints.append(bodyPoint);
        
        bodyPoint.BoneName = "LeftShoulder";
        bodyPoint.PointName = "upperboddy_shoulder_left" ;
        bodyPoint.Position = SCNVector3(0,0,0);
        bodyPoint.Rotation = SCNVector3(0, 0, 0);
        bodyPoints.append(bodyPoint);
        
        bodyPoint.BoneName = "LeftArm";
        bodyPoint.PointName = "upperbody_arm_left" ;
        bodyPoint.Position = SCNVector3(0,0,0);
        bodyPoint.Rotation = SCNVector3(0, 0, 0);
        bodyPoints.append(bodyPoint);

        bodyPoint.BoneName = "LeftForeArm";
        bodyPoint.PointName = "upperbody_forearm_left" ;
        bodyPoint.Position = SCNVector3(0,0,0);
        bodyPoint.Rotation = SCNVector3(0, 0, 0);
        bodyPoints.append(bodyPoint);
        
        bodyPoint.BoneName = "LeftForeArm";
        bodyPoint.PointName = "upperbody_wrist_left" ;
        bodyPoint.Position = SCNVector3(0,0.24,0);
        bodyPoint.Rotation = SCNVector3( 36.034477, 75.344826,51.896538);

        bodyPoints.append(bodyPoint);
        
        bodyPoint.BoneName = "RightShoulder";
        bodyPoint.PointName = "upperboddy_shoulder_right" ;
        bodyPoint.Position = SCNVector3(0,0,0);
        bodyPoint.Rotation = SCNVector3(0, 0, 0);
        bodyPoints.append(bodyPoint);

        bodyPoint.BoneName = "RightArm";
        bodyPoint.PointName = "upperbody_arm_right" ;
        bodyPoint.Position = SCNVector3(0,0,0);
        bodyPoint.Rotation = SCNVector3(0, 0, 0);
        bodyPoints.append(bodyPoint);

        bodyPoint.BoneName = "RightForeArm";
        bodyPoint.PointName = "upperbody_forearm_right" ;
        bodyPoint.Position = SCNVector3(0,0,0);
        bodyPoint.Rotation = SCNVector3(0, 0, 0);
        bodyPoints.append(bodyPoint);
    
        bodyPoint.BoneName = "RightForeArm";
        bodyPoint.PointName = "upperbody_wrist_right" ;
        bodyPoint.Position = SCNVector3(0,0,0);
        bodyPoint.Rotation = SCNVector3(0, 0, 0);
        bodyPoints.append(bodyPoint);
        
        bodyPoint.BoneName = "LeftUpLeg";
        bodyPoint.PointName = "lowerbody_thigh_left" ;
        bodyPoint.Position = SCNVector3(0,0,0);
        bodyPoint.Rotation = SCNVector3(0, 0, 0);
        bodyPoints.append(bodyPoint);

        bodyPoint.BoneName = "LeftLeg";
        bodyPoint.PointName = "lowerbody_knee_left" ;
        bodyPoint.Position = SCNVector3(0,0,0);
        bodyPoint.Rotation = SCNVector3(0, 0, 0);
        bodyPoints.append(bodyPoint);

        bodyPoint.BoneName = "LeftLeg";
        bodyPoint.PointName = "lowerbody_leg_left" ;
        bodyPoint.Position = SCNVector3(0,0,0);
        bodyPoint.Rotation = SCNVector3(0, 0, 0);
        bodyPoints.append(bodyPoint);
        
        bodyPoint.BoneName = "RightUpLeg";
        bodyPoint.PointName = "lowerbody_thigh_right" ;
        bodyPoint.Position = SCNVector3(0,0,0);
        bodyPoint.Rotation = SCNVector3(0, 0, 0);
        bodyPoints.append(bodyPoint);

        bodyPoint.BoneName = "RightLeg";
        bodyPoint.BoneName = "lowerbody_knee_right" ;
        bodyPoint.Position = SCNVector3(0,0,0);
        bodyPoint.Rotation = SCNVector3(0, 0, 0);
        bodyPoints.append(bodyPoint);

        bodyPoint.BoneName = "RightLeg";
        bodyPoint.PointName = "lowerbody_leg_right" ;
        bodyPoint.Position = SCNVector3(0,0,0);
        bodyPoint.Rotation = SCNVector3(0, 0, 0);
        bodyPoints.append(bodyPoint);
        
        return bodyPoints;
    }
    
    func GetDefaultModelList(gender:String)->[ModelData]
    {
        var modeldataList : [ModelData] = []

        var modelData : ModelData = ModelData(DisplayID: "", DisplayName: "", MainCatID: "", GlbPath: "", GlbPathOffline: "", CoreBucket: "", ConflictingBuckets: "")
        

        if(gender == "2")
        {
            modelData.MainCatID = "Top";
            modelData.CoreBucket = "upperbody_sleeve_short";
            modelData.GlbPath = "https://avataryug.b-cdn.net/standard/female_standard_top.glb"
            modelData.GlbPathOffline =  "female_standard_top.glb"
            modelData.ConflictingBuckets = "[{\"name\":\"upperbody_shoulder_left\"},{\"name\":\"upperbody_sleeveless\"},{\"name\":\"upperbody_arm_right\"},{\"name\":\"upperbody_shoulder_both\"},{\"name\":\"upperbody_back\"},{\"name\":\"upperbody_sleeve_full\"},{\"name\":\"upperbody_arm_left\"},{\"name\":\"upperbody_wrist_both\"},{\"name\":\"upperbody_arm_both\"},{\"name\":\"upperbody_stomach\"},{\"name\":\"upperbody_hand_right\"},{\"name\":\"upperbody_shoulder_right\"},{\"name\":\"upperbody_wrist_right\"},{\"name\":\"upperbody_forearm_right\"},{\"name\":\"upperbody_forearm_both\"},{\"name\":\"upperbody_forearm_left\"},{\"name\":\"upperbody_wrist_left\"},{\"name\":\"upperbody_chest\"},{\"name\":\"upperbody_sleeve_short\"},{\"name\":\"upperbody_hand_left\"},{\"name\":\"upperbody_front\"},{\"name\":\"fullbody_without_foot\"},{\"name\":\"fullbody_with_head_foot\"},{\"name\":\"fullbody_without_head\"},{\"name\":\"fullbody_without_head_foot\"}]";
          
            modeldataList.append(modelData);

            modelData.MainCatID = "Bottom";
            modelData.CoreBucket = "lowerbody_without_foot";
            modelData.GlbPath = "https://avataryug.b-cdn.net/standard/female_standard_bottom.glb";
            modelData.GlbPathOffline = "female_standard_bottom.glb";
            modelData.ConflictingBuckets = "[{\"name\":\"lowerbody_foot_right\"},{\"name\":\"lowerbody_knee_right\"},{\"name\":\"lowerbody_without_foot\"},{\"name\":\"lowerbody_leg_both\"},{\"name\":\"lowerbody_knee_left\"},{\"name\":\"lowerbody_foot_left\"},{\"name\":\"lowerbody_leg_left\"},{\"name\":\"lowerbody_knee_both\"},{\"name\":\"lowerbody_leg_right\"},{\"name\":\"lowerbody_till_knee\"},{\"name\":\"lowerbody_thigh_both\"},{\"name\":\"lowerbody_thigh_right\"},{\"name\":\"lowerbody_thigh_left\"},{\"name\":\"fullbody_without_foot\"},{\"name\":\"fullbody_with_head_foot\"},{\"name\":\"fullbody_without_head\"},{\"name\":\"fullbody_without_head_foot\"}]";
            modeldataList.append(modelData);

            modelData.MainCatID = "Footwear";
            modelData.CoreBucket = "lowerbody_foot_both";
            modelData.GlbPathOffline =  "standard_footwear.glb"
            modelData.GlbPath =  "https://avataryug.b-cdn.net/standard/standard_footwear.glb";
            modelData.ConflictingBuckets = "[{\"name\":\"lowerbody_foot_both\"}]";
            modeldataList.append(modelData);

            modelData.MainCatID = "Handwear";
            modelData.CoreBucket = "upperbody_hand_both";
            modelData.GlbPathOffline =  "standard_hand.glb"
            modelData.GlbPath =   "https://avataryug.b-cdn.net/standard/standard_hand.glb";
            modelData.ConflictingBuckets = "[{\"name\":\"upperbody_hand_both\"}]";
            modeldataList.append(modelData);
        }
        else
        {
            modelData.MainCatID = "Top";
            modelData.CoreBucket = "upperbody_sleeve_short";
            modelData.GlbPath =  "https://avataryug.b-cdn.net/standard/male_standard_top.glb";
            modelData.GlbPathOffline =  "male_standard_top.glb"
            modelData.ConflictingBuckets = "[{\"name\":\"upperbody_shoulder_left\"},{\"name\":\"upperbody_sleeveless\"},{\"name\":\"upperbody_arm_right\"},{\"name\":\"upperbody_shoulder_both\"},{\"name\":\"upperbody_back\"},{\"name\":\"upperbody_sleeve_full\"},{\"name\":\"upperbody_arm_left\"},{\"name\":\"upperbody_wrist_both\"},{\"name\":\"upperbody_arm_both\"},{\"name\":\"upperbody_stomach\"},{\"name\":\"upperbody_hand_right\"},{\"name\":\"upperbody_shoulder_right\"},{\"name\":\"upperbody_wrist_right\"},{\"name\":\"upperbody_forearm_right\"},{\"name\":\"upperbody_forearm_both\"},{\"name\":\"upperbody_forearm_left\"},{\"name\":\"upperbody_wrist_left\"},{\"name\":\"upperbody_chest\"},{\"name\":\"upperbody_sleeve_short\"},{\"name\":\"upperbody_hand_left\"},{\"name\":\"upperbody_front\"},{\"name\":\"fullbody_without_foot\"},{\"name\":\"fullbody_with_head_foot\"},{\"name\":\"fullbody_without_head\"},{\"name\":\"fullbody_without_head_foot\"}]";
            modeldataList.append(modelData);

            modelData.MainCatID = "Bottom";
            modelData.CoreBucket = "lowerbody_without_foot";
            modelData.GlbPathOffline =  "male_standard_bottom.glb"
            modelData.GlbPath = "https://avataryug.b-cdn.net/standard/male_standard_bottom.glb";
            modelData.ConflictingBuckets = "[{\"name\":\"lowerbody_foot_right\"},{\"name\":\"lowerbody_knee_right\"},{\"name\":\"lowerbody_without_foot\"},{\"name\":\"lowerbody_leg_both\"},{\"name\":\"lowerbody_knee_left\"},{\"name\":\"lowerbody_foot_left\"},{\"name\":\"lowerbody_leg_left\"},{\"name\":\"lowerbody_knee_both\"},{\"name\":\"lowerbody_leg_right\"},{\"name\":\"lowerbody_till_knee\"},{\"name\":\"lowerbody_thigh_both\"},{\"name\":\"lowerbody_thigh_right\"},{\"name\":\"lowerbody_thigh_left\"},{\"name\":\"fullbody_without_foot\"},{\"name\":\"fullbody_with_head_foot\",{\"name\":\"fullbody_without_head\"},{\"name\":\"fullbody_without_head_foot\"}]";
            modeldataList.append(modelData);

            modelData.MainCatID = "Footwear";
            modelData.CoreBucket = "lowerbody_foot_both";
            modelData.GlbPathOffline =  "standard_footwear.glb"
            modelData.GlbPath =  "https://avataryug.b-cdn.net/standard/standard_footwear.glb";
            modelData.ConflictingBuckets = "[{\"name\":\"lowerbody_foot_both\"}]";
            modeldataList.append(modelData);

            modelData.MainCatID = "Handwear";
            modelData.CoreBucket = "upperbody_hand_both";
            modelData.GlbPathOffline =  "standard_hand.glb"
            modelData.GlbPath =   "https://avataryug.b-cdn.net/standard/standard_hand.glb";
            modelData.ConflictingBuckets = "[{\"name\":\"upperbody_hand_both\"}]";
            modeldataList.append(modelData);
        }
        return modeldataList
    }
}
