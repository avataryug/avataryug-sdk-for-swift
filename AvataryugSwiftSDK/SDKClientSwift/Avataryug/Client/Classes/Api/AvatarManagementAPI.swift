import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
open class AvatarManagementAPI {

    /**
     Generate Avatar Mesh
     - parameter generateAvatarMeshRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func generateAvatarMesh(generateAvatarMeshRequest: GenerateAvatarMeshRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GenerateAvatarMeshResult?, _ error: Error?) -> Void)) -> RequestTask {
        return generateAvatarMeshWithRequestBuilder(generateAvatarMeshRequest: generateAvatarMeshRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Generate Avatar Mesh
     - POST /GenerateAvatarMesh
     - Generates the 3D mesh as per the configuration in the Config panel
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter generateAvatarMeshRequest: (body)  (optional)
     - returns: RequestBuilder<GenerateAvatarMeshResult>
     */
    open class func generateAvatarMeshWithRequestBuilder(generateAvatarMeshRequest: GenerateAvatarMeshRequest? = nil) -> RequestBuilder<GenerateAvatarMeshResult> {
        let localVariablePath = "/GenerateAvatarMesh"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: generateAvatarMeshRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GenerateAvatarMeshResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     * enum for parameter status
     */
    public enum Status_getAvatarPresets: Int, CaseIterable {
        case _0 = 0
        case _1 = 1
        case _2 = 2
        case _3 = 3
    }

    /**
     * enum for parameter gender
     */
    public enum Gender_getAvatarPresets: Int, CaseIterable {
        case _1 = 1
        case _2 = 2
        case _3 = 3
    }

    /**
     Get Avatar Presets
     
     - parameter status: (query) Status of the items Draft &#x3D; 0, Active &#x3D; 1, InActive &#x3D; 2, Expired &#x3D; 3
     - parameter gender: (query) Gender of the preset Male &#x3D; 1, Female &#x3D; 2, Both &#x3D; 3
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getAvatarPresets(status: Status_getAvatarPresets, gender: Gender_getAvatarPresets, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetAvatarPresetsResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getAvatarPresetsWithRequestBuilder(status: status, gender: gender).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Avatar Presets
     - GET /GetAvatarPresets
     - Get all avatar presets
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter status: (query) Status of the items Draft &#x3D; 0, Active &#x3D; 1, InActive &#x3D; 2, Expired &#x3D; 3
     - parameter gender: (query) Gender of the preset Male &#x3D; 1, Female &#x3D; 2, Both &#x3D; 3
     - returns: RequestBuilder<GetAvatarPresetsResult>
     */
    open class func getAvatarPresetsWithRequestBuilder(status: Status_getAvatarPresets, gender: Gender_getAvatarPresets) -> RequestBuilder<GetAvatarPresetsResult> {
        let localVariablePath = "/GetAvatarPresets"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "Status": (wrappedValue: status.encodeToJSON(), isExplode: true),
            "Gender": (wrappedValue: gender.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetAvatarPresetsResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Get Avatar Presets By ID
     
     - parameter avatarPresetID: (query) Unique Identifier for the Avatar Preset which is being requested
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getAvatarPresetsByID(avatarPresetID: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetAvatarPresetByIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getAvatarPresetsByIDWithRequestBuilder(avatarPresetID: avatarPresetID).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Avatar Presets By ID
     - GET /GetAvatarPresetsByID
     - Retrive Avatar preset by ID
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter avatarPresetID: (query) Unique Identifier for the Avatar Preset which is being requested
     - returns: RequestBuilder<GetAvatarPresetByIDResult>
     */
    open class func getAvatarPresetsByIDWithRequestBuilder(avatarPresetID: String) -> RequestBuilder<GetAvatarPresetByIDResult> {
        let localVariablePath = "/GetAvatarPresetsByID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "AvatarPresetID": (wrappedValue: avatarPresetID.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetAvatarPresetByIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     * enum for parameter status
     */
    public enum Status_getClips: Int, CaseIterable {
        case _0 = 0
        case _1 = 1
        case _2 = 2
    }

    /**
     Get Clips
     
     - parameter status: (query) Status of the clips Draft&#x3D; 0, Active&#x3D;1, InActive&#x3D;2
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getClips(status: Status_getClips, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetClipsResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getClipsWithRequestBuilder(status: status).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Clips
     - GET /GetClips
     - Get all the clips by Active status
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter status: (query) Status of the clips Draft&#x3D; 0, Active&#x3D;1, InActive&#x3D;2
     - returns: RequestBuilder<GetClipsResult>
     */
    open class func getClipsWithRequestBuilder(status: Status_getClips) -> RequestBuilder<GetClipsResult> {
        let localVariablePath = "/GetClips"
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

        let localVariableRequestBuilder: RequestBuilder<GetClipsResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Get Clips By ID
     
     - parameter clipID: (query) Unique Identifier for the clip
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getClipsByID(clipID: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetClipsByIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getClipsByIDWithRequestBuilder(clipID: clipID).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Clips By ID
     - GET /GetClipsByID
     - Get the specified clip's details by providing ClipID
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter clipID: (query) Unique Identifier for the clip
     - returns: RequestBuilder<GetClipsByIDResult>
     */
    open class func getClipsByIDWithRequestBuilder(clipID: String) -> RequestBuilder<GetClipsByIDResult> {
        let localVariablePath = "/GetClipsByID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "ClipID": (wrappedValue: clipID.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetClipsByIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Get Expression By ID
     
     - parameter expressionID: (query) Unique Identifier for the expression
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getExpressionByID(expressionID: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetExpressionByIDResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getExpressionByIDWithRequestBuilder(expressionID: expressionID).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Expression By ID
     - GET /GetExpressionByID
     - Get the specified expression details by providing ExpressionID
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter expressionID: (query) Unique Identifier for the expression
     - returns: RequestBuilder<GetExpressionByIDResult>
     */
    open class func getExpressionByIDWithRequestBuilder(expressionID: String) -> RequestBuilder<GetExpressionByIDResult> {
        let localVariablePath = "/GetExpressionByID"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "ExpressionID": (wrappedValue: expressionID.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetExpressionByIDResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     * enum for parameter status
     */
    public enum Status_getExpressions: Int, CaseIterable {
        case _0 = 0
        case _1 = 1
        case _2 = 2
    }

    /**
     Get Expressions
     
     - parameter status: (query) Status of Expressions Draft &#x3D; 0, Active &#x3D; 1, InActive&#x3D;2
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getExpressions(status: Status_getExpressions, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetExpressionsResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getExpressionsWithRequestBuilder(status: status).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Expressions
     - GET /GetExpressions
     - Get all the active expressions
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter status: (query) Status of Expressions Draft &#x3D; 0, Active &#x3D; 1, InActive&#x3D;2
     - returns: RequestBuilder<GetExpressionsResult>
     */
    open class func getExpressionsWithRequestBuilder(status: Status_getExpressions) -> RequestBuilder<GetExpressionsResult> {
        let localVariablePath = "/GetExpressions"
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

        let localVariableRequestBuilder: RequestBuilder<GetExpressionsResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     * enum for parameter platform
     */
    public enum Platform_getGetallbucketvertices: String, CaseIterable {
        case unreal = "Unreal"
        case unity = "Unity"
        case threeJS = "ThreeJS"
        case ios = "iOS"
        case android = "Android"
        case blender = "Blender"
    }

    /**
     Get All Bucket Vertices
     
     - parameter platform: (query) Name of the platform. I.e. Unreal, Unity
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getGetallbucketvertices(platform: Platform_getGetallbucketvertices, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetAllBucketVerticesResult?, _ error: Error?) -> Void)) -> RequestTask {
        return getGetallbucketverticesWithRequestBuilder(platform: platform).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get All Bucket Vertices
     - GET /GetAllBucketVertices
     - Get vertices for all buckets
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter platform: (query) Name of the platform. I.e. Unreal, Unity
     - returns: RequestBuilder<GetAllBucketVerticesResult>
     */
    open class func getGetallbucketverticesWithRequestBuilder(platform: Platform_getGetallbucketvertices) -> RequestBuilder<GetAllBucketVerticesResult> {
        let localVariablePath = "/GetAllBucketVertices"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "Platform": (wrappedValue: platform.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetAllBucketVerticesResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Grant Avatar Preset Items To User
     
     - parameter grantAvatarPresetItemsToUserRequest: (body) Request payload (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func grantAvatarPresetItemsToUser(grantAvatarPresetItemsToUserRequest: GrantAvatarPresetItemsToUserRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GrantAvatarPresetItemsToUserResult?, _ error: Error?) -> Void)) -> RequestTask {
        return grantAvatarPresetItemsToUserWithRequestBuilder(grantAvatarPresetItemsToUserRequest: grantAvatarPresetItemsToUserRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Grant Avatar Preset Items To User
     - POST /GrantAvatarPresetItemsToUser
     - Grant Avatar Preset Items To User
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter grantAvatarPresetItemsToUserRequest: (body) Request payload (optional)
     - returns: RequestBuilder<GrantAvatarPresetItemsToUserResult>
     */
    open class func grantAvatarPresetItemsToUserWithRequestBuilder(grantAvatarPresetItemsToUserRequest: GrantAvatarPresetItemsToUserRequest? = nil) -> RequestBuilder<GrantAvatarPresetItemsToUserResult> {
        let localVariablePath = "/GrantAvatarPresetItemsToUser"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: grantAvatarPresetItemsToUserRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GrantAvatarPresetItemsToUserResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Grant Avatar Preset To User
     
     - parameter grantAvatarPresetToUserRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func grantAvatarPresetToUser(grantAvatarPresetToUserRequest: GrantAvatarPresetToUserRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GrantAvatarPresetToUserResult?, _ error: Error?) -> Void)) -> RequestTask {
        return grantAvatarPresetToUserWithRequestBuilder(grantAvatarPresetToUserRequest: grantAvatarPresetToUserRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Grant Avatar Preset To User
     - POST /GrantAvatarPresetToUser
     - Grant Avatar Preset To User
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter grantAvatarPresetToUserRequest: (body)  (optional)
     - returns: RequestBuilder<GrantAvatarPresetToUserResult>
     */
    open class func grantAvatarPresetToUserWithRequestBuilder(grantAvatarPresetToUserRequest: GrantAvatarPresetToUserRequest? = nil) -> RequestBuilder<GrantAvatarPresetToUserResult> {
        let localVariablePath = "/GrantAvatarPresetToUser"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: grantAvatarPresetToUserRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GrantAvatarPresetToUserResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Render Avatar Image
     
     - parameter renderAvatarImageRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func renderAvatarImage(renderAvatarImageRequest: RenderAvatarImageRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: RenderAvatarImageResult?, _ error: Error?) -> Void)) -> RequestTask {
        return renderAvatarImageWithRequestBuilder(renderAvatarImageRequest: renderAvatarImageRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Render Avatar Image
     - POST /RenderAvatarImage
     - Render Avatar Image
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter renderAvatarImageRequest: (body)  (optional)
     - returns: RequestBuilder<RenderAvatarImageResult>
     */
    open class func renderAvatarImageWithRequestBuilder(renderAvatarImageRequest: RenderAvatarImageRequest? = nil) -> RequestBuilder<RenderAvatarImageResult> {
        let localVariablePath = "/RenderAvatarImage"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: renderAvatarImageRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<RenderAvatarImageResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Sync Avatars
     
     - parameter syncAvatarsRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func syncAvatars(syncAvatarsRequest: SyncAvatarsRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: SyncAvatarsResult?, _ error: Error?) -> Void)) -> RequestTask {
        return syncAvatarsWithRequestBuilder(syncAvatarsRequest: syncAvatarsRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Sync Avatars
     - POST /SyncAvatars
     - Creates missing avatars into the mentioned platform for the user
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter syncAvatarsRequest: (body)  (optional)
     - returns: RequestBuilder<SyncAvatarsResult>
     */
    open class func syncAvatarsWithRequestBuilder(syncAvatarsRequest: SyncAvatarsRequest? = nil) -> RequestBuilder<SyncAvatarsResult> {
        let localVariablePath = "/SyncAvatars"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: syncAvatarsRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<SyncAvatarsResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
    
    
  
    @discardableResult
    open class func updateAvatar(updateAvatarRequest: UpdateAvatarRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: String?, _ error: Error?) -> Void)) -> RequestTask {
        return updateAvatarRequestBuilder(updateAvatarRequest: updateAvatarRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }


    open class func updateAvatarRequestBuilder(updateAvatarRequest: UpdateAvatarRequest? = nil) -> RequestBuilder<String> {
        let localVariablePath = "/UpdateAvatar"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: updateAvatarRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<String>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PATCH", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
    
    
    @discardableResult
    open class func createAvatar(createAvatarRequest: CreateAvatarRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: CreateAvatarResponse?, _ error: Error?) -> Void)) -> RequestTask {
        return createAvatarRequestBuilder(createAvatarRequest: createAvatarRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    open class func createAvatarRequestBuilder(createAvatarRequest: CreateAvatarRequest? = nil) -> RequestBuilder<CreateAvatarResponse> {
        let localVariablePath = "/CreateAvatar"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: createAvatarRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<CreateAvatarResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}
