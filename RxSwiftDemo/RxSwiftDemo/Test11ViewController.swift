//
//  Test11ViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/12/4.
//  Copyright © 2018 王云. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Test11ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
//        Observable.of(1, 2, 3)
//            .delay(3.0, scheduler: MainScheduler.instance)
//            .subscribe(onNext: { print($0) })
//            .disposed(by: disposeBag)
        
        Observable.of(1, 2, 3)
            .startWith(0)
            .debug("调试1")
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    
    func delay(_ delay: Double, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            closure()
        }
    }

}
