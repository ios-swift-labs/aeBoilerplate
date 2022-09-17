//
//  String.swift
//  aeBoilerplate
//
//  Created by ABDELAZiZ EL ARASSi on 6/9/2022.
//

import Foundation
import UIKit

// MARK: - Formatting

// MARK: - Localized

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
