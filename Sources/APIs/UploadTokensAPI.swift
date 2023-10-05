//
// UploadTokensAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class UploadTokensAPI {

    /**
     Generate an upload token
     
     - parameter tokenCreationPayload: (body)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects.
     */
    @discardableResult
    open class func createToken(tokenCreationPayload: TokenCreationPayload, apiResponseQueue: DispatchQueue = ApiVideoClient.apiResponseQueue, completion: @escaping ((_ data: UploadToken?, _ error: Error?) -> Void)) -> RequestTask {
            return createTokenWithRequestBuilder(tokenCreationPayload: tokenCreationPayload).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    completion(response.body, nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
    }


    /**
     Generate an upload token
     - POST /upload-tokens
     - Generates an upload token that can be used to replace the API Key. More information can be found [here](https://docs.api.video/vod/delegated-upload-tokens)
     - parameter tokenCreationPayload: (body)  
     - returns: RequestBuilder<UploadToken> 
     */
    open class func createTokenWithRequestBuilder(tokenCreationPayload: TokenCreationPayload) -> RequestBuilder<UploadToken> {
        let localVariablePath = "/upload-tokens"
        let localVariableURLString = ApiVideoClient.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: tokenCreationPayload)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UploadToken>.Type = ApiVideoClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }


    /**
     Retrieve upload token
     
     - parameter uploadToken: (path) The unique identifier for the token you want information about. 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects.
     */
    @discardableResult
    open class func getToken(uploadToken: String, apiResponseQueue: DispatchQueue = ApiVideoClient.apiResponseQueue, completion: @escaping ((_ data: UploadToken?, _ error: Error?) -> Void)) -> RequestTask {
            return getTokenWithRequestBuilder(uploadToken: uploadToken).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    completion(response.body, nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
    }


    /**
     Retrieve upload token
     - GET /upload-tokens/{uploadToken}
     - Retrieve details about a specific upload token by id.
     - parameter uploadToken: (path) The unique identifier for the token you want information about. 
     - returns: RequestBuilder<UploadToken> 
     */
    open class func getTokenWithRequestBuilder(uploadToken: String) -> RequestBuilder<UploadToken> {
        var localVariablePath = "/upload-tokens/{uploadToken}"
        let uploadTokenPreEscape = "\(APIHelper.mapValueToPathItem(uploadToken))"
        let uploadTokenPostEscape = uploadTokenPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{uploadToken}", with: uploadTokenPostEscape, options: .literal, range: nil)
        let localVariableURLString = ApiVideoClient.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UploadToken>.Type = ApiVideoClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }


    /**
     Delete an upload token
     
     - parameter uploadToken: (path) The unique identifier for the upload token you want to delete. Deleting a token will make it so the token can no longer be used for authentication. 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects.
     */
    @discardableResult
    open class func deleteToken(uploadToken: String, apiResponseQueue: DispatchQueue = ApiVideoClient.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) -> RequestTask {
            return deleteTokenWithRequestBuilder(uploadToken: uploadToken).execute(apiResponseQueue) { result in
                switch result {
                case .success:
                    completion((), nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
    }


    /**
     Delete an upload token
     - DELETE /upload-tokens/{uploadToken}
     - Delete an existing upload token. This is especially useful for tokens you may have created that do not expire.
     - parameter uploadToken: (path) The unique identifier for the upload token you want to delete. Deleting a token will make it so the token can no longer be used for authentication. 
     - returns: RequestBuilder<Void> 
     */
    open class func deleteTokenWithRequestBuilder(uploadToken: String) -> RequestBuilder<Void> {
        var localVariablePath = "/upload-tokens/{uploadToken}"
        let uploadTokenPreEscape = "\(APIHelper.mapValueToPathItem(uploadToken))"
        let uploadTokenPostEscape = uploadTokenPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{uploadToken}", with: uploadTokenPostEscape, options: .literal, range: nil)
        let localVariableURLString = ApiVideoClient.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = ApiVideoClient.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "DELETE", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }


    /**
     * enum for parameter sortBy
     */
    public enum SortByList: String, CaseIterable {
        case createdat = "createdAt"
        case ttl = "ttl"
    }

    /**
     * enum for parameter sortOrder
     */
    public enum SortOrderList: String, CaseIterable {
        case asc = "asc"
        case desc = "desc"
    }

    /**
     List all active upload tokens
     
     - parameter sortBy: (query) Allowed: createdAt, ttl. You can use these to sort by when a token was created, or how much longer the token will be active (ttl - time to live). Date and time is presented in ISO-8601 format. (optional)
     - parameter sortOrder: (query) Allowed: asc, desc. Ascending is 0-9 or A-Z. Descending is 9-0 or Z-A. (optional)
     - parameter currentPage: (query) Choose the number of search results to return per page. Minimum value: 1 (optional, default to 1)
     - parameter pageSize: (query) Results per page. Allowed values 1-100, default is 25. (optional, default to 25)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects.
     */
    @discardableResult
    open class func list(sortBy: SortByList? = nil, sortOrder: SortOrderList? = nil, currentPage: Int? = nil, pageSize: Int? = nil, apiResponseQueue: DispatchQueue = ApiVideoClient.apiResponseQueue, completion: @escaping ((_ data: TokenListResponse?, _ error: Error?) -> Void)) -> RequestTask {
            return listWithRequestBuilder(sortBy: sortBy, sortOrder: sortOrder, currentPage: currentPage, pageSize: pageSize).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    completion(response.body, nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
    }


    /**
     List all active upload tokens
     - GET /upload-tokens
     - Retrieve a list of all currently active delegated tokens.
     - parameter sortBy: (query) Allowed: createdAt, ttl. You can use these to sort by when a token was created, or how much longer the token will be active (ttl - time to live). Date and time is presented in ISO-8601 format. (optional)
     - parameter sortOrder: (query) Allowed: asc, desc. Ascending is 0-9 or A-Z. Descending is 9-0 or Z-A. (optional)
     - parameter currentPage: (query) Choose the number of search results to return per page. Minimum value: 1 (optional, default to 1)
     - parameter pageSize: (query) Results per page. Allowed values 1-100, default is 25. (optional, default to 25)
     - returns: RequestBuilder<TokenListResponse> 
     */
    open class func listWithRequestBuilder(sortBy: SortByList? = nil, sortOrder: SortOrderList? = nil, currentPage: Int? = nil, pageSize: Int? = nil) -> RequestBuilder<TokenListResponse> {
        let localVariablePath = "/upload-tokens"
        let localVariableURLString = ApiVideoClient.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "sortBy": sortBy?.encodeToJSON(),
            "sortOrder": sortOrder?.encodeToJSON(),
            "currentPage": currentPage?.encodeToJSON(),
            "pageSize": pageSize?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<TokenListResponse>.Type = ApiVideoClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

}
