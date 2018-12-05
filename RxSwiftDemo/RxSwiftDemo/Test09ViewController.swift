//
//  Test09ViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/12/4.
//  Copyright © 2018 王云. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class Test09ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
//        startWithTest()
//        mergeTest()
        
//        zipTest()
//        combineLatest()
//        withLatestFrom()
        switchLastestTest()
    }
    
    func switchLastestTest() {
        let subject1 = BehaviorSubject(value: "1")
        let subject2 = BehaviorSubject(value: "a")
        
        let variable = Variable(subject1)
        variable.asObservable()
            .switchLatest()
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        subject1.onNext("2")
        subject1.onNext("3")
        
        variable.value = subject2
        
        subject1.onNext("4")
        subject2.onNext("b")
        
        variable.value = subject1
        
        subject2.onNext("c")
        subject1.onNext("5")
        
    }
    
    func withLatestFrom() {
        let subject1 = PublishSubject<String>()
        let subject2 = PublishSubject<String>()
        
        subject1.withLatestFrom(subject2)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        subject1.onNext("A")
        subject2.onNext("1")
        subject1.onNext("B")
        subject1.onNext("C")
        subject2.onNext("2")
        subject1.onNext("D")
    }
    
    func combineLatest() {
        let subject1 = PublishSubject<Int>()
        let subject2 = PublishSubject<String>()
        
        Observable.combineLatest(subject1, subject2) {
            "\($0)\($1)"
            }.subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        subject1.onNext(1)
        subject2.onNext("A")
        subject1.onNext(2)
        subject2.onNext("B")
        subject2.onNext("C")
        subject2.onNext("D")
        subject1.onNext(3)
        subject1.onNext(4)
        subject1.onNext(5)
        
    }
    
    func zipTest() {
        let subject1 = PublishSubject<Int>()
        let subject2 = PublishSubject<String>()
        
        Observable.zip(subject1, subject2) {
            "\($0)\($1)"
            }.subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        subject1.onNext(1)
        subject2.onNext("a")
        
        subject1.onNext(2)
        subject2.onNext("b")
        
        subject1.onNext(3)
        subject2.onNext("c")
        subject2.onNext("d")
        subject2.onNext("f")
        subject1.onNext(4)

        
    }
    
    func mergeTest() {
        let subject1 = PublishSubject<Int>()
        let subject2 = PublishSubject<Int>()
        Observable.of(subject1, subject2)
            .merge()
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        subject1.onNext(111)
        subject1.onNext(1111)
        
        subject2.onNext(222)
        subject2.onNext(2222)
        
        subject1.onNext(11111)
        subject2.onNext(22222)
    }
    
    func startWithTest() {
        Observable.of(1, 2, 3, 4)
            .startWith(0)
            .startWith(-1)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }

}
