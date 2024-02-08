import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
open class AuthenticationAPI {

    /**
     Login With Android Device ID
     - parameter loginWithAndroidDeviceIDRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func loginWithAndroidDeviceID(loginWithAndroidDeviceIDRequest: LoginWithAndroidDeviceIDRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: LoginWithAndroidDeviceIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return loginWithAndroidDeviceIDWithRequestBuilder(loginWithAndroidDeviceIDRequest: loginWithAndroidDeviceIDRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Login With Android Device ID
     - POST /LoginWithAndroidDeviceID
     - Signs the user in using the Android device identifier, returning a session identifier that can subsequently be used for API calls which require an authenticated user
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter loginWithAndroidDeviceIDRequest: (body)  (optional)
     - returns: RequestBuilder<LoginWithAndroidDeviceIDResult> 
     */
    open class func loginWithAndroidDeviceIDWithRequestBuilder(loginWithAndroidDeviceIDRequest: LoginWithAndroidDeviceIDRequest? = nil) -> RequestBuilder<LoginWithAndroidDeviceIDResult> {
        let localVariablePath = "/LoginWithAndroidDeviceID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: loginWithAndroidDeviceIDRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<LoginWithAndroidDeviceIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Login With Apple
     
     - parameter loginWithAppleRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func loginWithApple(loginWithAppleRequest: LoginWithAppleRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: LoginWithAppleResult?, _ error: Error?) -> Void)) -> RequestTask {
        return loginWithAppleWithRequestBuilder(loginWithAppleRequest: loginWithAppleRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Login With Apple
     - POST /LoginWithApple
     - Signs in the user with a Sign in with Apple identity token.
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter loginWithAppleRequest: (body)  (optional)
     - returns: RequestBuilder<LoginWithAppleResult> 
     */
    open class func loginWithAppleWithRequestBuilder(loginWithAppleRequest: LoginWithAppleRequest? = nil) -> RequestBuilder<LoginWithAppleResult> {
        let localVariablePath = "/LoginWithApple"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: loginWithAppleRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<LoginWithAppleResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Login With Custom ID
     
     - parameter loginWithCustomIDRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func loginWithCustomID(loginWithCustomIDRequest: LoginWithCustomIDRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: LoginWithCustomIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return loginWithCustomIDWithRequestBuilder(loginWithCustomIDRequest: loginWithCustomIDRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Login With Custom ID
     - POST /LoginWithCustomID
     - Signs the user in using a custom unique identifier generated by the Project, returning a session identifier that can subsequently be used for API calls which require an authenticated user
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter loginWithCustomIDRequest: (body)  (optional)
     - returns: RequestBuilder<LoginWithCustomIDResult?> 
     */
    open class func loginWithCustomIDWithRequestBuilder(loginWithCustomIDRequest: LoginWithCustomIDRequest? = nil) -> RequestBuilder<LoginWithCustomIDResult?> {
        let localVariablePath = "/LoginWithCustomID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: loginWithCustomIDRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<LoginWithCustomIDResult?>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Login With Email Address
     
     - parameter loginWithEmailAddressRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func loginWithEmailAddress(loginWithEmailAddressRequest: LoginWithEmailAddressRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: LoginWithEmailAddressResult?, _ error: Error?) -> Void)) -> RequestTask {
        return loginWithEmailAddressWithRequestBuilder(loginWithEmailAddressRequest: loginWithEmailAddressRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Login With Email Address
     - POST /LoginWithEmailAddress
     - Signs the user into the AvatarYug account, returning a session identifier that can subsequently be used for API calls which require an authenticated user. Unlike most other login API calls, LoginWithEmailAddress does not permit the creation of new accounts via the CreateAccountFlag. E
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter loginWithEmailAddressRequest: (body)  (optional)
     - returns: RequestBuilder<LoginWithEmailAddressResult> 
     */
    open class func loginWithEmailAddressWithRequestBuilder(loginWithEmailAddressRequest: LoginWithEmailAddressRequest? = nil) -> RequestBuilder<LoginWithEmailAddressResult> {
        let localVariablePath = "/LoginWithEmailAddress"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: loginWithEmailAddressRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<LoginWithEmailAddressResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Login With Facebook
     
     - parameter loginWithFacebookRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func loginWithFacebook(loginWithFacebookRequest: LoginWithFacebookRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: LoginWithFacebookResult?, _ error: Error?) -> Void)) -> RequestTask {
        return loginWithFacebookWithRequestBuilder(loginWithFacebookRequest: loginWithFacebookRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Login With Facebook
     - POST /LoginWithFacebook
     - Signs the user in using a Facebook access token, returning a session identifier that can subsequently be used for API calls which require an authenticated user
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter loginWithFacebookRequest: (body)  (optional)
     - returns: RequestBuilder<LoginWithFacebookResult> 
     */
    open class func loginWithFacebookWithRequestBuilder(loginWithFacebookRequest: LoginWithFacebookRequest? = nil) -> RequestBuilder<LoginWithFacebookResult> {
        let localVariablePath = "/LoginWithFacebook"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: loginWithFacebookRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<LoginWithFacebookResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Login With Google Account
     
     - parameter loginWithGoogleRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func loginWithGoogle(loginWithGoogleRequest: LoginWithGoogleRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: LoginWithGoogleResult?, _ error: Error?) -> Void)) -> RequestTask {
        return loginWithGoogleWithRequestBuilder(loginWithGoogleRequest: loginWithGoogleRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Login With Google Account
     - POST /LoginWithGoogle
     - Signs the user in using their Google account credentials
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter loginWithGoogleRequest: (body)  (optional)
     - returns: RequestBuilder<LoginWithGoogleResult> 
     */
    open class func loginWithGoogleWithRequestBuilder(loginWithGoogleRequest: LoginWithGoogleRequest? = nil) -> RequestBuilder<LoginWithGoogleResult> {
        let localVariablePath = "/LoginWithGoogle"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: loginWithGoogleRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<LoginWithGoogleResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Login With IOS Device ID
     
     - parameter loginWithIOSDeviceIDRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func loginWithIOSDeviceID(loginWithIOSDeviceIDRequest: LoginWithIOSDeviceIDRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: LoginWithIOSDeviceIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return loginWithIOSDeviceIDWithRequestBuilder(loginWithIOSDeviceIDRequest: loginWithIOSDeviceIDRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Login With IOS Device ID
     - POST /LoginWithIOSDeviceID
     - Signs the user in using the vendor-specific iOS device identifier, returning a session identifier that can subsequently be used for API calls which require an authenticated user
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter loginWithIOSDeviceIDRequest: (body)  (optional)
     - returns: RequestBuilder<LoginWithIOSDeviceIDResult> 
     */
    open class func loginWithIOSDeviceIDWithRequestBuilder(loginWithIOSDeviceIDRequest: LoginWithIOSDeviceIDRequest? = nil) -> RequestBuilder<LoginWithIOSDeviceIDResult> {
        let localVariablePath = "/LoginWithIOSDeviceID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: loginWithIOSDeviceIDRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<LoginWithIOSDeviceIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Register User
     
     - parameter registerUserRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func registerUser(registerUserRequest: RegisterUserRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: RegisterUserResult?, _ error: Error?) -> Void)) -> RequestTask {
        return registerUserWithRequestBuilder(registerUserRequest: registerUserRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Register User
     - POST /RegisterUser
     - Register User
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter registerUserRequest: (body)  (optional)
     - returns: RequestBuilder<RegisterUserResult> 
     */
    open class func registerUserWithRequestBuilder(registerUserRequest: RegisterUserRequest? = nil) -> RequestBuilder<RegisterUserResult> {
        let localVariablePath = "/RegisterUser"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: registerUserRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<RegisterUserResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}
