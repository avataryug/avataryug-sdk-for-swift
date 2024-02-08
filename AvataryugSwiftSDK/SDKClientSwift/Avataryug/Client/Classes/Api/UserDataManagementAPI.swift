import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
open class UserDataManagementAPI {

    /**
     Add User Avatar
     - parameter addUserAvatarRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func addUserAvatar(addUserAvatarRequest: AddUserAvatarRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AddUserAvatarResult?, _ error: Error?) -> Void)) -> RequestTask {
        return addUserAvatarWithRequestBuilder(addUserAvatarRequest: addUserAvatarRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Add User Avatar
     - POST /AddUserAvatar
     - Add Avatar to the user
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter addUserAvatarRequest: (body)  (optional)
     - returns: RequestBuilder<AddUserAvatarResult> 
     */
    open class func addUserAvatarWithRequestBuilder(addUserAvatarRequest: AddUserAvatarRequest? = nil) -> RequestBuilder<AddUserAvatarResult> {
        let localVariablePath = "/AddUserAvatar"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: addUserAvatarRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AddUserAvatarResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Add Virtual Currency to User
     
     - parameter addVirtualCurrencyToUserRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func addVirtualCurrencyToUser(addVirtualCurrencyToUserRequest: AddVirtualCurrencyToUserRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AddVirtualCurrencyToUserResult?, _ error: Error?) -> Void)) -> RequestTask {
        return addVirtualCurrencyToUserWithRequestBuilder(addVirtualCurrencyToUserRequest: addVirtualCurrencyToUserRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Add Virtual Currency to User
     - POST /AddVirtualCurrencyToUser
     - Increments the user's balance of the specified virtual currency by the stated amount
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter addVirtualCurrencyToUserRequest: (body)  (optional)
     - returns: RequestBuilder<AddVirtualCurrencyToUserResult> 
     */
    open class func addVirtualCurrencyToUserWithRequestBuilder(addVirtualCurrencyToUserRequest: AddVirtualCurrencyToUserRequest? = nil) -> RequestBuilder<AddVirtualCurrencyToUserResult> {
        let localVariablePath = "/AddVirtualCurrencyToUser"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: addVirtualCurrencyToUserRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AddVirtualCurrencyToUserResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Confirm Purchase (Private Preview)
     
     - parameter confirmPurchaseRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func confirmPurchase(confirmPurchaseRequest: ConfirmPurchaseRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: ConfirmPurchaseResult?, _ error: Error?) -> Void)) -> RequestTask {
        return confirmPurchaseWithRequestBuilder(confirmPurchaseRequest: confirmPurchaseRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Confirm Purchase (Private Preview)
     - POST /ConfirmPurchase
     - Confirms with the payment provider that the purchase was approved (if applicable) and adjusts inventory and virtual currency balances as appropriate
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter confirmPurchaseRequest: (body)  (optional)
     - returns: RequestBuilder<ConfirmPurchaseResult> 
     */
    open class func confirmPurchaseWithRequestBuilder(confirmPurchaseRequest: ConfirmPurchaseRequest? = nil) -> RequestBuilder<ConfirmPurchaseResult> {
        let localVariablePath = "/ConfirmPurchase"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: confirmPurchaseRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<ConfirmPurchaseResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Consume Instance
     
     - parameter consumeInstanceRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func consumeInstance(consumeInstanceRequest: ConsumeInstanceRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: ConsumeInstanceResult?, _ error: Error?) -> Void)) -> RequestTask {
        return consumeInstanceWithRequestBuilder(consumeInstanceRequest: consumeInstanceRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Consume Instance
     - POST /ConsumeInstance
     - Consume uses of a consumable item. When all uses are consumed, it will be removed from the user's inventory.
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter consumeInstanceRequest: (body)  (optional)
     - returns: RequestBuilder<ConsumeInstanceResult> 
     */
    open class func consumeInstanceWithRequestBuilder(consumeInstanceRequest: ConsumeInstanceRequest? = nil) -> RequestBuilder<ConsumeInstanceResult> {
        let localVariablePath = "/ConsumeInstance"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: consumeInstanceRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<ConsumeInstanceResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Delete User Avatar
     
     - parameter avatarID: (query) Unique Identifier of the Avatar which needs to be deleted 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func deleteUserAvatar(avatarID: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: DeleteUserAvatarResult?, _ error: Error?) -> Void)) -> RequestTask {
        return deleteUserAvatarWithRequestBuilder(avatarID: avatarID).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Delete User Avatar
     - DELETE /DeleteUserAvatar
     - Delete specified Avatar for the user
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter avatarID: (query) Unique Identifier of the Avatar which needs to be deleted 
     - returns: RequestBuilder<DeleteUserAvatarResult> 
     */
    open class func deleteUserAvatarWithRequestBuilder(avatarID: String) -> RequestBuilder<DeleteUserAvatarResult> {
        let localVariablePath = "/DeleteUserAvatar"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "AvatarID": (wrappedValue: avatarID.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<DeleteUserAvatarResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "DELETE", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Get Purchase (Private Preview)
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getPurchase(apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetPurchaseResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getPurchaseWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Purchase (Private Preview)
     - GET /GetPurchase
     - Retrieves a purchase along with its current AvatarYug status. Returns inventory items from the purchase that are still active.
     - BASIC:
       - type: http
       - name: bearerAuth
     - returns: RequestBuilder<GetPurchaseResult> 
     */
    open class func getPurchaseWithRequestBuilder() -> RequestBuilder<GetPurchaseResult> {
        let localVariablePath = "/GetPurchase"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetPurchaseResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Get User Inventory
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getUserInventory(apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetUserInventoryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getUserInventoryWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get User Inventory
     - GET /GetUserInventory
     - Retrieves the user's current inventory of virtual goods
     - BASIC:
       - type: http
       - name: bearerAuth
     - returns: RequestBuilder<GetUserInventoryResult> 
     */
    open class func getUserInventoryWithRequestBuilder() -> RequestBuilder<GetUserInventoryResult> {
        let localVariablePath = "/GetUserInventory"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetUserInventoryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Get Users All Avatars
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getUsersAllAvatars(apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetUsersAllAvatarsResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getUsersAllAvatarsWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Users All Avatars
     - GET /GetUsersAllAvatars
     - Lists all of the avatars that belong to a specific user
     - BASIC:
       - type: http
       - name: bearerAuth
     - returns: RequestBuilder<GetUsersAllAvatarsResult> 
     */
    open class func getUsersAllAvatarsWithRequestBuilder() -> RequestBuilder<GetUsersAllAvatarsResult> {
        let localVariablePath = "/GetUsersAllAvatars"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetUsersAllAvatarsResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Grant Instance To User
     
     - parameter grantInstanceToUserRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func grantInstanceToUser(grantInstanceToUserRequest: GrantInstanceToUserRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GrantInstanceToUserResult?, _ error: Error?) -> Void)) -> RequestTask {
        return grantInstanceToUserWithRequestBuilder(grantInstanceToUserRequest: grantInstanceToUserRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Grant Instance To User
     - POST /GrantInstanceToUser
     - Adds the specified items to the specified user's inventory
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter grantInstanceToUserRequest: (body)  (optional)
     - returns: RequestBuilder<GrantInstanceToUserResult> 
     */
    open class func grantInstanceToUserWithRequestBuilder(grantInstanceToUserRequest: GrantInstanceToUserRequest? = nil) -> RequestBuilder<GrantInstanceToUserResult> {
        let localVariablePath = "/GrantInstanceToUser"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: grantInstanceToUserRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GrantInstanceToUserResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Pay For Purchase (Private Preview)
     
     - parameter payForPurchaseRequest: (body) Selects a payment option for purchase order created via StartPurchase (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func payForPurchase(payForPurchaseRequest: PayForPurchaseRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: PayForPurchaseResult?, _ error: Error?) -> Void)) -> RequestTask {
        return payForPurchaseWithRequestBuilder(payForPurchaseRequest: payForPurchaseRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Pay For Purchase (Private Preview)
     - POST /PayForPurchase
     - Pay For Purchase (Private Preview)
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter payForPurchaseRequest: (body) Selects a payment option for purchase order created via StartPurchase (optional)
     - returns: RequestBuilder<PayForPurchaseResult> 
     */
    open class func payForPurchaseWithRequestBuilder(payForPurchaseRequest: PayForPurchaseRequest? = nil) -> RequestBuilder<PayForPurchaseResult> {
        let localVariablePath = "/PayForPurchase"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: payForPurchaseRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<PayForPurchaseResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Purchase Instance
     
     - parameter purchaseInstanceRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func purchaseInstance(purchaseInstanceRequest: PurchaseInstanceRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: PurchaseInstanceResult?, _ error: Error?) -> Void)) -> RequestTask {
        return purchaseInstanceWithRequestBuilder(purchaseInstanceRequest: purchaseInstanceRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Purchase Instance
     - POST /PurchaseInstance
     - Buys a single item with virtual currency. You must specify both the virtual currency to use to purchase, as well as what the client believes the price to be. This lets the server fail the purchase if the price has changed.
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter purchaseInstanceRequest: (body)  (optional)
     - returns: RequestBuilder<PurchaseInstanceResult> 
     */
    open class func purchaseInstanceWithRequestBuilder(purchaseInstanceRequest: PurchaseInstanceRequest? = nil) -> RequestBuilder<PurchaseInstanceResult> {
        let localVariablePath = "/PurchaseInstance"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: purchaseInstanceRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<PurchaseInstanceResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Start Purchase (Private Preview)
     
     - parameter body: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func startPurchase(body: String? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: String?, _ error: Error?) -> Void)) -> RequestTask {
        return startPurchaseWithRequestBuilder(body: body).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Start Purchase (Private Preview)
     - POST /StartPurchase
     - Creates an order for a list of items that needs to be purchased
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter body: (body)  (optional)
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func startPurchaseWithRequestBuilder(body: String? = nil) -> RequestBuilder<String> {
        let localVariablePath = "/StartPurchase"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<String>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Subtract User Virtual Currency
     
     - parameter subtractUserVirtualCurrencyRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func subtractUserVirtualCurrency(subtractUserVirtualCurrencyRequest: SubtractUserVirtualCurrencyRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: SubtractUserVirtualCurrencyResult?, _ error: Error?) -> Void)) -> RequestTask {
        return subtractUserVirtualCurrencyWithRequestBuilder(subtractUserVirtualCurrencyRequest: subtractUserVirtualCurrencyRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Subtract User Virtual Currency
     - POST /SubtractUserVirtualCurrency
     - Decrements the user's balance of the specified virtual currency by the stated amount. It is possible to make a VC balance negative with this API.
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter subtractUserVirtualCurrencyRequest: (body)  (optional)
     - returns: RequestBuilder<SubtractUserVirtualCurrencyResult> 
     */
    open class func subtractUserVirtualCurrencyWithRequestBuilder(subtractUserVirtualCurrencyRequest: SubtractUserVirtualCurrencyRequest? = nil) -> RequestBuilder<SubtractUserVirtualCurrencyResult> {
        let localVariablePath = "/SubtractUserVirtualCurrency"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: subtractUserVirtualCurrencyRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<SubtractUserVirtualCurrencyResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Unlock Container Instance
     
     - parameter unlockContainerInstanceRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func unlockContainerInstance(unlockContainerInstanceRequest: UnlockContainerInstanceRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: UnlockContainerInstanceResult?, _ error: Error?) -> Void)) -> RequestTask {
        return unlockContainerInstanceWithRequestBuilder(unlockContainerInstanceRequest: unlockContainerInstanceRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Unlock Container Instance
     - POST /UnlockContainerInstance
     - Opens the specified container, with the specified key (when required), and returns the contents of the opened container. If the container (and key when relevant) are consumable (RemainingUses > 0), their RemainingUses will be decremented, consistent with the operation of ConsumeItem.
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter unlockContainerInstanceRequest: (body)  (optional)
     - returns: RequestBuilder<UnlockContainerInstanceResult> 
     */
    open class func unlockContainerInstanceWithRequestBuilder(unlockContainerInstanceRequest: UnlockContainerInstanceRequest? = nil) -> RequestBuilder<UnlockContainerInstanceResult> {
        let localVariablePath = "/UnlockContainerInstance"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: unlockContainerInstanceRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UnlockContainerInstanceResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Update User Avatar
     
     - parameter updateUserAvatarRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func updateUserAvatar(updateUserAvatarRequest: UpdateUserAvatarRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: UpdateUserAvatarResult?, _ error: Error?) -> Void)) -> RequestTask {
        return updateUserAvatarWithRequestBuilder(updateUserAvatarRequest: updateUserAvatarRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Update User Avatar
     - PUT /UpdateUserAvatar
     - Update Avatar for the user
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter updateUserAvatarRequest: (body)  (optional)
     - returns: RequestBuilder<UpdateUserAvatarResult> 
     */
    open class func updateUserAvatarWithRequestBuilder(updateUserAvatarRequest: UpdateUserAvatarRequest? = nil) -> RequestBuilder<UpdateUserAvatarResult> {
        let localVariablePath = "/UpdateUserAvatar"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: updateUserAvatarRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UpdateUserAvatarResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PUT", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}
