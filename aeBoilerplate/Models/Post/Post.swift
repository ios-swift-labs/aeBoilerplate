//
//  Post.swift
//  aeBoilerplate
//
//  Created by ABDELAZiZ EL ARASSi on 6/9/2022.
//

import UIKit
import ObjectMapper
import RealmSwift

public class Post : Mappable, Codable {
    
    @objc dynamic var id: Int = Constants.ZERO
    @objc dynamic var title: String = Constants.EMPTY
    @objc dynamic var body: String = Constants.EMPTY

    public required init?(map: Map) {}

    public func mapping(map: Map) {
        self.id  <- map["id"]
        self.title  <- map["title"]
        self.body  <- map["body"]
    }
}
