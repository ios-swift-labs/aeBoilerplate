//
//  Connectivity.swift
//  aeBoilerplate
//
//  Created by ABDELAZiZ EL ARASSi on 6/9/2022.
//

import Foundation
import Alamofire
import Reachability

class Connectivity {
    
    let reachability = try! Reachability()
    
    class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
}

