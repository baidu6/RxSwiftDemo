//
//  Tes02ViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/12/3.
//  Copyright © 2018 王云. All rights reserved.
//

import UIKit
import RxSwift

class Tes02ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        Observable.just(5)
            .subscribe(onNext: {
                print($0)
            }).disposed(by: disposeBag)
        print("=======")
        
        Observable.of(1, 2, 3, 4, 5)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        print("=======")
        
        Observable.from([1, 2, 3, 4])
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        print("=======")
        
        Observable.range(start: 5, count: 5)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        print("=======")
        
        Observable.generate(initialState: 0, condition: { $0 <= 10 }, iterate: { $0 + 2})
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        print("=======")
        
        Observable<String>.create { (observer) -> Disposable in
            observer.onNext("hello")
            observer.onNext("world")
            observer.onCompleted()
            return Disposables.create()
            }.subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        print("=======")
        
//        Observable<Int>.interval(1, scheduler: MainScheduler.instance)
//            .subscribe(onNext: { print($0) })
//            .disposed(by: disposeBag)
//        print("=======")
        
        Observable<Int>.timer(3, scheduler: MainScheduler.instance)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        print("=======")

    }

}
