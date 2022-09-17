//
//  Headers.swift
//  aeBoilerplate
//
//  Created by ABDELAZiZ EL ARASSi on 6/9/2022.
//

import Foundation
import Alamofire

public class Headers {
    public static func defaultHeader() -> HTTPHeaders {
        var headers: HTTPHeaders = HTTPHeaders()
        headers["Content-Type"] = "application/json"
        return headers
    }
}
