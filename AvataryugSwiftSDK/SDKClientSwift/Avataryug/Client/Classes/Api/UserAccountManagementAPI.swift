import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
open class UserAccountManagementAPI {

    /**
     Add Email Password     
     - parameter addEmailPasswordRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func addEmailPassword(addEmailPasswordRequest: AddEmailPasswordRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AddEmailPasswordResult?, _ error: Error?) -> Void)) -> RequestTask {
        return addEmailPasswordWithRequestBuilder(addEmailPasswordRequest: addEmailPasswordRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Add Email Password
     - POST /AddEmailPassword
     - Adds AvatarYug email/password auth to an existing account created via an anonymous auth method, e.g. automatic device ID login.
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter addEmailPasswordRequest: (body)  (optional)
     - returns: RequestBuilder<AddEmailPasswordResult> 
     */
    open class func addEmailPasswordWithRequestBuilder(addEmailPasswordRequest: AddEmailPasswordRequest? = nil) -> RequestBuilder<AddEmailPasswordResult> {
        let localVariablePath = "/AddEmailPassword"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: addEmailPasswordRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AddEmailPasswordResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Add Generic Service ID
     
     - parameter addGenericServiceIDRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func addGenericServiceID(addGenericServiceIDRequest: AddGenericServiceIDRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AddGenericServiceIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return addGenericServiceIDWithRequestBuilder(addGenericServiceIDRequest: addGenericServiceIDRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Add Generic Service ID
     - POST /AddGenericServiceID
     - Adds the specified generic service identifier to the user's AvatarYug account. This is designed to allow for a AvatarYug ID lookup of any arbitrary service identifier a Project wants to add. This identifier should never be used as authentication credentials, as the intent is that it is easily accessible by other users.
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter addGenericServiceIDRequest: (body)  (optional)
     - returns: RequestBuilder<AddGenericServiceIDResult> 
     */
    open class func addGenericServiceIDWithRequestBuilder(addGenericServiceIDRequest: AddGenericServiceIDRequest? = nil) -> RequestBuilder<AddGenericServiceIDResult> {
        let localVariablePath = "/AddGenericServiceID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: addGenericServiceIDRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AddGenericServiceIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Change Password
     
     - parameter changePasswordRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func changePassword(changePasswordRequest: ChangePasswordRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: ChangePasswordResult?, _ error: Error?) -> Void)) -> RequestTask {
        return changePasswordWithRequestBuilder(changePasswordRequest: changePasswordRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Change Password
     - POST /ChangePassword
     - Change Password
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter changePasswordRequest: (body)  (optional)
     - returns: RequestBuilder<ChangePasswordResult> 
     */
    open class func changePasswordWithRequestBuilder(changePasswordRequest: ChangePasswordRequest? = nil) -> RequestBuilder<ChangePasswordResult> {
        let localVariablePath = "/ChangePassword"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: changePasswordRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<ChangePasswordResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Delete User 
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func deleteUser(apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: DeleteUserResult?, _ error: Error?) -> Void)) -> RequestTask {
        return deleteUserWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Delete User 
     - DELETE /DeleteUser
     - Delete User Account from Avataryug platform.
     - BASIC:
       - type: http
       - name: bearerAuth
     - returns: RequestBuilder<DeleteUserResult> 
     */
    open class func deleteUserWithRequestBuilder() -> RequestBuilder<DeleteUserResult> {
        let localVariablePath = "/DeleteUser"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<DeleteUserResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "DELETE", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Get User Account Info
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getUserAccountInfo(apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetUserAccountInfoResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getUserAccountInfoWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get User Account Info
     - GET /GetUserAccountInfo
     - Get user's complete account information
     - BASIC:
       - type: http
       - name: bearerAuth
     - returns: RequestBuilder<GetUserAccountInfoResult> 
     */
    open class func getUserAccountInfoWithRequestBuilder() -> RequestBuilder<GetUserAccountInfoResult> {
        let localVariablePath = "/GetUserAccountInfo"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetUserAccountInfoResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Get UserID from Session Ticket
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getUserIDfromSessionTicket(apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetUserIDfromSessionTicket?, _ error: Error?) -> Void)) -> RequestTask {
        return getUserIDfromSessionTicketWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get UserID from Session Ticket
     - GET /GetUserIDfromSessionTicket
     - This API gives UserID from the session Ticket
     - BASIC:
       - type: http
       - name: bearerAuth
     - returns: RequestBuilder<GetUserIDfromSessionTicket> 
     */
    open class func getUserIDfromSessionTicketWithRequestBuilder() -> RequestBuilder<GetUserIDfromSessionTicket> {
        let localVariablePath = "/GetUserIDfromSessionTicket"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetUserIDfromSessionTicket>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Get User Profile
     
     - parameter userID: (query) Unique AvatarYug assigned ID of the user on whom the operation will be performed 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getUserProfile(userID: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetUserProfileResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getUserProfileWithRequestBuilder(userID: userID).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get User Profile
     - GET /GetUserProfile
     - Get Public data for the User
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter userID: (query) Unique AvatarYug assigned ID of the user on whom the operation will be performed 
     - returns: RequestBuilder<GetUserProfileResult> 
     */
    open class func getUserProfileWithRequestBuilder(userID: String) -> RequestBuilder<GetUserProfileResult> {
        let localVariablePath = "/GetUserProfile"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "UserID": (wrappedValue: userID.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetUserProfileResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Link Android Device ID
     
     - parameter linkAndroidDeviceIDRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func linkAndroidDeviceID(linkAndroidDeviceIDRequest: LinkAndroidDeviceIDRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: LinkAndroidDeviceIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return linkAndroidDeviceIDWithRequestBuilder(linkAndroidDeviceIDRequest: linkAndroidDeviceIDRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Link Android Device ID
     - POST /LinkAndroidDeviceID
     - Links the Android device identifier to the user's AvatarYug account
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter linkAndroidDeviceIDRequest: (body)  (optional)
     - returns: RequestBuilder<LinkAndroidDeviceIDResult> 
     */
    open class func linkAndroidDeviceIDWithRequestBuilder(linkAndroidDeviceIDRequest: LinkAndroidDeviceIDRequest? = nil) -> RequestBuilder<LinkAndroidDeviceIDResult> {
        let localVariablePath = "/LinkAndroidDeviceID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: linkAndroidDeviceIDRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<LinkAndroidDeviceIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Link Apple
     
     - parameter linkAppleRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func linkApple(linkAppleRequest: LinkAppleRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: LinkAppleResult?, _ error: Error?) -> Void)) -> RequestTask {
        return linkAppleWithRequestBuilder(linkAppleRequest: linkAppleRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Link Apple
     - POST /LinkApple
     - Links the Apple account associated with the token to the user's AvatarYug account.
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter linkAppleRequest: (body)  (optional)
     - returns: RequestBuilder<LinkAppleResult> 
     */
    open class func linkAppleWithRequestBuilder(linkAppleRequest: LinkAppleRequest? = nil) -> RequestBuilder<LinkAppleResult> {
        let localVariablePath = "/LinkApple"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: linkAppleRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<LinkAppleResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Link Custom ID
     
     - parameter linkCustomIDRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func linkCustomID(linkCustomIDRequest: LinkCustomIDRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: LinkCustomIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return linkCustomIDWithRequestBuilder(linkCustomIDRequest: linkCustomIDRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Link Custom ID
     - POST /LinkCustomID
     - Links the custom identifier, generated by the Project, to the user's AvatarYug account
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter linkCustomIDRequest: (body)  (optional)
     - returns: RequestBuilder<LinkCustomIDResult> 
     */
    open class func linkCustomIDWithRequestBuilder(linkCustomIDRequest: LinkCustomIDRequest? = nil) -> RequestBuilder<LinkCustomIDResult> {
        let localVariablePath = "/LinkCustomID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: linkCustomIDRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<LinkCustomIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Link Facebook Account
     
     - parameter linkFacebookAccountRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func linkFacebookAccount(linkFacebookAccountRequest: LinkFacebookAccountRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: LinkFacebookAccountResult?, _ error: Error?) -> Void)) -> RequestTask {
        return linkFacebookAccountWithRequestBuilder(linkFacebookAccountRequest: linkFacebookAccountRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Link Facebook Account
     - POST /LinkFacebookAccount
     - Links the Facebook account associated with the provided Facebook access token to the user's AvatarYug account
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter linkFacebookAccountRequest: (body)  (optional)
     - returns: RequestBuilder<LinkFacebookAccountResult> 
     */
    open class func linkFacebookAccountWithRequestBuilder(linkFacebookAccountRequest: LinkFacebookAccountRequest? = nil) -> RequestBuilder<LinkFacebookAccountResult> {
        let localVariablePath = "/LinkFacebookAccount"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: linkFacebookAccountRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<LinkFacebookAccountResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Link Google Account
     
     - parameter linkGoogleAccountRequest: (body) Linked Google account to user&#39;s account successfully (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func linkGoogleAccount(linkGoogleAccountRequest: LinkGoogleAccountRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: LinkGoogleAccountResult?, _ error: Error?) -> Void)) -> RequestTask {
        return linkGoogleAccountWithRequestBuilder(linkGoogleAccountRequest: linkGoogleAccountRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Link Google Account
     - POST /LinkGoogleAccount
     - Links the currently signed-in user account to their Google account, using their Google account credentials
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter linkGoogleAccountRequest: (body) Linked Google account to user&#39;s account successfully (optional)
     - returns: RequestBuilder<LinkGoogleAccountResult> 
     */
    open class func linkGoogleAccountWithRequestBuilder(linkGoogleAccountRequest: LinkGoogleAccountRequest? = nil) -> RequestBuilder<LinkGoogleAccountResult> {
        let localVariablePath = "/LinkGoogleAccount"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: linkGoogleAccountRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<LinkGoogleAccountResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Link IOS Device ID
     
     - parameter linkIOSDeviceIDRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func linkIOSDeviceID(linkIOSDeviceIDRequest: LinkIOSDeviceIDRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: LinkIOSDeviceIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return linkIOSDeviceIDWithRequestBuilder(linkIOSDeviceIDRequest: linkIOSDeviceIDRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Link IOS Device ID
     - POST /LinkIOSDeviceID
     - Links the vendor-specific iOS device identifier to the user's AvatarYug account
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter linkIOSDeviceIDRequest: (body)  (optional)
     - returns: RequestBuilder<LinkIOSDeviceIDResult> 
     */
    open class func linkIOSDeviceIDWithRequestBuilder(linkIOSDeviceIDRequest: LinkIOSDeviceIDRequest? = nil) -> RequestBuilder<LinkIOSDeviceIDResult> {
        let localVariablePath = "/LinkIOSDeviceID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: linkIOSDeviceIDRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<LinkIOSDeviceIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Remove Generic Service ID
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func removeGenericServiceID(apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: RemoveGenericServiceIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return removeGenericServiceIDWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Remove Generic Service ID
     - POST /RemoveGenericServiceID
     - Removes the generic service identifier from the user's AvatarYug account.
     - BASIC:
       - type: http
       - name: bearerAuth
     - returns: RequestBuilder<RemoveGenericServiceIDResult> 
     */
    open class func removeGenericServiceIDWithRequestBuilder() -> RequestBuilder<RemoveGenericServiceIDResult> {
        let localVariablePath = "/RemoveGenericServiceID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<RemoveGenericServiceIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Send Account Recovery Email
     
     - parameter sendAccountRecoveryEmailRequset: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func sendAccountRecoveryEmail(sendAccountRecoveryEmailRequset: SendAccountRecoveryEmailRequset? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: SendAccountRecoveryEmailResult?, _ error: Error?) -> Void)) -> RequestTask {
        return sendAccountRecoveryEmailWithRequestBuilder(sendAccountRecoveryEmailRequset: sendAccountRecoveryEmailRequset).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Send Account Recovery Email
     - POST /SendAccountRecoveryEmail
     - Send Account Recovery Email
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter sendAccountRecoveryEmailRequset: (body)  (optional)
     - returns: RequestBuilder<SendAccountRecoveryEmailResult> 
     */
    open class func sendAccountRecoveryEmailWithRequestBuilder(sendAccountRecoveryEmailRequset: SendAccountRecoveryEmailRequset? = nil) -> RequestBuilder<SendAccountRecoveryEmailResult> {
        let localVariablePath = "/SendAccountRecoveryEmail"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: sendAccountRecoveryEmailRequset)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<SendAccountRecoveryEmailResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Send Account Verification Email
     
     - parameter sendAccountVerificationEmailRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func sendAccountVerificationEmail(sendAccountVerificationEmailRequest: SendAccountVerificationEmailRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: SendAccountVerificationEmailResult?, _ error: Error?) -> Void)) -> RequestTask {
        return sendAccountVerificationEmailWithRequestBuilder(sendAccountVerificationEmailRequest: sendAccountVerificationEmailRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Send Account Verification Email
     - POST /SendAccountVerificationEmail
     - Send Verification Email to verify the email address
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter sendAccountVerificationEmailRequest: (body)  (optional)
     - returns: RequestBuilder<SendAccountVerificationEmailResult> 
     */
    open class func sendAccountVerificationEmailWithRequestBuilder(sendAccountVerificationEmailRequest: SendAccountVerificationEmailRequest? = nil) -> RequestBuilder<SendAccountVerificationEmailResult> {
        let localVariablePath = "/SendAccountVerificationEmail"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: sendAccountVerificationEmailRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<SendAccountVerificationEmailResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Unlink Android Device ID
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func unlinkAndroidDeviceID(apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: UnlinkAndroidDeviceIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return unlinkAndroidDeviceIDWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Unlink Android Device ID
     - POST /UnlinkAndroidDeviceID
     - Unlinks the related Android device identifier from the user's AvatarYug account
     - BASIC:
       - type: http
       - name: bearerAuth
     - returns: RequestBuilder<UnlinkAndroidDeviceIDResult> 
     */
    open class func unlinkAndroidDeviceIDWithRequestBuilder() -> RequestBuilder<UnlinkAndroidDeviceIDResult> {
        let localVariablePath = "/UnlinkAndroidDeviceID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UnlinkAndroidDeviceIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Unlink Apple
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func unlinkApple(apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: UnlinkAppleResult?, _ error: Error?) -> Void)) -> RequestTask {
        return unlinkAppleWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Unlink Apple
     - POST /UnlinkApple
     - Unlinks the related Apple account from the user's AvatarYug account.
     - BASIC:
       - type: http
       - name: bearerAuth
     - returns: RequestBuilder<UnlinkAppleResult> 
     */
    open class func unlinkAppleWithRequestBuilder() -> RequestBuilder<UnlinkAppleResult> {
        let localVariablePath = "/UnlinkApple"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UnlinkAppleResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Unlink Custom ID
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func unlinkCustomID(apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: UnlinkCustomIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return unlinkCustomIDWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Unlink Custom ID
     - POST /UnlinkCustomID
     - Unlinks the related custom identifier from the user's AvatarYug account
     - BASIC:
       - type: http
       - name: bearerAuth
     - returns: RequestBuilder<UnlinkCustomIDResult> 
     */
    open class func unlinkCustomIDWithRequestBuilder() -> RequestBuilder<UnlinkCustomIDResult> {
        let localVariablePath = "/UnlinkCustomID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UnlinkCustomIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Unlink Facebook Account
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func unlinkFacebookAccount(apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: UnlinkFacebookAccountResult?, _ error: Error?) -> Void)) -> RequestTask {
        return unlinkFacebookAccountWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Unlink Facebook Account
     - POST /UnlinkFacebookAccount
     - Unlinks the related Facebook account from the user's AvatarYug account
     - BASIC:
       - type: http
       - name: bearerAuth
     - returns: RequestBuilder<UnlinkFacebookAccountResult> 
     */
    open class func unlinkFacebookAccountWithRequestBuilder() -> RequestBuilder<UnlinkFacebookAccountResult> {
        let localVariablePath = "/UnlinkFacebookAccount"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UnlinkFacebookAccountResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Unlink Google Account
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func unlinkGoogleAccount(apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: UnlinkGoogleAccountResult?, _ error: Error?) -> Void)) -> RequestTask {
        return unlinkGoogleAccountWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Unlink Google Account
     - POST /UnlinkGoogleAccount
     - Unlinks the related Google account from the user's AvatarYug account 
     - BASIC:
       - type: http
       - name: bearerAuth
     - returns: RequestBuilder<UnlinkGoogleAccountResult> 
     */
    open class func unlinkGoogleAccountWithRequestBuilder() -> RequestBuilder<UnlinkGoogleAccountResult> {
        let localVariablePath = "/UnlinkGoogleAccount"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UnlinkGoogleAccountResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Unlink IOS Device ID
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func unlinkIOSDeviceID(apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: UnlinkIOSDeviceIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return unlinkIOSDeviceIDWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Unlink IOS Device ID
     - POST /UnlinkIOSDeviceID
     - Unlinks the related iOS device identifier from the user's AvatarYug account
     - BASIC:
       - type: http
       - name: bearerAuth
     - returns: RequestBuilder<UnlinkIOSDeviceIDResult> 
     */
    open class func unlinkIOSDeviceIDWithRequestBuilder() -> RequestBuilder<UnlinkIOSDeviceIDResult> {
        let localVariablePath = "/UnlinkIOSDeviceID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UnlinkIOSDeviceIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Update Default AvatarID
     
     - parameter updateDefaultAvatarIDRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func updateDefaultAvatarID(updateDefaultAvatarIDRequest: UpdateDefaultAvatarIDRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: UpdateDefaultAvatarIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return updateDefaultAvatarIDWithRequestBuilder(updateDefaultAvatarIDRequest: updateDefaultAvatarIDRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Update Default AvatarID
     - POST /UpdateDefaultAvatarID
     - Sets the default avatar ID to users account
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter updateDefaultAvatarIDRequest: (body)  (optional)
     - returns: RequestBuilder<UpdateDefaultAvatarIDResult> 
     */
    open class func updateDefaultAvatarIDWithRequestBuilder(updateDefaultAvatarIDRequest: UpdateDefaultAvatarIDRequest? = nil) -> RequestBuilder<UpdateDefaultAvatarIDResult> {
        let localVariablePath = "/UpdateDefaultAvatarID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: updateDefaultAvatarIDRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UpdateDefaultAvatarIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Update Email Password
     
     - parameter updateEmailPasswordRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func updateEmailPassword(updateEmailPasswordRequest: UpdateEmailPasswordRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: UpdateEmailPasswordResult?, _ error: Error?) -> Void)) -> RequestTask {
        return updateEmailPasswordWithRequestBuilder(updateEmailPasswordRequest: updateEmailPasswordRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Update Email Password
     - POST /UpdateEmailPassword
     - Update Email Password
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter updateEmailPasswordRequest: (body)  (optional)
     - returns: RequestBuilder<UpdateEmailPasswordResult> 
     */
    open class func updateEmailPasswordWithRequestBuilder(updateEmailPasswordRequest: UpdateEmailPasswordRequest? = nil) -> RequestBuilder<UpdateEmailPasswordResult> {
        let localVariablePath = "/UpdateEmailPassword"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: updateEmailPasswordRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UpdateEmailPasswordResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Update User Demographics
     
     - parameter updateUserDemographicsRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func updateUserDemographics(updateUserDemographicsRequest: UpdateUserDemographicsRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: UpdateUserDemographicsResult?, _ error: Error?) -> Void)) -> RequestTask {
        return updateUserDemographicsWithRequestBuilder(updateUserDemographicsRequest: updateUserDemographicsRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Update User Demographics
     - POST /UpdateUserDemographics
     - Update User Demographics
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter updateUserDemographicsRequest: (body)  (optional)
     - returns: RequestBuilder<UpdateUserDemographicsResult> 
     */
    open class func updateUserDemographicsWithRequestBuilder(updateUserDemographicsRequest: UpdateUserDemographicsRequest? = nil) -> RequestBuilder<UpdateUserDemographicsResult> {
        let localVariablePath = "/UpdateUserDemographics"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: updateUserDemographicsRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UpdateUserDemographicsResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Update User Project Display Name
     
     - parameter updateUserProjectDisplayNameRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func updateUserProjectDisplayName(updateUserProjectDisplayNameRequest: UpdateUserProjectDisplayNameRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: UpdateUserProjectDisplayNameResult?, _ error: Error?) -> Void)) -> RequestTask {
        return updateUserProjectDisplayNameWithRequestBuilder(updateUserProjectDisplayNameRequest: updateUserProjectDisplayNameRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Update User Project Display Name
     - PUT /UpdateUserProjectDisplayName
     - Updates the display name for the user in the project
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter updateUserProjectDisplayNameRequest: (body)  (optional)
     - returns: RequestBuilder<UpdateUserProjectDisplayNameResult> 
     */
    open class func updateUserProjectDisplayNameWithRequestBuilder(updateUserProjectDisplayNameRequest: UpdateUserProjectDisplayNameRequest? = nil) -> RequestBuilder<UpdateUserProjectDisplayNameResult> {
        let localVariablePath = "/UpdateUserProjectDisplayName"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: updateUserProjectDisplayNameRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UpdateUserProjectDisplayNameResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PUT", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Verify User With Email
     
     - parameter verifyUserWithEmailRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func verifyUserWithEmail(verifyUserWithEmailRequest: VerifyUserWithEmailRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: VerifyUserWithEmailResult?, _ error: Error?) -> Void)) -> RequestTask {
        return verifyUserWithEmailWithRequestBuilder(verifyUserWithEmailRequest: verifyUserWithEmailRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Verify User With Email
     - POST /VerifyUserWithEmail
     - Verifies user account status to email verified once email verification is done
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter verifyUserWithEmailRequest: (body)  (optional)
     - returns: RequestBuilder<VerifyUserWithEmailResult> 
     */
    open class func verifyUserWithEmailWithRequestBuilder(verifyUserWithEmailRequest: VerifyUserWithEmailRequest? = nil) -> RequestBuilder<VerifyUserWithEmailResult> {
        let localVariablePath = "/VerifyUserWithEmail"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: verifyUserWithEmailRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<VerifyUserWithEmailResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}
