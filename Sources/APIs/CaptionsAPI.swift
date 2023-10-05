//
// CaptionsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class CaptionsAPI {

    /**
     Upload a caption
     
     - parameter videoId: (path) The unique identifier for the video you want to add a caption to. 
     - parameter language: (path) A valid BCP 47 language representation. 
     - parameter file: (form) The video text track (VTT) you want to upload. 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects.
     */
    @discardableResult
    open class func upload(videoId: String, language: String, file: URL, apiResponseQueue: DispatchQueue = ApiVideoClient.apiResponseQueue, completion: @escaping ((_ data: Caption?, _ error: Error?) -> Void)) -> RequestTask {
            return uploadWithRequestBuilder(videoId: videoId, language: language, file: file).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    completion(response.body, nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
    }


    /**
     Upload a caption
     - POST /videos/{videoId}/captions/{language}
     - Upload a VTT file to add captions to your video. More information can be found [here](https://docs.api.video/vod/add-captions)
     - parameter videoId: (path) The unique identifier for the video you want to add a caption to. 
     - parameter language: (path) A valid BCP 47 language representation. 
     - parameter file: (form) The video text track (VTT) you want to upload. 
     - returns: RequestBuilder<Caption> 
     */
    open class func uploadWithRequestBuilder(videoId: String, language: String, file: URL) -> RequestBuilder<Caption> {
        var localVariablePath = "/videos/{videoId}/captions/{language}"
        let videoIdPreEscape = "\(APIHelper.mapValueToPathItem(videoId))"
        let videoIdPostEscape = videoIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{videoId}", with: videoIdPostEscape, options: .literal, range: nil)
        let languagePreEscape = "\(APIHelper.mapValueToPathItem(language))"
        let languagePostEscape = languagePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{language}", with: languagePostEscape, options: .literal, range: nil)
        let localVariableURLString = ApiVideoClient.basePath + localVariablePath
        let localVariableFormParams: [String: Any?] = [
            "file": file.encodeToJSON(),
        ]
        let localVariableNonNullParameters = APIHelper.rejectNil(localVariableFormParams)
        let localVariableParameters = APIHelper.convertBoolToString(localVariableNonNullParameters)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "Content-Type": "multipart/form-data",
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Caption>.Type = ApiVideoClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }


    /**
     Retrieve a caption
     
     - parameter videoId: (path) The unique identifier for the video you want captions for. 
     - parameter language: (path) A valid [BCP 47](https://github.com/libyal/libfwnt/wiki/Language-Code-identifiers) language representation 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects.
     */
    @discardableResult
    open class func get(videoId: String, language: String, apiResponseQueue: DispatchQueue = ApiVideoClient.apiResponseQueue, completion: @escaping ((_ data: Caption?, _ error: Error?) -> Void)) -> RequestTask {
            return getWithRequestBuilder(videoId: videoId, language: language).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    completion(response.body, nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
    }


    /**
     Retrieve a caption
     - GET /videos/{videoId}/captions/{language}
     - Retrieve a caption for a video in a specific language. If the language is available, the caption is returned. Otherwise, you will get a error indicating the caption was not found.

Tutorials that use the [captions endpoint](https://api.video/blog/endpoints/captions).
     - parameter videoId: (path) The unique identifier for the video you want captions for. 
     - parameter language: (path) A valid [BCP 47](https://github.com/libyal/libfwnt/wiki/Language-Code-identifiers) language representation 
     - returns: RequestBuilder<Caption> 
     */
    open class func getWithRequestBuilder(videoId: String, language: String) -> RequestBuilder<Caption> {
        var localVariablePath = "/videos/{videoId}/captions/{language}"
        let videoIdPreEscape = "\(APIHelper.mapValueToPathItem(videoId))"
        let videoIdPostEscape = videoIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{videoId}", with: videoIdPostEscape, options: .literal, range: nil)
        let languagePreEscape = "\(APIHelper.mapValueToPathItem(language))"
        let languagePostEscape = languagePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{language}", with: languagePostEscape, options: .literal, range: nil)
        let localVariableURLString = ApiVideoClient.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Caption>.Type = ApiVideoClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }


    /**
     Update a caption
     
     - parameter videoId: (path) The unique identifier for the video you want to have automatic captions for. 
     - parameter language: (path) A valid [BCP 47](https://github.com/libyal/libfwnt/wiki/Language-Code-identifiers) language representation. 
     - parameter captionsUpdatePayload: (body)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects.
     */
    @discardableResult
    open class func update(videoId: String, language: String, captionsUpdatePayload: CaptionsUpdatePayload, apiResponseQueue: DispatchQueue = ApiVideoClient.apiResponseQueue, completion: @escaping ((_ data: Caption?, _ error: Error?) -> Void)) -> RequestTask {
            return updateWithRequestBuilder(videoId: videoId, language: language, captionsUpdatePayload: captionsUpdatePayload).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    completion(response.body, nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
    }


    /**
     Update a caption
     - PATCH /videos/{videoId}/captions/{language}
     - To have the captions on automatically, use this method to set default: true.
     - parameter videoId: (path) The unique identifier for the video you want to have automatic captions for. 
     - parameter language: (path) A valid [BCP 47](https://github.com/libyal/libfwnt/wiki/Language-Code-identifiers) language representation. 
     - parameter captionsUpdatePayload: (body)  
     - returns: RequestBuilder<Caption> 
     */
    open class func updateWithRequestBuilder(videoId: String, language: String, captionsUpdatePayload: CaptionsUpdatePayload) -> RequestBuilder<Caption> {
        var localVariablePath = "/videos/{videoId}/captions/{language}"
        let videoIdPreEscape = "\(APIHelper.mapValueToPathItem(videoId))"
        let videoIdPostEscape = videoIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{videoId}", with: videoIdPostEscape, options: .literal, range: nil)
        let languagePreEscape = "\(APIHelper.mapValueToPathItem(language))"
        let languagePostEscape = languagePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{language}", with: languagePostEscape, options: .literal, range: nil)
        let localVariableURLString = ApiVideoClient.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: captionsUpdatePayload)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Caption>.Type = ApiVideoClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PATCH", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }


    /**
     Delete a caption
     
     - parameter videoId: (path) The unique identifier for the video you want to delete a caption from. 
     - parameter language: (path) A valid [BCP 47](https://github.com/libyal/libfwnt/wiki/Language-Code-identifiers) language representation. 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects.
     */
    @discardableResult
    open class func delete(videoId: String, language: String, apiResponseQueue: DispatchQueue = ApiVideoClient.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) -> RequestTask {
            return deleteWithRequestBuilder(videoId: videoId, language: language).execute(apiResponseQueue) { result in
                switch result {
                case .success:
                    completion((), nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
    }


    /**
     Delete a caption
     - DELETE /videos/{videoId}/captions/{language}
     - Delete a caption in a specific language by by video id.
     - parameter videoId: (path) The unique identifier for the video you want to delete a caption from. 
     - parameter language: (path) A valid [BCP 47](https://github.com/libyal/libfwnt/wiki/Language-Code-identifiers) language representation. 
     - returns: RequestBuilder<Void> 
     */
    open class func deleteWithRequestBuilder(videoId: String, language: String) -> RequestBuilder<Void> {
        var localVariablePath = "/videos/{videoId}/captions/{language}"
        let videoIdPreEscape = "\(APIHelper.mapValueToPathItem(videoId))"
        let videoIdPostEscape = videoIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{videoId}", with: videoIdPostEscape, options: .literal, range: nil)
        let languagePreEscape = "\(APIHelper.mapValueToPathItem(language))"
        let languagePostEscape = languagePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{language}", with: languagePostEscape, options: .literal, range: nil)
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
     List video captions
     
     - parameter videoId: (path) The unique identifier for the video you want to retrieve a list of captions for. 
     - parameter currentPage: (query) Choose the number of search results to return per page. Minimum value: 1 (optional, default to 1)
     - parameter pageSize: (query) Results per page. Allowed values 1-100, default is 25. (optional, default to 25)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects.
     */
    @discardableResult
    open class func list(videoId: String, currentPage: Int? = nil, pageSize: Int? = nil, apiResponseQueue: DispatchQueue = ApiVideoClient.apiResponseQueue, completion: @escaping ((_ data: CaptionsListResponse?, _ error: Error?) -> Void)) -> RequestTask {
            return listWithRequestBuilder(videoId: videoId, currentPage: currentPage, pageSize: pageSize).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    completion(response.body, nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
    }


    /**
     List video captions
     - GET /videos/{videoId}/captions
     - Retrieve a list of available captions by video id.
     - parameter videoId: (path) The unique identifier for the video you want to retrieve a list of captions for. 
     - parameter currentPage: (query) Choose the number of search results to return per page. Minimum value: 1 (optional, default to 1)
     - parameter pageSize: (query) Results per page. Allowed values 1-100, default is 25. (optional, default to 25)
     - returns: RequestBuilder<CaptionsListResponse> 
     */
    open class func listWithRequestBuilder(videoId: String, currentPage: Int? = nil, pageSize: Int? = nil) -> RequestBuilder<CaptionsListResponse> {
        var localVariablePath = "/videos/{videoId}/captions"
        let videoIdPreEscape = "\(APIHelper.mapValueToPathItem(videoId))"
        let videoIdPostEscape = videoIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{videoId}", with: videoIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = ApiVideoClient.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "currentPage": currentPage?.encodeToJSON(),
            "pageSize": pageSize?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<CaptionsListResponse>.Type = ApiVideoClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

}
