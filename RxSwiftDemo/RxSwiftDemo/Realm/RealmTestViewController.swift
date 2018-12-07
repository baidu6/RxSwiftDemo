//
//  RealmTestViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/12/5.
//  Copyright © 2018 王云. All rights reserved.
//

import UIKit
import RealmSwift
import Alamofire

class RealmTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white

        let dog = DogModel()
        dog.name = "ppp"
        dog.age = 10
        
        let person = Person()
        person.name = "李四"
        person.dogs.append(dog)
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(person, update: true)
        }

        let result = realm.objects(Person.self)
        print(result)
    }
    
    func getTest() {
        Alamofire.request("http://developer.apple.com/item", method: .get, parameters: ["id": 1000], encoding: URLEncoding.default, headers: nil).validate(statusCode: [200, 201, 203]).responseJSON { (response) in
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
