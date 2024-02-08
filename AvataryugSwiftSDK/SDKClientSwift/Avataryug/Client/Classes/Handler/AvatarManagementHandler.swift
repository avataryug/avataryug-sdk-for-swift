import Foundation
///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
/// The "AvatarManagementHandler" class is responsible for managing avatars and making API calls through the "Base" class.
/// It provides multiple function for creating, updating, and retrieving avatars related functionality.
class AvatarManagementHandler {
  var ApiBase: Base

  public init(ApiBase: Base) {
    self.ApiBase = ApiBase
  }

  /// Get all the clips by input status
  /// 0 = Draft,
  /// 1 = Active,
  /// 2 = Inactive,
  /// 3 = Expired
  func GetClips(completionHandler: @escaping (Result<GetClipsResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! GetClipsResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Creates missing avatars into the mentioned platform for the user
  /// Please refer to the documentation for more information on platform-related details.
  func SyncAvatars(completionHandler: @escaping (Result<SyncAvatarsResult, Error>) -> Void) {
    ApiBase.CallApi {
      response in
      switch response {
      case .success(let success):
        completionHandler(.success(success as! SyncAvatarsResult))
      case .failure(let failure):
        completionHandler(.failure(failure))
      }
    }
  }

  /// Get the specified clip's details by providing ClipID.
  func GetClipsByID(completionHandler: @escaping (Result<GetClipsByIDResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! GetClipsByIDResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Get the specified expression details by providing ExpressionID
  func GetExpressionByID(
    completionHandler: @escaping (Result<GetExpressionByIDResult, Error>) -> Void
  ) {
    ApiBase.CallApi {
      response in
      switch response {
      case .success(let success):
        completionHandler(.success(success as! GetExpressionByIDResult))
      case .failure(let failure):
        completionHandler(.failure(failure))
      }
    }
  }

  /// Retrieve all expressions based on the provided status.
  /// 0 = Draft,
  /// 1 = Active,
  /// 2 = Inactive,
  /// 3 = Expired
  func GetExpression(completionHandler: @escaping (Result<GetExpressionsResult, Error>) -> Void) {
    ApiBase.CallApi {
      response in
      switch response {
      case .success(let success):
        completionHandler(.success(success as! GetExpressionsResult))
      case .failure(let failure):
        completionHandler(.failure(failure))
      }
    }
  }

  /// Grant the selected avatar listed in the Avatar Preset by invoking the appropriate API.
  func GrantAvatarPresetToUser(
    completionHandler: @escaping (Result<GrantAvatarPresetToUserResult, Error>) -> Void
  ) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! GrantAvatarPresetToUserResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Get all avatar presets
  func GetAvatarPresets(
    completionHandler: @escaping (Result<GetAvatarPresetsResult, Error>) -> Void
  ) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! GetAvatarPresetsResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Retrive Avatar preset by ID
  func GetAvatarPresetsByID(
    completionHandler: @escaping (Result<GetAvatarPresetByIDResult, Error>) -> Void
  ) {
    ApiBase.CallApi(completionHandler: {
      (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! GetAvatarPresetByIDResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Grant the selected avatar and its associated items to the user's inventory.
  func GrantAvatarPresetItemsToUser(
    completionHandler: @escaping (Result<GrantAvatarPresetItemsToUserResult, Error>) -> Void
  ) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! GrantAvatarPresetItemsToUserResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Generates the 3D mesh as per the configuration in the Config panel.
  func GenerateAvatarMesh(
    completionHandler: @escaping (Result<GenerateAvatarMeshResult, Error>) -> Void
  ) {
    ApiBase.CallApi {
      response in
      switch response {
      case .success(let success):
        completionHandler(.success(success as! GenerateAvatarMeshResult))
      case .failure(let failure):
        completionHandler(.failure(failure))
      }
    }
  }

  /// Get vertices for all buckets.
  func GetGetallbucketvertices(
    completionHandler: @escaping (Result<GetAllBucketVerticesResult, Error>) -> Void
  ) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! GetAllBucketVerticesResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Utilize the specified API to render the image of the avatar associated with the provided avatar ID.
  /// This API is specifically designed to generate and retrieve the rendered image of the avatar.
  func RenderAvatarImage(
    completionHandler: @escaping (Result<RenderAvatarImageResult, Error>) -> Void
  ) {
    ApiBase.CallApi {
      response in
      switch response {
      case .success(let success):
        completionHandler(.success(success as! RenderAvatarImageResult))
      case .failure(let failure):
        completionHandler(.failure(failure))
      }
    }
  }

}

/// Get all avatar presets
class GetAvatarPresets: Base {
  public var status: AvatarManagementAPI.Status_getAvatarPresets
  public var gender: AvatarManagementAPI.Gender_getAvatarPresets

  init(
    status: AvatarManagementAPI.Status_getAvatarPresets,
    gender: AvatarManagementAPI.Gender_getAvatarPresets
  ) {
    self.status = status
    self.gender = gender
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    AvatarManagementAPI.getAvatarPresets(status: status, gender: gender) {
      (response, error) in
      guard error == nil else {
          if(ProjectSettings.shared.isDebug)
          {
              print(error!)
          }
        completionHandler(.failure(error!))
        return
      }
      do {
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}

/// Grant Avatar Preset Items To User
class GrantAvatarPresetItemsToUser: Base {
  public var itemIDs: [GrantAvatarPresetItemsToUserRequestItemIDsInner] = []

  init(itemID: [String]) {
    for item in itemID {
      itemIDs.append(GrantAvatarPresetItemsToUserRequestItemIDsInner(itemID: item))
    }
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let grantAvatarPresetItemsToUserRequest = GrantAvatarPresetItemsToUserRequest(itemIDs: itemIDs)

    AvatarManagementAPI.grantAvatarPresetItemsToUser(
      grantAvatarPresetItemsToUserRequest: grantAvatarPresetItemsToUserRequest
    ) { (response, error) in
      guard error == nil else {
          if(ProjectSettings.shared.isDebug)
          {
              print(error!)
          }
        completionHandler(.failure(error!))
        return
      }
      do {
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}

/// Retrive Avatar preset by ID
class GetAvatarPresetsByID: Base {
  public var avatarPresetID: String

  init(avatarPresetID: String) {
    self.avatarPresetID = avatarPresetID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    AvatarManagementAPI.getAvatarPresetsByID(avatarPresetID: avatarPresetID) { (response, error) in
      guard error == nil else {
          if(ProjectSettings.shared.isDebug)
          {
              print(error!)
          }
        completionHandler(.failure(error!))
        return
      }
      do {
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}

/// Grant Avatar Preset To User
class GrantAvatarPresetToUser: Base {

  public var AvatarData: String

  init(avatarData: String) {
    self.AvatarData = avatarData
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let grantAvatarPresetToUserRequest = GrantAvatarPresetToUserRequest(avatarData: AvatarData)
    AvatarManagementAPI.grantAvatarPresetToUser(
      grantAvatarPresetToUserRequest: grantAvatarPresetToUserRequest
    ) {
      (response, error) in
      guard error == nil else {
          if(ProjectSettings.shared.isDebug)
          {
              print(error!)
          }
        completionHandler(.failure(error!))
        return
      }
      do {
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}

/// Get all the clips by Active status
public class GetClips: Base {
  public var status: AvatarManagementAPI.Status_getClips

  init(status: AvatarManagementAPI.Status_getClips) {
    self.status = status
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    AvatarManagementAPI.getClips(status: status) {
      (response, error) in
      guard error == nil else {
          if(ProjectSettings.shared.isDebug)
          {
              print(error!)
          }
        completionHandler(.failure(error!))
        return
      }
      do {
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}

/// Get the specified clip's details by providing ClipID
public class GetClipsByID: Base {
  public var clipId: String

  init(clipId: String) {
    self.clipId = clipId
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    AvatarManagementAPI.getClipsByID(clipID: clipId) {
      (response, error) in
      guard error == nil else {
          if(ProjectSettings.shared.isDebug)
          {
              print(error!)
          }
        completionHandler(.failure(error!))
        return
      }
      do {
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}

/// Creates missing avatars into the mentioned platform for the user.
class SyncAvatars: Base {
  public var Platform: SyncAvatarsRequest.Platform
  public var Mesh: Bool
  public var Image: Bool

  init(Platform: SyncAvatarsRequest.Platform, Mesh: Bool, Image: Bool) {
    self.Platform = Platform
    self.Mesh = Mesh
    self.Image = Image
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let request = SyncAvatarsRequest(
      platform: SyncAvatarsRequest.Platform.ios, mesh: Mesh, image: Image)

    AvatarManagementAPI.syncAvatars(syncAvatarsRequest: request) {
      data, error in
      guard error == nil else {
          if(ProjectSettings.shared.isDebug)
          {
              print(error!)
          }
        completionHandler(.failure(error!))
        return
      }
      do {
        completionHandler(.success(data! as AnyObject))
      }
    }
  }
}

/// Get the specified expression details by providing ExpressionID.
public class GetExpressionByID: Base {
  public var expressionid: String

  init(expressionid: String) {
    self.expressionid = expressionid
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    AvatarManagementAPI.getExpressionByID(expressionID: expressionid) {
      (response, error) in
      guard error == nil else {
          if(ProjectSettings.shared.isDebug)
          {
              print(error!)
          }
        completionHandler(.failure(error!))
        return
      }
      do {
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}

/// Get all the active expressions
public class GetExpression: Base {
  public var status: AvatarManagementAPI.Status_getExpressions

  init(status: AvatarManagementAPI.Status_getExpressions) {
    self.status = status
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    AvatarManagementAPI.getExpressions(status: status) {
      (response, error) in
      guard error == nil else {
          if(ProjectSettings.shared.isDebug)
          {
              print(error!)
          }
        completionHandler(.failure(error!))
        return
      }
      do {
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}

/// Generates the 3D mesh as per the configuration in the Config panel
class GenerateAvatarMesh: Base {
  public var AvatarID: String
  public var Platform: GenerateAvatarMeshRequest.Platform

  init(_AvatarID: String, _Platform: GenerateAvatarMeshRequest.Platform) {
    self.AvatarID = _AvatarID
    self.Platform = _Platform 
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let request = GenerateAvatarMeshRequest(avatarID: AvatarID, platform: Platform)
    AvatarManagementAPI.generateAvatarMesh(generateAvatarMeshRequest: request) {
      (response, error) in
      guard error == nil else {
          if(ProjectSettings.shared.isDebug)
          {
              print(error!)
          }
        completionHandler(.failure(error!))
        return
      }
      do {
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}

/// Get vertices for all buckets
class GetGetallbucketvertices: Base {
  public var platform: AvatarManagementAPI.Platform_getGetallbucketvertices

  init(platform: AvatarManagementAPI.Platform_getGetallbucketvertices) {
    self.platform = platform
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    AvatarManagementAPI.getGetallbucketvertices(platform: platform) {
      (response, error) in
      guard error == nil else {
          if(ProjectSettings.shared.isDebug)
          {
              print(error!)
          }
        completionHandler(.failure(error!))
        return
      }
      do {
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}

/// Render Avatar Image
class RenderAvatarImage: Base {
  public var AvatarID: String
  public var Platform: RenderAvatarImageRequest.Platform

  init(_AvatarID: String, _Platform: RenderAvatarImageRequest.Platform) {
    self.AvatarID = _AvatarID
    self.Platform = _Platform
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let generaterequest = RenderAvatarImageRequest(avatarID: AvatarID, platform: Platform)
    AvatarManagementAPI.renderAvatarImage(renderAvatarImageRequest: generaterequest) {
      (response, error) in
      guard error == nil else {
          if(ProjectSettings.shared.isDebug)
          {
              print(error!)
          }
        completionHandler(.failure(error!))
        return
      }
      do {
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}
