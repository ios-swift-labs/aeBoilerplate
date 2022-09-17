//
//  Utils.swift
//  aeBoilerplate
//
//  Created by ABDELAZiZ EL ARASSi on 6/9/2022.
//

import Foundation
import RealmSwift

public class Utils {
    static func showSimpleAlert(message: String?) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: StringsName.action_ok.value(), style: .default) { _ in }
        alertController.addAction(action)
        if(Singleton.currentViewController != nil) {
            Singleton.currentViewController!.present(alertController, animated: true, completion: nil)
        }
    }
}
