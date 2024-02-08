import Foundation
///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
/// The "AuthenticateHandler" class facilitates authentication operations by utilizing the "Base" class for API calls.
/// It offers multiple functions for various authentication scenarios,
/// These functions accept callback parameters to handle response and error conditions.
/// By leveraging the "baseApiCall" instance, the class ensures appropriate API calls are made and callbacks are invoked accordingly.
class AuthenticateHandler {
  var ApiBase: Base
  public init(ApiBase: Base) {
    self.ApiBase = ApiBase
  }

  /// Signs the user in using a custom unique identifier, which can be a combination of strings, integers, numbers, and symbols.
  func LoginWithCustomID(
    completionHandler: @escaping (Result<LoginWithCustomIDResult, Error>) -> Void
  ) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! LoginWithCustomIDResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Register user with email id.
  func RegisterUser(completionHandler: @escaping (Result<RegisterUserResult, Error>) -> Void) {
    ApiBase.CallApi {
      response in
      switch response {
      case .success(let success):
        completionHandler(.success(success as! RegisterUserResult))
      case .failure(let failure):
        completionHandler(.failure(failure))
      }
    }
  }

  /// Signs the user into the Avataryug account.
  func LoginWithEmailAddress(
    completionHandler: @escaping (Result<LoginWithEmailAddressResult, Error>) -> Void
  ) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! LoginWithEmailAddressResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Signs the user in using the Android device identifier.
  func LoginWithAndroidDeviceID(
    completionHandler: @escaping (Result<LoginWithAndroidDeviceIDResult, Error>) -> Void
  ) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! LoginWithAndroidDeviceIDResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Signs the user in using a Facebook access token.
  func LoginWithFacebook(
    completionHandler: @escaping (Result<LoginWithFacebookResult, Error>) -> Void
  ) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! LoginWithFacebookResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Signs the user in using their Google account credentials.
  func LoginWithGoogle(completionHandler: @escaping (Result<LoginWithGoogleResult, Error>) -> Void)
  {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! LoginWithGoogleResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Signs the user in using the vendor-specific iOS device identifier.
  func LoginWithIOSDeviceID(
    completionHandler: @escaping (Result<LoginWithIOSDeviceIDResult, Error>) -> Void
  ) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! LoginWithIOSDeviceIDResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

  /// Signs in the user using an identity token obtained from Sign in with Apple.
  func LoginWithApple(completionHandler: @escaping (Result<LoginWithAppleResult, Error>) -> Void) {
    ApiBase.CallApi(completionHandler: { (response) in
      switch response
      {
      case .success(let result):
        completionHandler(.success(result as! LoginWithAppleResult))
      case .failure(let error):
        completionHandler(.failure(error))
      }
    })
  }

}

/// Signs the user in using a custom unique identifier, which can be a combination of strings, integers, numbers, and symbols,
/// creating a session identifier for subsequent API calls that require an authenticated user.
class LoginWithCustomID: Base {
  public var createAccount: Bool
  public var customID: String

  init(customID: String, createAccount: Bool) {
    self.createAccount = createAccount
    self.customID = customID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let loginWithCustomIDRequest = LoginWithCustomIDRequest(
      customID: customID, createAccount: createAccount)
    AuthenticationAPI.loginWithCustomID(loginWithCustomIDRequest: loginWithCustomIDRequest) {
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
        OpenAPIClientAPI.customHeaders = [
          "Authorization": "Bearer " + (response?.data?.accessToken)!
        ]
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}

/// Signs the user in using the vendor-specific iOS device identifier,
/// returning a session identifier that can subsequently be used for API calls which require an authenticated user.
class LoginWithIOSDeviceID: Base {
  public var createAccount: Bool
  public var iOSDeviceID: String

  init(iOSDeviceID: String, createAccount: Bool) {
    self.createAccount = createAccount
    self.iOSDeviceID = iOSDeviceID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let loginWithIOSDeviceID = LoginWithIOSDeviceIDRequest(
      iOSDeviceID: iOSDeviceID, createAccount: createAccount)
    AuthenticationAPI.loginWithIOSDeviceID(loginWithIOSDeviceIDRequest: loginWithIOSDeviceID) {
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
        OpenAPIClientAPI.customHeaders = [
          "Authorization": "Bearer " + (response?.data?.accessToken)!
        ]
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}

/// Signs the user in using the Android device identifier,
/// returning a session identifier that can subsequently be used for API calls which require an authenticated user.
class LoginWithAndroidDeviceID: Base {
  public var createAccount: Bool
  public var androidDeviceID: String

  init(androidDeviceID: String, createAccount: Bool) {
    self.createAccount = createAccount
    self.androidDeviceID = androidDeviceID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let loginWithAndroidDeviceIDRequest = LoginWithAndroidDeviceIDRequest(
      androidDeviceID: androidDeviceID, createAccount: createAccount)
    AuthenticationAPI.loginWithAndroidDeviceID(
      loginWithAndroidDeviceIDRequest: loginWithAndroidDeviceIDRequest
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
        OpenAPIClientAPI.customHeaders = [
          "Authorization": "Bearer " + (response?.data?.accessToken)!
        ]
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}

/// Signs in the user using an identity token obtained from Sign in with Apple,
/// returning a session identifier that can subsequently be used for API calls which require an authenticated user.
class LoginWithApple: Base {
  public var createAccount: Bool
  public var appleIdentityToken: String
  public var appleID: String
  init(appleIdentityToken: String, createAccount: Bool, appleID: String) {
    self.createAccount = createAccount
    self.appleIdentityToken = appleIdentityToken
    self.appleID = appleID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let loginWithAppleRequest = LoginWithAppleRequest(
      appleID: appleID, createAccount: createAccount, appleIdentityToken: appleIdentityToken)
    AuthenticationAPI.loginWithApple(loginWithAppleRequest: loginWithAppleRequest) {
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
        OpenAPIClientAPI.customHeaders = [
          "Authorization": "Bearer " + (response?.data?.accessToken)!
        ]
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}

/// Signs the user into the Avataryug account, returning a session identifier that can subsequently be used for API calls which require an authenticated user.
/// Unlike most other login API calls, LoginWithEmailAddress does not permit the creation of new accounts via the CreateAccountFlag.
class LoginWithEmailAddress: Base {
  public var createAccount: Bool
  public var password: String
  public var emailID: String
  init(password: String, createAccount: Bool, emailID: String) {
    self.createAccount = createAccount
    self.password = password
    self.emailID = emailID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let loginWithEmailAddressRequest = LoginWithEmailAddressRequest(
      emailID: emailID, password: password)
    AuthenticationAPI.loginWithEmailAddress(
      loginWithEmailAddressRequest: loginWithEmailAddressRequest
    ) { (response, error) in
      guard error == nil else {
          if(ProjectSettings.shared.isDebug)
          {
              print("The login Error----", error!.self)
          }
        completionHandler(.failure(error!))
        return
      }
      do {
        OpenAPIClientAPI.customHeaders = [
          "Authorization": "Bearer " + (response?.data?.accessToken)!
        ]
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}

/// Signs the user in using a Facebook access token,
/// returning a session identifier that can subsequently be used for API calls which require an authenticated user
class LoginWithFacebook: Base {
  public var createAccount: Bool
  public var fbAccessToken: String
  public var facebookID: String
  init(fbAccessToken: String, createAccount: Bool, facebookID: String) {
    self.createAccount = createAccount
    self.fbAccessToken = fbAccessToken
    self.facebookID = facebookID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let LoginWithFacebookRequest = LoginWithFacebookRequest(
      facebookID: facebookID, fbAccessToken: fbAccessToken, createAccount: createAccount)
    AuthenticationAPI.loginWithFacebook(loginWithFacebookRequest: LoginWithFacebookRequest) {
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
        OpenAPIClientAPI.customHeaders = [
          "Authorization": "Bearer " + (response?.data?.accessToken)!
        ]
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}
/// Signs the user in using their Google account credentials,
/// returning a session identifier that can subsequently be used for API calls which require an authenticated user
class LoginWithGoogle: Base {
  public var createAccount: Bool
  public var googleServerAuthCode: String
  public var googleID: String
  init(googleServerAuthCode: String, createAccount: Bool, googleID: String) {
    self.createAccount = createAccount
    self.googleServerAuthCode = googleServerAuthCode
    self.googleID = googleID
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let loginWithGoogleRequest = LoginWithGoogleRequest(
      googleID: googleID, googleServerAuthCode: googleServerAuthCode, createAccount: createAccount)

    AuthenticationAPI.loginWithGoogle(loginWithGoogleRequest: loginWithGoogleRequest) {
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
        OpenAPIClientAPI.customHeaders = [
          "Authorization": "Bearer " + (response?.data?.accessToken)!
        ]
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}

/// Register user with email id,
/// creating a session identifier for subsequent API calls that require an authenticated user.
class RegisterUser: Base {
  public var addDisplayName: String
  public var emailID: String
  public var password: String

  init(addDisplayName: String, emailID: String, password: String) {
    self.addDisplayName = addDisplayName
    self.emailID = emailID
    self.password = password
  }

  func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
    let auth = RegisterUserRequest(
      emailID: emailID, password: password, displayName: addDisplayName)
    AuthenticationAPI.registerUser(registerUserRequest: auth) { response, error in
      guard error == nil else {
          if(ProjectSettings.shared.isDebug)
          {
              print(error!)
          }
        completionHandler(.failure(error!))
        return
      }
      do {
        OpenAPIClientAPI.customHeaders = [
          "Authorization": "Bearer " + (response?.data?.accessToken)!
        ]
        completionHandler(.success(response! as AnyObject))
      }
    }
  }
}
