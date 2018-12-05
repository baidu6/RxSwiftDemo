//
//  Test06ViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/12/4.
//  Copyright © 2018 王云. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class Test06ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
//        bufferTest()
//        windowTest()
//        concatMapTest()
//        scanTest()
        groupByTest()
    }
    
    func bufferTest() {
        let subject = PublishSubject<String>()
        
        subject.buffer(timeSpan: 2, count: 3, scheduler: MainScheduler.instance)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        subject.onNext("a")
        subject.onNext("b")
        subject.onNext("c")
        
        subject.onNext("1")
        subject.onNext("2")
        subject.onNext("3")
        
    }
    
    func windowTest() {
        let subject = PublishSubject<String>()
        subject.window(timeSpan: 1, count: 3, scheduler: MainScheduler.instance)
            .subscribe(onNext: {
                $0.asObservable().subscribe(onNext: {
                    print($0)
                }).disposed(by: disposeBag)
            }).disposed(by: disposeBag)
        
        subject.onNext("a")
        subject.onNext("b")
        subject.onNext("c")
        
        subject.onNext("1")
        subject.onNext("2")
        subject.onNext("3")
    }
    
    func concatMapTest() {
        let subject1 = BehaviorSubject(value: "A")
        let subject2 = BehaviorSubject(value: "1")
        let variable = Variable(subject1)
        
        variable.asObservable()
            .concatMap { $0 }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        subject1.onNext("B")
        variable.value = subject2
        subject2.onNext("2")
        subject1.onNext("C")
        subject1.onCompleted()
    }
    
    func scanTest() {
        Observable.of(1, 2, 3, 4)
            .scan(0) { (result, elem) in
                result + elem
            }.subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    func groupByTest() {
        Observable<Int>.of(1, 2, 3, 4, 5)
            .groupBy { element -> String in
                return element % 2 == 0 ? "偶数" : "奇数"
            }.subscribe { event in
                switch event {
                case .next(let group):
                    group.asObservable().subscribe { event in
                        print(event)
                    }.disposed(by: disposeBag)
                default:
                    print("1345")
                }
            }.disposed(by: disposeBag)
    }
}
