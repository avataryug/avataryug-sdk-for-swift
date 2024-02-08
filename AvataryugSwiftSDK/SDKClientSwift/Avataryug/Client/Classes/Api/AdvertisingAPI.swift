import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
open class AdvertisingAPI {

    /**
     Get Ad Placement By ID
     - parameter placementID: (query) Unique identifier of the placement 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getAdPlacementByID(placementID: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetAdPlacementByIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getAdPlacementByIDWithRequestBuilder(placementID: placementID).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Ad Placement By ID
     - GET /GetAdPlacementByID
     - Returns a list of ad placements by ID
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter placementID: (query) Unique identifier of the placement 
     - returns: RequestBuilder<GetAdPlacementByIDResult> 
     */
    open class func getAdPlacementByIDWithRequestBuilder(placementID: String) -> RequestBuilder<GetAdPlacementByIDResult> {
        let localVariablePath = "/GetAdPlacementByID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "PlacementID": (wrappedValue: placementID.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetAdPlacementByIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Grant Ads Reward
     
     - parameter grantAdsRewardRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func grantAdsReward(grantAdsRewardRequest: GrantAdsRewardRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GrantAdsRewardResult?, _ error: Error?) -> Void)) -> RequestTask {
        return grantAdsRewardWithRequestBuilder(grantAdsRewardRequest: grantAdsRewardRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Grant Ads Reward
     - POST /GrantAdsReward
     - Grants ads rewards into user wallet (if currency) or inventory (if items)
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter grantAdsRewardRequest: (body)  (optional)
     - returns: RequestBuilder<GrantAdsRewardResult> 
     */
    open class func grantAdsRewardWithRequestBuilder(grantAdsRewardRequest: GrantAdsRewardRequest? = nil) -> RequestBuilder<GrantAdsRewardResult> {
        let localVariablePath = "/GrantAdsReward"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: grantAdsRewardRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GrantAdsRewardResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Record Ads Activity
     
     - parameter recordAdsActivityRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func recordAdsActivity(recordAdsActivityRequest: RecordAdsActivityRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: RecordAdsActivityResult?, _ error: Error?) -> Void)) -> RequestTask {
        return recordAdsActivityWithRequestBuilder(recordAdsActivityRequest: recordAdsActivityRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Record Ads Activity
     - POST /RecordAdsActivity
     - Stores the Ads activity related data into our system for reporting
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter recordAdsActivityRequest: (body)  (optional)
     - returns: RequestBuilder<RecordAdsActivityResult> 
     */
    open class func recordAdsActivityWithRequestBuilder(recordAdsActivityRequest: RecordAdsActivityRequest? = nil) -> RequestBuilder<RecordAdsActivityResult> {
        let localVariablePath = "/RecordAdsActivity"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: recordAdsActivityRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<RecordAdsActivityResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}
