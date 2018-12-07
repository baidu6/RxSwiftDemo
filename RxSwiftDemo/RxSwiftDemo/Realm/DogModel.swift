//
//  DogModel.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/12/5.
//  Copyright © 2018 王云. All rights reserved.
//

import UIKit
import RealmSwift

class DogModel: Object {
    @objc dynamic var name: String?
    @objc dynamic var age: Int = 0
    
    var onwer = LinkingObjects(fromType: Person.self, property: "dogs")
}


class Person: Object {
    @objc dynamic var key = "Person"
    @objc dynamic var name: String?
    var dogs: List = List<DogModel>()
    
    override static func primaryKey() -> String {
        return "key"
    }
    
}
