//
//  MyRequestAdapter.swift
//  aeBoilerplate
//
//  Created by ABDELAZiZ EL ARASSi on 6/9/2022.
//

import UIKit
import Alamofire

class MyRequestAdapter: RequestAdapter, RequestRetrier {
    
    private typealias RefreshCompletion = (_ succeeded: Bool, _ accessToken: String?) -> Void
    private let lock = NSLock()
    private var isRefreshing = false
    private var requestsToRetry: [RequestRetryCompletion] = []
    var accessToken:String? = nil
    var refreshToken:String? = nil
    
    init(sessionManager : SessionManager) {
        sessionManager.adapter = self
        sessionManager.retrier = self
    }
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        //
        return urlRequest
    }
    
    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        //
    }
}

