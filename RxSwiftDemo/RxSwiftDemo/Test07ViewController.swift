//
//  Test07ViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/12/4.
//  Copyright © 2018 王云. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Test07ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
    
//        filterTest()
//        distincUntilChangedTest()
//        singleTest()
//        elementAtTest()
//        ignoreElementsTest()
//        takeTest()
//        takeLastTest()
//        skipTest()
        sampleTest()
    }
    
    func filterTest() {
        Observable.of(1, 2, 3, 4, 5)
            .filter { $0 > 3 }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    func distincUntilChangedTest() {
        Observable.of(1, 2, 3, 1, 1, 4)
            .distinctUntilChanged()
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    func singleTest() {
        Observable.of(1, 2, 3, 4)
            .single { $0 == 2 }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        Observable.of("a", "b", "c")
            .single()
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    func elementAtTest() {
        Observable.of(1, 2, 3, 4)
            .elementAt(2)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    func ignoreElementsTest() {
        Observable.of(1, 2, 3, 4)
            .ignoreElements()
            .subscribe { print($0) }
            .disposed(by: disposeBag)
    }
    
    func takeTest() {
        Observable.of(1, 2, 3, 4)
            .take(2)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    func takeLastTest() {
        Observable.of(1, 2, 3, 4)
            .takeLast(3)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    func skipTest() {
        Observable.of(1, 2, 3, 4)
            .skip(2)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    func sampleTest() {
        let source = PublishSubject<Int>()
        let notifier = PublishSubject<String>()
        
        source.sample(notifier)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        source.onNext(1)
        notifier.onNext("a")
        source.onNext(2)
        
        notifier.onNext("b")
        notifier.onNext("c")
        
        source.onNext(3)
        source.onNext(4)
        
        source.onNext(5)
        
        notifier.onCompleted()
        
        
    }

}
