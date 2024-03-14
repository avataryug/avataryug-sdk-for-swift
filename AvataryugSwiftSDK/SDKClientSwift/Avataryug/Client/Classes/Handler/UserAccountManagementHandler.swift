import Foundation
///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
/// The "UserAccountManagementHandle" class manages user account-related operations through the use of the "Base" class.
/// It provides a variety of functions for tasks such as
/// changing passwords, deleting user accounts, updating user demographics, verifying users with email, and more.
/// These functions utilize the "baseApiCall" instance to make API calls and handle responses and errors through callbacks.
class UserAccountManagementHandler {
  var ApiBase: Base
  public init(ApiBase: Base) {
    self.ApiBase = ApiBase
  }

    /// Allows users to change their password.
    func ChangePassword(completionHandler: @escaping (Result<ChangePasswordResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! ChangePasswordResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
    }

    /// Deletes a user account.
    func DeleteUser(completionHandler: @escaping (Result<DeleteUserResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! DeleteUserResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
    }

    /// Updates user demographic information.
    func UpdateUserDemographics(completionHandler: @escaping (Result<UpdateUserDemographicsResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! UpdateUserDemographicsResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
    }

    /// Verifies a user's email address.
    func VerifyUserWithEmail(completionHandler: @escaping (Result<VerifyUserWithEmailResult, Error>) -> Void) {
    ApiBase.CallApi { response in
      switch response {
      case .success(let result):
        completionHandler(.success(result as! VerifyUserWithEmailResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    }
    }

    /// Updates the user's email and password.
    func UpdateEmailPassword(completionHandler: @escaping (Result<UpdateEmailPasswordResult, Error>) -> Void) {
    ApiBase.CallApi { response in
      switch response {
      case .success(let result):
        completionHandler(.success(result as! UpdateEmailPasswordResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    }
    }

    /// Sends an account verification email to the user.
    func SendAccountVerificationEmail(completionHandler: @escaping (Result<SendAccountVerificationEmailResult, Error>) -> Void) {
    ApiBase.CallApi { response in
      switch response {
      case .success(let result):
        completionHandler(.success(result as! SendAccountVerificationEmailResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    }
    }

    /// Sends an account recovery email to the user.
    func SendAccountRecoveryEmail(completionHandler: @escaping (Result<SendAccountRecoveryEmailResult, Error>) -> Void) {
    ApiBase.CallApi {
      response in
      switch response {
      case .success(let success):
        completionHandler(.success(success as! SendAccountRecoveryEmailResult))
      case .failure(let failure):
        completionHandler(.failure(failure))
      }
    }
    }

    /// Adds an email and password to the user's account.
    func AddEmailPassword(completionHandler: @escaping (Result<AddEmailPasswordResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! AddEmailPasswordResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
    }

    /// Adds the specified generic service identifier to the user's Avataryug account.
    /// This is designed to allow for a Avataryug ID lookup of any arbitrary service identifier a Project wants to add.
    /// This identifier should never be used as authentication credentials, as the intent is that it is easily accessible by other users.
    func AddGenericServiceID(completionHandler: @escaping (Result<AddGenericServiceIDResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! AddGenericServiceIDResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
    }

    /// Retrieves information about the user's account.
    func GetUserAccountInfo(completionHandler: @escaping (Result<GetUserAccountInfoResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! GetUserAccountInfoResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
    }

    /// Retrieves the user's public profile information.
    func GetUserProfile(completionHandler: @escaping (Result<GetUserProfileResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! GetUserProfileResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
    }

    /// Links an Android device ID to the user's account.
    func LinkAndroidDeviceID(completionHandler: @escaping (Result<LinkAndroidDeviceIDResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! LinkAndroidDeviceIDResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
    }

    /// Links an Apple account to the user's account.
    func LinkApple(completionHandler: @escaping (Result<LinkAppleResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! LinkAppleResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
    }

    /// Links a custom ID to the user's account.
    func LinkCustomID(completionHandler: @escaping (Result<LinkCustomIDResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! LinkCustomIDResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
    }

    /// Links a Facebook account to the user's account.
    func LinkFacebookAccount(completionHandler: @escaping (Result<LinkFacebookAccountResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! LinkFacebookAccountResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
    }

    /// Links a Google account to the user's account.
    func LinkGoogleAccount(completionHandler: @escaping (Result<LinkGoogleAccountResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! LinkGoogleAccountResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
    }

    /// Links an iOS device ID to the user's account.
    func LinkIOSDeviceID(completionHandler: @escaping (Result<LinkIOSDeviceIDResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! LinkIOSDeviceIDResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
    }

    /// Removes a generic service ID from the user's account.
    func RemoveGenericServiceID(completionHandler: @escaping (Result<RemoveGenericServiceIDResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! RemoveGenericServiceIDResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
    }

    /// Unlinks an Android device ID from the user's account.
    func UnlinkAndroidDeviceID(completionHandler: @escaping (Result<UnlinkAndroidDeviceIDResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! UnlinkAndroidDeviceIDResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
    }

    /// Unlinks an Apple account from the user's account.
    func UnlinkApple(completionHandler: @escaping (Result<UnlinkAppleResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! UnlinkAppleResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
    }

    /// Unlinks a custom ID from the user's account.
    func UnlinkCustomID(completionHandler: @escaping (Result<UnlinkCustomIDResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! UnlinkCustomIDResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
    }
    
    /// Unlinks a Facebook account from the user's account.
    func UnlinkFacebookAccount(completionHandler: @escaping (Result<UnlinkFacebookAccountResult, Error>) -> Void) {
      ApiBase.CallApi(completionHandler: { (response) in
        switch response
        {
        case .success(let result):
          completionHandler(.success(result as! UnlinkFacebookAccountResult))
        case .failure(let error):
          completionHandler(.failure(error))
        }
      })
    }

    /// Unlinks a Google account from the user's account.
    func UnlinkGoogleAccount(completionHandler: @escaping (Result<UnlinkGoogleAccountResult, Error>) -> Void) {
      ApiBase.CallApi(completionHandler: { (response) in
        switch response
        {
        case .success(let result):
          completionHandler(.success(result as! UnlinkGoogleAccountResult))
        case .failure(let error):
          completionHandler(.failure(error))
        }
      })
    }

    /// Unlinks an iOS device ID from the user's account.
    func UnlinkIOSDeviceID(completionHandler: @escaping (Result<UnlinkIOSDeviceIDResult, Error>) -> Void) {
      ApiBase.CallApi(completionHandler: { (response) in
        switch response
        {
        case .success(let result):
          completionHandler(.success(result as! UnlinkIOSDeviceIDResult))
        case .failure(let error):
          completionHandler(.failure(error))
        }
      })
    }




    /// Updates the display name of the user in the project.
    func UpdateUserProjectDisplayName(completionHandler: @escaping (Result<UpdateUserProjectDisplayNameResult, Error>) -> Void) {
      ApiBase.CallApi(completionHandler: { (response) in
        switch response
        {
        case .success(let result):
          completionHandler(.success(result as! UpdateUserProjectDisplayNameResult))
        case .failure(let error):
          completionHandler(.failure(error))
        }
      })
    }

    /// Updates the default avatar ID for the user.
    func UpdateDefaultAvatarID(completionHandler: @escaping (Result<UpdateDefaultAvatarIDResult, Error>) -> Void) {
      ApiBase.CallApi(completionHandler: { (response) in
        switch response
        {
        case .success(let result):
          completionHandler(.success(result as! UpdateDefaultAvatarIDResult))
        case .failure(let error):
          completionHandler(.failure(error))
        }
      })
    }
 }

///Allows users to change their password.
class ChangePassword: Base {
  public var newPassword: String
  public var oldPassword: String
  init(oldPassword: String, newPassword: String) {
    self.oldPassword = oldPassword
    self.newPassword = newPassword
  }
  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let changePasswordRequest = ChangePasswordRequest(oldPassword: oldPassword, newPassword: newPassword)
    UserAccountManagementAPI.changePassword(changePasswordRequest: changePasswordRequest) {
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

/// Delete User Account from Avataryug platform.
class DeleteUser: Base {

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    UserAccountManagementAPI.deleteUser {
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

/// Updates user demographic information.
class UpdateUserDemographics: Base {
  public var gender: String
  public var ageRange: String
  public var race: String

  init(gender: String, ageRange: String, race: String) {
    self.gender = gender
    self.ageRange = ageRange
    self.race = race
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let updateUserDemographicsRequest = UpdateUserDemographicsRequest(gender: gender, ageRange: ageRange, race: race)
    UserAccountManagementAPI.updateUserDemographics(updateUserDemographicsRequest: updateUserDemographicsRequest) {
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

/// Verifies user account status to email verified once email verification is done
class VerifyUserWithEmail: Base {
  public var userID: String
  public var verificationCode: String
  init(userID: String, verificationCode: String) {
    self.userID = userID
    self.verificationCode = verificationCode
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let verifyuserWithEmailReq = VerifyUserWithEmailRequest(userID: userID, verificationCode: verificationCode)
    UserAccountManagementAPI.verifyUserWithEmail(verifyUserWithEmailRequest: verifyuserWithEmailReq) {
      response, error in
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

/// Updates the user's email and password.
class UpdateEmailPassword: Base {
  public var emailID: String
  public var password: String
  public var verificationCode: String

  init(emailID: String, password: String, verificationCode: String) {
    self.emailID = emailID
    self.password = password
    self.verificationCode = verificationCode
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let updateEmailReq = UpdateEmailPasswordRequest( emailID: emailID, password: password, verificationCode: verificationCode)
    UserAccountManagementAPI.updateEmailPassword(updateEmailPasswordRequest: updateEmailReq) {
      response, error in
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

/// Sends an account verification email to the user.
class SendAccountVerificationEmail: Base {
  public var emailID: String

  init(emailID: String) {
    self.emailID = emailID
  }
  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let sendAccountVerifyReq = SendAccountVerificationEmailRequest(emailID: emailID)
    UserAccountManagementAPI.sendAccountVerificationEmail(sendAccountVerificationEmailRequest: sendAccountVerifyReq) {
      response, error in
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

/// Sends an account recovery email to the user.
class SendAccountRecoveryEmail: Base {
  public var emailID: String

  init(emailID: String) {
    self.emailID = emailID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let auth = SendAccountRecoveryEmailRequset(emailID: emailID)
    UserAccountManagementAPI.sendAccountRecoveryEmail(sendAccountRecoveryEmailRequset: auth) {
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

/// Adds an email and password to the user's account.
class AddEmailPassword: Base {
  public var emailID: String
  public var password: String

  init(emailID: String, password: String) {
    self.emailID = emailID
    self.password = password
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let addEmailPasswordRequest = AddEmailPasswordRequest(emailID: emailID, password: password)
    UserAccountManagementAPI.addEmailPassword(addEmailPasswordRequest: addEmailPasswordRequest) {
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

/// Adds the specified generic service identifier to the user's Avataryug account.
/// This is designed to allow for a Avataryug ID lookup of any arbitrary service identifier a Project wants to add.
/// This identifier should never be used as authentication credentials, as the intent is that it is easily accessible by other users.
class AddGenericServiceID: Base {
  public var genericServiceID: String

  init(genericServiceID: String) {
    self.genericServiceID = genericServiceID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let addGenericServiceIDRequest = AddGenericServiceIDRequest(genericServiceID: genericServiceID)
    UserAccountManagementAPI.addGenericServiceID(addGenericServiceIDRequest: addGenericServiceIDRequest) {
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

/// Retrieves information about the user's account.
class GetUserAccountInfo: Base {

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    UserAccountManagementAPI.getUserAccountInfo {
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

/// Retrieves the user's public profile information.
class GetUserProfile: Base {
  public var userID: String

  init(userID: String) {
    self.userID = userID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    UserAccountManagementAPI.getUserProfile(userID: userID) {
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

/// Links the Android device identifier to the user's Avataryug account
class LinkAndroidDeviceID: Base {
  public var androidDeviceID: String
  public var forceLink: Bool
  init(androidDeviceID: String, forceLink: Bool) {
    self.androidDeviceID = androidDeviceID
    self.forceLink = forceLink
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let linkAndroidDeviceIDRequest = LinkAndroidDeviceIDRequest(forceLink: forceLink, androidDeviceID: androidDeviceID)
    UserAccountManagementAPI.linkAndroidDeviceID( linkAndroidDeviceIDRequest: linkAndroidDeviceIDRequest) {
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

/// Links the Apple account associated with the token to the user's Avataryug account.
class LinkApple: Base {
  public var appleID: String
  public var forceLink: Bool
  public var identityToken: String
  init(appleID: String, forceLink: Bool, identityToken: String) {
    self.appleID = appleID
    self.forceLink = forceLink
    self.identityToken = identityToken
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let linkAppleRequest = LinkAppleRequest(forceLink: forceLink, appleID: appleID)
    UserAccountManagementAPI.linkApple(linkAppleRequest: linkAppleRequest) {
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

/// Links the custom identifier, generated by the Project, to the user's Avataryug account
class LinkCustomID: Base {
  public var customID: String
  public var forceLink: Bool
  init(customID: String, forceLink: Bool) {
    self.customID = customID
    self.forceLink = forceLink
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let linkCustomIDRequest = LinkCustomIDRequest(forceLink: forceLink, customID: customID)
    UserAccountManagementAPI.linkCustomID(linkCustomIDRequest: linkCustomIDRequest) {
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
/// Links the Facebook account associated with the provided Facebook access token to the user's Avataryug account
class LinkFacebookAccount: Base {
  public var accessToken: String
  public var facebookID: String
  public var forceLink: Bool
  init(accessToken: String, forceLink: Bool, facebookID: String) {
    self.forceLink = forceLink
    self.accessToken = accessToken
    self.facebookID = facebookID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let linkFacebookAccountRequest = LinkFacebookAccountRequest(forceLink: forceLink, accessToken: accessToken, facebookID: facebookID)
    UserAccountManagementAPI.linkFacebookAccount( linkFacebookAccountRequest: linkFacebookAccountRequest) {
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

/// Links the currently signed-in user account to their Google account, using their Google account credentials
class LinkGoogleAccount: Base {
  public var googleID: String
  public var googleServerAuthCode: String
  public var forceLink: Bool
  init(googleID: String, forceLink: Bool, googleServerAuthCode: String) {
    self.forceLink = forceLink
    self.googleID = googleID
    self.googleServerAuthCode = googleServerAuthCode
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let linkGoogleAccountRequest = LinkGoogleAccountRequest(forceLink: forceLink, googleID: googleID, googleServerAuthCode: googleServerAuthCode)
    UserAccountManagementAPI.linkGoogleAccount(linkGoogleAccountRequest: linkGoogleAccountRequest) {
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

/// Links the vendor-specific iOS device identifier to the user's Avataryug account
class LinkIOSDeviceID: Base {
  public var deviceID: String
  public var forceLink: Bool
  init(deviceID: String, forceLink: Bool) {
    self.forceLink = forceLink
    self.deviceID = deviceID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let linkIOSDeviceIDRequest = LinkIOSDeviceIDRequest(forceLink: forceLink, deviceID: deviceID)
    UserAccountManagementAPI.linkIOSDeviceID(linkIOSDeviceIDRequest: linkIOSDeviceIDRequest) {
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

/// Removes the generic service identifier from the user's Avataryug account.
class RemoveGenericServiceID: Base {
  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    UserAccountManagementAPI.removeGenericServiceID {
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

/// Unlinks the related Android device identifier from the user's Avataryug account
class UnlinkAndroidDeviceID: Base {
  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    UserAccountManagementAPI.unlinkAndroidDeviceID { (response, error) in
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
/// Unlinks the related Apple account from the user's Avataryug account.
class UnlinkApple: Base {
  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    UserAccountManagementAPI.unlinkApple { (response, error) in
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

/// Unlinks the related custom identifier from the user's Avataryug account
class UnlinkCustomID: Base {
  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    UserAccountManagementAPI.unlinkCustomID { (response, error) in
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

/// Unlinks the related Facebook account from the user's Avataryug account
class UnlinkFacebookAccount: Base {
  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    UserAccountManagementAPI.unlinkFacebookAccount {
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

/// Unlinks the related Google account from the user's Avataryug account
class UnlinkGoogleAccount: Base {
  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    UserAccountManagementAPI.unlinkGoogleAccount {
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

/// Unlinks the related iOS device identifier from the user's Avataryug account
class UnlinkIOSDeviceID: Base {
  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    UserAccountManagementAPI.unlinkIOSDeviceID {
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

/// Updates the display name for the user in the project
class UpdateUserProjectDisplayName: Base {
  public var displayName: String

  init(displayName: String) {
    self.displayName = displayName
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let updateUserProjectDisplayNameRequest = UpdateUserProjectDisplayNameRequest(displayName: displayName)
    UserAccountManagementAPI.updateUserProjectDisplayName(updateUserProjectDisplayNameRequest: updateUserProjectDisplayNameRequest) {
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

/// Sets the default avatar ID to users account
class UpdateDefaultAvatarID: Base {
  public var defualtAvatarID: String

  init(defualtAvatarID: String) {
    self.defualtAvatarID = defualtAvatarID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let request = UpdateDefaultAvatarIDRequest(defaultAvatarID: defualtAvatarID)
    UserAccountManagementAPI.updateDefaultAvatarID(updateDefaultAvatarIDRequest: request) {
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
