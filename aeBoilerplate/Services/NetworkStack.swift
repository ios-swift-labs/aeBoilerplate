//
//  NetworkStack.swift
//  aeBoilerplate
//
//  Created by ABDELAZiZ EL ARASSi on 6/9/2022.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON
import AlamofireObjectMapper

public enum DataManagerResult {
    case success([Post])
    case error(Int)
}

public class NetworkStack {
    enum ErrorType: Error {
        case noInternet(error: Error)
        case serverUnreachable(error: Error)
        case badServerResponse(error: Error)
        case HTTP(statusCode: Int, data: Data?)
        case parseError
        case otherError(error: Error)
        case unknow
    }
    enum StatusCode: Int {
        case OK = 200
        case DELETED = 204
        case NOK = 400
        case FORBIDDEN = 406
        case NOT_FOUND = 404
        case UNAUTHORIZED = 401
        case INTERNAL_SERVER_ERROR = 500
    }
    private let requestManager: SessionManager

    // MARK: Initialization
    public static let shared = NetworkStack()
    static var isSending = false

    deinit { }
    public init() {
        var defaultHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        defaultHeaders["Content-Type"] = "application/json"
        Alamofire.SessionManager.default.session.invalidateAndCancel()
        let configuration = URLSessionConfiguration.default
        configuration.urlCredentialStorage = nil
        configuration.urlCache = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        configuration.httpAdditionalHeaders = defaultHeaders
        self.requestManager = SessionManager(configuration: configuration)
        let myRequestAdapter = MyRequestAdapter(sessionManager: self.requestManager)
        self.requestManager.retrier = myRequestAdapter
        self.requestManager.adapter = myRequestAdapter
        configuration.timeoutIntervalForRequest = 60
    }

    
    /// getPosts
    @discardableResult public func getPosts(completion: @escaping (DataManagerResult) -> ()) -> DataRequest? {
        let dataRequest = self.requestManager.request(Routes.posts,
                                                      method: .get,
                                                      parameters: [:],
                                                      encoding: URLEncoding.default, headers: Headers.defaultHeader())
                    
            .validate()
            .responseArray { (response: DataResponse<[Post]>) in
                if (response.response?.statusCode == StatusCode.OK.rawValue) {
                    let categoriesArray = response.result.value
                    if (categoriesArray != nil) {
                        completion(DataManagerResult.success(categoriesArray!))
                    }
                } else {
                    self.handleError(statusCode: response.response?.statusCode ?? Constants.ZERO)
                    completion(DataManagerResult.error(response.response?.statusCode ?? Constants.ZERO))
                }
            }
        return dataRequest
    }
    
    private func handleError(statusCode: Int) {
        switch statusCode {
            case StatusCode.UNAUTHORIZED.rawValue:
                Utils.showSimpleAlert(message: StringsName.popup_reconnecte_title.value())
            case StatusCode.INTERNAL_SERVER_ERROR.rawValue:
                Utils.showSimpleAlert(message: StringsName.error_server.value())
            default:
                Utils.showSimpleAlert(message: "\(StringsName.error_msg_code.value()) \(statusCode)")
        }
    }
    
}

