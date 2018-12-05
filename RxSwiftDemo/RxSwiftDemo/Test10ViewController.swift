//
//  Test10ViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/12/4.
//  Copyright © 2018 王云. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class Test10ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
//        toArrayTest()
        
        reduceTest()
    }
    
    func reduceTest() {
        Observable.of(1, 2, 3, 4, 5)
            .reduce(0, accumulator: +)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    func toArrayTest() {
        Observable.of(1, 2, 3, 4)
            .toArray()
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }

}
