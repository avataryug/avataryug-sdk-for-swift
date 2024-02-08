import Foundation
///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
/// The "AdvertisingHandler" class is responsible for handling advertising operations.
/// It uses the "Base" class for making API calls.
/// The class provides three functions:
/// "GetAdsPlacement" retrieves a list of ad placements by ID,
/// "RecordAdsActivity" stores ads activity data for reporting, and
/// "GrantAdsReward" grants rewards for ads.
/// Each function takes callbacks for handling the response and error conditions.
public class AdvertisingHandler {
  var ApiBase: Base
  init(ApiBase: Base) {
    self.ApiBase = ApiBase
  }

  /// Retrieves a list of ad placements by ID
  func GetAdPlacementByID(completionHandler: @escaping (Result<GetAdPlacementByIDResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! GetAdPlacementByIDResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Stores ads activity data for reporting after ad watch
  func RecordAdsActivity(completionHandler: @escaping (Result<RecordAdsActivityResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! RecordAdsActivityResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }
  /// Grants rewards for ads.
  func GrantAdsReward(completionHandler: @escaping (Result<GrantAdsRewardResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! GrantAdsRewardResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

}

/// Retrieves a list of ad placements by ID
public class GetAdPlacementByID: Base {
  public var placementID: String

  init(placementID: String) {
    self.placementID = placementID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    AdvertisingAPI.getAdPlacementByID(placementID: placementID) { (response, error) in
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

/// Stores ads activity data for reporting after ad watch
class RecordAdsActivity: Base {
  public var revenueCurrency: String
  public var adRevenue: Int
  public var placementID: String

  init(revenueCurrency: String, adRevenue: Int, placementID: String) {
    self.revenueCurrency = revenueCurrency
    self.adRevenue = adRevenue
    self.placementID = placementID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let recordAdsActivityRequest = RecordAdsActivityRequest(
      placementID: placementID, revenueCurrency: revenueCurrency, adRevenue: adRevenue)
    AdvertisingAPI.recordAdsActivity(recordAdsActivityRequest: recordAdsActivityRequest) {
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

/// Grants rewards for ads.
public class GrantAdsReward: Base {
  public var placementID: String

  init(placementID: String) {
    self.placementID = placementID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let grantAdsRewardRequest = GrantAdsRewardRequest(placementID: placementID)
    AdvertisingAPI.grantAdsReward(grantAdsRewardRequest: grantAdsRewardRequest) {
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
