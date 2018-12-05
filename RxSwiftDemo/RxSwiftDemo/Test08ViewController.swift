//
//  Test08ViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/12/4.
//  Copyright © 2018 王云. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class Test08ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
//        ambTest()
//        takeWhileTest()
//        takeUntilTest()
//        skipWhileTest()
        skipUntilTest()
    }
    
    func skipUntilTest() {
        let source = PublishSubject<Int>()
        let notifier = PublishSubject<String>()
        source
            .skipUntil(notifier)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        source.onNext(1)
        source.onNext(2)
        source.onNext(3)
        
        notifier.onNext("a")
        
        source.onNext(4)
        source.onNext(5)
        
        notifier.onNext("b")
        
        source.onNext(6)
    }
    
    func skipWhileTest() {
        Observable.of(1, 2, 3, 4)
            .skipWhile { $0 < 3 }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    func ambTest() {
        let subject1 = PublishSubject<Int>()
        let subject2 = PublishSubject<Int>()
        let subject3 = PublishSubject<Int>()
        
        subject1
            .amb(subject2)
            .amb(subject3)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        subject2.onNext(1111)
        subject1.onNext(20)
        subject2.onNext(1111111)
        subject1.onNext(40)
        subject3.onNext(0)
        subject2.onNext(3)
        subject1.onNext(1111111)
        subject3.onNext(0)
        subject3.onNext(0)
    }
    
    func takeWhileTest() {
        Observable.of(1, 2, 3, 4)
            .takeWhile { $0 < 3}
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    func takeUntilTest() {
        let source = PublishSubject<Int>()
        let notifier = PublishSubject<String>()
        
        source
            .takeUntil(notifier)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        source.onNext(1)
        source.onNext(2)
        source.onNext(3)
        source.onNext(4)
        
        notifier.onNext("a")
        notifier.onNext("b")
    }
    
   
}
