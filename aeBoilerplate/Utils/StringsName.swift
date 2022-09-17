//
//  StringsName.swift
//  aeBoilerplate
//
//  Created by ABDELAZiZ EL ARASSi on 6/9/2022.
//

import Foundation

enum StringsName: String {
    /// app
    case app_name
    ///  Errors
    case popup_reconnecte_title, error_server, error_msg_code, error_internet, error_post
    /// Actions
    case action_annuler, action_oui, action_non, action_ok
    
    func value() -> String {
        return self.rawValue.localized
    }
}

