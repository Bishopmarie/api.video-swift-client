import Foundation
import Alamofire

public class ChunkRequestTask<T>: RequestTask {
    private let lock = NSRecursiveLock()
    private var requestBuilders: [RequestBuilder<T>] = []
    private let apiResponseQueue: DispatchQueue

    private let onProgressReady: ((Progress) -> Void)?
    private let completion: (T?, Error?) -> Void

    private let _downloadProgress: Progress
    private let _uploadProgress: Progress

    internal init(uploadSize: Int64,
                  downloadSize: Int64,
                  onProgressReady: ((Progress) -> Void)? = nil,
                  apiResponseQueue: DispatchQueue = ApiVideoClient.apiResponseQueue,
                  completion: @escaping (_ data: T?, _ error: Error?) -> Void) {
        self.onProgressReady = onProgressReady
        self.apiResponseQueue = apiResponseQueue
        self.completion = completion

        _uploadProgress = Progress(totalUnitCount: uploadSize)
        _downloadProgress = Progress(totalUnitCount: downloadSize)
        super.init()
    }

    internal func progressReadyHook(progress: Progress) -> Void {
        if let onProgressReady = onProgressReady {
            onProgressReady(uploadProgress)
        }
    }

    internal func completionHook(result: Swift.Result<Response<T>, ErrorResponse>) -> Void {
        switch result {
        case let .success(response):
            onSuccessResponse(data: response.body)
            guard let requestBuilder = getNextRequestBuilder() else {
                if (requestBuilders.allSatisfy {
                    $0.requestTask.state == .finished
                }) {
                    completion(response.body, nil)
                }
                return
            }
            executeRequestBuilder(requestBuilder)
        case let .failure(error):
            requestBuilders.forEach {
                $0.requestTask.cancel()
            }
            completion(nil, error)
        }
    }

    override var uploadProgress: Progress {
        var completedUnitCount: Int64 = 0
        requestBuilders.forEach {
            completedUnitCount += $0.requestTask.uploadProgress.completedUnitCount
        }

        _uploadProgress.completedUnitCount = completedUnitCount
        return _uploadProgress
    }

    override var downloadProgress: Progress {
        var completedUnitCount: Int64 = 0
        requestBuilders.forEach {
            completedUnitCount += $0.requestTask.uploadProgress.completedUnitCount
        }

        _downloadProgress.completedUnitCount = completedUnitCount
        return _downloadProgress
    }

    internal func onSuccessResponse(data: T) -> Void {
    }

    internal func getNextRequestBuilder() -> RequestBuilder<T>? {
        preconditionFailure("This method must be overridden")
    }

    internal func executeRequestBuilder(_ requestBuilder: RequestBuilder<T>) -> Void {
        requestBuilder.execute(apiResponseQueue) { result in
            self.completionHook(result: result)
        }
        requestBuilders.append(requestBuilder)
    }

    override public func cancel() {
        lock.lock()
        defer {
            lock.unlock()
        }
        requestBuilders.forEach {
            $0.requestTask.cancel()
        }
    }
}
