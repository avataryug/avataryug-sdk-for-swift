import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
open class EconomyAPI {

    /**
     Get Economy Bundles by ID
     - parameter bundleID: (query) Unqiue identifier for the bundle which is being requested. 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getEconomyBundleByID(bundleID: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetEconomyBundleByIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getEconomyBundleByIDWithRequestBuilder(bundleID: bundleID).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Economy Bundles by ID
     - GET /GetEconomyBundleByID
     - Get Economy Bundles by ID
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter bundleID: (query) Unqiue identifier for the bundle which is being requested. 
     - returns: RequestBuilder<GetEconomyBundleByIDResult> 
     */
    open class func getEconomyBundleByIDWithRequestBuilder(bundleID: String) -> RequestBuilder<GetEconomyBundleByIDResult> {
        let localVariablePath = "/GetEconomyBundleByID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "BundleID": (wrappedValue: bundleID.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetEconomyBundleByIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     * enum for parameter status
     */
    public enum Status_getEconomyBundles: Int, CaseIterable {
        case _0 = 0
        case _1 = 1
        case _2 = 2
        case _3 = 3
    }

    /**
     Get Economy Bundles
     
     - parameter status: (query) Status of the bundles Draft &#x3D; 0, Active &#x3D; 1, InActive &#x3D; 2, Expired &#x3D; 3 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getEconomyBundles(status: Status_getEconomyBundles, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetEconomyBundlesResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getEconomyBundlesWithRequestBuilder(status: status).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Economy Bundles
     - GET /GetEconomyBundles
     - Get Economy Bundles
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter status: (query) Status of the bundles Draft &#x3D; 0, Active &#x3D; 1, InActive &#x3D; 2, Expired &#x3D; 3 
     - returns: RequestBuilder<GetEconomyBundlesResult> 
     */
    open class func getEconomyBundlesWithRequestBuilder(status: Status_getEconomyBundles) -> RequestBuilder<GetEconomyBundlesResult> {
        let localVariablePath = "/GetEconomyBundles"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "Status": (wrappedValue: status.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetEconomyBundlesResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Get Economy Container by ID
     
     - parameter containerID: (query) Unqiue identifier for the container which is being requested. 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getEconomyContainerByID(containerID: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetEconomyContainerByIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getEconomyContainerByIDWithRequestBuilder(containerID: containerID).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Economy Container by ID
     - GET /GetEconomyContainerByID
     - Get Economy Container by ID
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter containerID: (query) Unqiue identifier for the container which is being requested. 
     - returns: RequestBuilder<GetEconomyContainerByIDResult> 
     */
    open class func getEconomyContainerByIDWithRequestBuilder(containerID: String) -> RequestBuilder<GetEconomyContainerByIDResult> {
        let localVariablePath = "/GetEconomyContainerByID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "ContainerID": (wrappedValue: containerID.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetEconomyContainerByIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     * enum for parameter status
     */
    public enum Status_getEconomyContainers: Int, CaseIterable {
        case _0 = 0
        case _1 = 1
        case _2 = 2
        case _3 = 3
    }

    /**
     Get Economy Containers
     
     - parameter status: (query) Status of the containers Draft &#x3D; 0, Active &#x3D; 1, InActive &#x3D; 2, Expired &#x3D; 3 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getEconomyContainers(status: Status_getEconomyContainers, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetEconomyContainersResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getEconomyContainersWithRequestBuilder(status: status).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Economy Containers
     - GET /GetEconomyContainers
     - Get Economy Containers
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter status: (query) Status of the containers Draft &#x3D; 0, Active &#x3D; 1, InActive &#x3D; 2, Expired &#x3D; 3 
     - returns: RequestBuilder<GetEconomyContainersResult> 
     */
    open class func getEconomyContainersWithRequestBuilder(status: Status_getEconomyContainers) -> RequestBuilder<GetEconomyContainersResult> {
        let localVariablePath = "/GetEconomyContainers"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "Status": (wrappedValue: status.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetEconomyContainersResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Get Economy Items
     
     - parameter category: (query) Category of the Item 
     - parameter status: (query) Status of the items Draft &#x3D; 0, Active &#x3D; 1, InActive &#x3D; 2, Expired &#x3D; 3 
     - parameter gender: (query) Type of the item for which gender it belongs to Male &#x3D; 1, Female &#x3D; 2, Common &#x3D; 3 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getEconomyItems(category: String, status: Int, gender: Int, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetEconomyItemsResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getEconomyItemsWithRequestBuilder(category: category, status: status, gender: gender).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                if(ProjectSettings.shared.isDebug)
                {
                    print(response)
                }
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Economy Items
     - GET /GetEconomyItems
     - Get Economy Items
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter category: (query) Category of the Item 
     - parameter status: (query) Status of the items Draft &#x3D; 0, Active &#x3D; 1, InActive &#x3D; 2, Expired &#x3D; 3 
     - parameter gender: (query) Type of the item for which gender it belongs to Male &#x3D; 1, Female &#x3D; 2, Common &#x3D; 3 
     - returns: RequestBuilder<GetEconomyItemsResult> 
     */
    open class func getEconomyItemsWithRequestBuilder(category: String, status: Int, gender: Int) -> RequestBuilder<GetEconomyItemsResult> {
        let localVariablePath = "/GetEconomyItems"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "Category": (wrappedValue: category.encodeToJSON(), isExplode: true),
            "Status": (wrappedValue: status.encodeToJSON(), isExplode: true),
            "Gender": (wrappedValue: gender.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetEconomyItemsResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Get Economy Item by ID
     
     - parameter itemID: (query) Unqiue identifier for the item which is being requested. 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getEconomyItemsByID(itemID: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetEconomyItemsByIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getEconomyItemsByIDWithRequestBuilder(itemID: itemID).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Economy Item by ID
     - GET /GetEconomyItemsByID
     - Get Economy Item by ID
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter itemID: (query) Unqiue identifier for the item which is being requested. 
     - returns: RequestBuilder<GetEconomyItemsByIDResult> 
     */
    open class func getEconomyItemsByIDWithRequestBuilder(itemID: String) -> RequestBuilder<GetEconomyItemsByIDResult> {
        let localVariablePath = "/GetEconomyItemsByID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "ItemID": (wrappedValue: itemID.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetEconomyItemsByIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     * enum for parameter status
     */
    public enum Status_getEconomyStores: Int, CaseIterable {
        case _0 = 0
        case _1 = 1
        case _2 = 2
        case _3 = 3
    }

    /**
     Get Economy Stores
     
     - parameter status: (query) Status of the Stores Draft &#x3D; 0, Active &#x3D; 1, InActive &#x3D; 2, Expired &#x3D; 3 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getEconomyStores(status: Status_getEconomyStores, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetEconomyStoresResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getEconomyStoresWithRequestBuilder(status: status).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Economy Stores
     - GET /GetEconomyStores
     - Get Economy Stores
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter status: (query) Status of the Stores Draft &#x3D; 0, Active &#x3D; 1, InActive &#x3D; 2, Expired &#x3D; 3 
     - returns: RequestBuilder<GetEconomyStoresResult> 
     */
    open class func getEconomyStoresWithRequestBuilder(status: Status_getEconomyStores) -> RequestBuilder<GetEconomyStoresResult> {
        let localVariablePath = "/GetEconomyStores"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "Status": (wrappedValue: status.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetEconomyStoresResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Get Store Items by ID
     
     - parameter storeID: (query) Unqiue identifier for the store which is being requested. 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getStoreItemsByID(storeID: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetStoreItemsByIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getStoreItemsByIDWithRequestBuilder(storeID: storeID).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Store Items by ID
     - GET /GetStoreItemsByID
     - Retrieves the set of items defined for the specified store, including all prices defined
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter storeID: (query) Unqiue identifier for the store which is being requested. 
     - returns: RequestBuilder<GetStoreItemsByIDResult> 
     */
    open class func getStoreItemsByIDWithRequestBuilder(storeID: String) -> RequestBuilder<GetStoreItemsByIDResult> {
        let localVariablePath = "/GetStoreItemsByID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "StoreID": (wrappedValue: storeID.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetStoreItemsByIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}
