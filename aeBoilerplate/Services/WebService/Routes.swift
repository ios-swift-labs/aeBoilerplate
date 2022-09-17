//
//  Routes.swift
//  aeBoilerplate
//
//  Created by ABDELAZiZ EL ARASSi on 6/9/2022.
//

import Foundation
import Alamofire

enum Routes: URLConvertible {
    
    case posts

    var path: String {
        switch self {
            case .posts : return Environment.apiHost() + "/posts"
        }
    }
    
    public func asURL() throws -> URL {
        if(verifyUrl(urlString: path) && isValidUrlWithRegEx(url: path)) {
            return URL(string: path)!
        }
        let urlString = path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        return URL(string: urlString!)!
    }
    
    private func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if(urlString == urlString.folding(options: .diacriticInsensitive, locale: .current)) {
                return true
            }
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    private func isValidUrlWithRegEx(url: String) -> Bool {
        let urlRegEx = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
        let result = urlTest.evaluate(with: url)
        return result
    }
}

