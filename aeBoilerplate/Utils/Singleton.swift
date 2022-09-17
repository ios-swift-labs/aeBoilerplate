//
//  Singleton.swift
//  aeBoilerplate
//
//  Created by ABDELAZiZ EL ARASSi on 6/9/2022.
//

import Foundation
import Alamofire
import RealmSwift

class Singleton {
    static var currentViewController:UIViewController?
    static let DEVICE_TYPE = UIDevice.current.userInterfaceIdiom
}

