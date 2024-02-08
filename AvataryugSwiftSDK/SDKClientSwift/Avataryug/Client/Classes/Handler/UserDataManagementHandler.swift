import Foundation
///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
/// The code defines a class called "UserDataManagementHandler" with constructors and a method for updating user data function.
/// The class uses a "Base" object to make an API call and provides callbacks for handling the result or any errors.
class UserDataManagementHandler {
  var ApiBase: Base
  public init(ApiBase: Base) {
    self.ApiBase = ApiBase
  }

  /// Increments the user's balance of the specified virtual currency by the stated amount
  func AddVirtualCurrencyToUser(completionHandler: @escaping (Result<AddVirtualCurrencyToUserResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! AddVirtualCurrencyToUserResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Add Avatar to the user
  func AddUserAvatar(completionHandler: @escaping (Result<AddUserAvatarResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! AddUserAvatarResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Consume uses of a consumable item. When all uses are consumed, it will be removed from the user's inventory.
  func ConsumeInstance(completionHandler: @escaping (Result<ConsumeInstanceResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! ConsumeInstanceResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Retrieves the user's current inventory of virtual goods
  func GetUserInventory(completionHandler: @escaping (Result<GetUserInventoryResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! GetUserInventoryResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Adds the specified items to the specified user's inventory
  func GrantInstanceToUser(completionHandler: @escaping (Result<GrantInstanceToUserResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! GrantInstanceToUserResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Buys a single item with virtual currency. You must specify both the virtual currency to use to purchase,
  /// as well as what the client believes the price to be. This lets the server fail the purchase if the price has changed.
  func PurchaseInstance(completionHandler: @escaping (Result<String, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(_):
        completionHandler(.success(""))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Decrements the user's balance of the specified virtual currency by the stated amount. It is possible to make a VC balance negative with this API.
  func SubtractUserVirtualCurrency(completionHandler: @escaping (Result<String, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result.description!.stringValue))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Delete specified Avatar for the user
  func DeleteUserAvatar(completionHandler: @escaping (Result<DeleteUserAvatarResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! DeleteUserAvatarResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Update Avatar for the user
  func UpdateUserAvatar(completionHandler: @escaping (Result<UpdateUserAvatarResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! UpdateUserAvatarResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Lists all of the avatars that belong to a specific user
  func GetUsersAllAvatars(completionHandler: @escaping (Result<GetUsersAllAvatarsResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! GetUsersAllAvatarsResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Opens the specified container, with the specified key (when required),
  /// and returns the contents of the opened container.
  /// If the container (and key when relevant) are consumable (RemainingUses > 0),
  /// their RemainingUses will be decremented, consistent with the operation of ConsumeItem.
  func UnlockContainerInstance(completionHandler: @escaping (Result<UnlockContainerInstanceResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! UnlockContainerInstanceResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }
}

/// Lists all of the avatars that belong to a specific user
class GetUsersAllAvatars: Base {
  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    UserDataManagementAPI.getUsersAllAvatars {
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

/// Add Avatar to the user
class AddUserAvatar: Base {
  public var avatarData: String

  init(avatarData: String) {
    self.avatarData = avatarData
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let addUserAvatarRequest = AddUserAvatarRequest(avatarData: avatarData)
    UserDataManagementAPI.addUserAvatar(addUserAvatarRequest: addUserAvatarRequest) {
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

/// Update Avatar for the user
class UpdateUserAvatar: Base {
  public var avatarID: String
  public var avatardata: String

  init(avatarID: String, avatardata: String) {
    self.avatarID = avatarID
    self.avatardata = avatardata
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let updateUserAvatarRequest = UpdateUserAvatarRequest(avatarID: avatarID, avatarData: avatardata)
    UserDataManagementAPI.updateUserAvatar(updateUserAvatarRequest: updateUserAvatarRequest) {
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

/// Delete specified Avatar for the user
class DeleteUserAvatar: Base {
  public var avatarID: String

  init(avatarID: String) {
    self.avatarID = avatarID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    UserDataManagementAPI.deleteUserAvatar(avatarID: avatarID) {
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

/// Increments the user's balance of the specified virtual currency by the stated amount
class AddVirtualCurrencyToUser: Base {

  public var virtualCurrency: String
  public var amount: Int
  init(virtualCurrency: String, amount: Int) {

    self.amount = amount
    self.virtualCurrency = virtualCurrency
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let addVirtualCurrencyToUserRequest = AddVirtualCurrencyToUserRequest(virtualCurrency: virtualCurrency, amount: amount)
    UserDataManagementAPI.addVirtualCurrencyToUser(
      addVirtualCurrencyToUserRequest: addVirtualCurrencyToUserRequest
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

/// Consume uses of a consumable item. When all uses are consumed, it will be removed from the user's inventory.
class ConsumeInstance: Base {

  public var ID: String
  public var instanceCount: Int

  init(instanceCount: Int, ID: String) {
    self.instanceCount = instanceCount
    self.ID = ID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let consumeInstanceRequest = ConsumeInstanceRequest(instanceID: ID, instanceCount: instanceCount)
    UserDataManagementAPI.consumeInstance(consumeInstanceRequest: consumeInstanceRequest) {
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

/// Opens the specified container, with the specified key (when required), and returns the contents of the opened container.
/// If the container (and key when relevant) are consumable (RemainingUses > 0), their RemainingUses will be decremented, consistent with the operation of ConsumeItem.
class UnlockContainerInstance: Base {

  public var containerInstanceID: String
  public var keyInstanceID: String
  init(containerInstanceID: String, keyInstanceID: String) {
    self.containerInstanceID = containerInstanceID
    self.keyInstanceID = keyInstanceID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let unlockContainerInstanceRequest = UnlockContainerInstanceRequest(containerInstanceID: containerInstanceID, keyInstanceID: keyInstanceID)
    UserDataManagementAPI.unlockContainerInstance(unlockContainerInstanceRequest: unlockContainerInstanceRequest) {
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

/// Retrieves the user's current inventory of virtual goods
class GetUserInventory: Base {

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    UserDataManagementAPI.getUserInventory {
      (
        response, error
      ) in
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

/// Adds the specified items to the specified user's inventory
class GrantInstanceToUser: Base {

  public var instanceIds: [GrantInstanceToUserRequestInstanceIDsInner]?

  init(instanceIds: [GrantInstanceToUserRequestInstanceIDsInner]) {
    self.instanceIds = instanceIds
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let grantInstanceToUserRequest = GrantInstanceToUserRequest(instanceIDs: instanceIds)
    UserDataManagementAPI.grantInstanceToUser(grantInstanceToUserRequest: grantInstanceToUserRequest) {
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

/// Buys a single item with virtual currency.
/// You must specify both the virtual currency to use to purchase, as well as what the client believes the price to be.
/// This lets the server fail the purchase if the price has changed.
class PurchaseInstance: Base {
  public var instanceID: String
  public var instanceType: PurchaseInstanceRequest.InstanceType
  public var virtualCurrency: String
  public var storeid: String
  public var price: Int

  init(
    instanceID: String, instanceType: PurchaseInstanceRequest.InstanceType, virtualCurrency: String,
    prices: Int, storeid: String
  ) {
    self.instanceID = instanceID
    self.instanceType = instanceType
    self.virtualCurrency = virtualCurrency
    self.price = prices
    self.storeid = storeid
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let request = PurchaseInstanceRequest(instanceID: instanceID, instanceType: instanceType, price: price, virtualCurrency: virtualCurrency)
    UserDataManagementAPI.purchaseInstance(purchaseInstanceRequest: request) {
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

/// Decrements the user's balance of the specified virtual currency by the stated amount.
/// It is possible to make a VC balance negative with this API.
class SubtractUserVirtualCurrency: Base {

  public var virtualCurrency: String
  public var amount: Int

  init(virtualCurrency: String, amount: Int) {
    self.amount = amount
    self.virtualCurrency = virtualCurrency
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let subtractUserVirtualCurrencyRequest = SubtractUserVirtualCurrencyRequest(virtualCurrency: virtualCurrency, amount: amount)
    UserDataManagementAPI.subtractUserVirtualCurrency(subtractUserVirtualCurrencyRequest: subtractUserVirtualCurrencyRequest) {
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

/// Creates an order for a list of items that needs to be purchased
class StartPurchase: Base {

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    UserDataManagementAPI.startPurchase {
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

/// Retrieves a purchase along with its current Avataryug status.
/// Returns inventory items from the purchase that are still active.
class GetPurchase: Base {

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    UserDataManagementAPI.getPurchase {
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

/// Confirms with the payment provider that the purchase was approved (if applicable) and adjusts inventory and virtual currency balances as appropriate
class ConfirmPurchase: Base {
  public var TransactionID: String

  init(TransactionID: String) {
    self.TransactionID = TransactionID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let request = ConfirmPurchaseRequest(transactionID: TransactionID)
    UserDataManagementAPI.confirmPurchase(confirmPurchaseRequest: request) {
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
