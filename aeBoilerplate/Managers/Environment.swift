//
//  Environment.swift
//  aeBoilerplate
//
//  Created by ABDELAZiZ EL ARASSi on 6/9/2022.
//

import Foundation

class Environment {
    static var configs: NSDictionary {
        let path = Bundle.main.path(forResource: "Environment", ofType: "plist")!
        return NSDictionary(contentsOfFile: path)!.object(forKey: "PARAMS") as! NSDictionary
    }
}

extension Environment {    
    static func apiHost() -> String {
        return Environment.configs.object(forKey: "api_host") as! String
    }
}

