//
//  Test02ViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/8/2.
//  Copyright © 2018年 王云. All rights reserved.
//

import UIKit
import RxSwift

class Test02ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        justTest()
        ofTest()
        fromTest()
        emptyTest()
        neverTest()
        errorTest()
        rangeTest()
//        repeatElementTest()
        generateTest()
        createTest()
        deferredTest()
//        intervalTest()
//        timerTest()
    }

}

//MARK:- 创建Observable序列
extension Test02ViewController {
    
    //MARK:- just
    func justTest() {
        Observable<Int>.just(5)
            .subscribe(onNext: { ele in
                print(ele)
            }).disposed(by: disposeBag)
    }
    
    //MARK:- of [接受可变数量的参数，同类型的]
    func ofTest() {
        Observable.of("A", "B", "C")
            .subscribe(onNext: { ele in
                print("ofTest: \(ele)")
            }).disposed(by: disposeBag)
    }
    
    //MARK:- from [一个数组参数]
    func fromTest() {
        Observable.from(["a", "b", "c", "d"])
            .subscribe(onNext: { ele in
                print("fromTest: \(ele)")
            }).disposed(by: disposeBag)
        
    }
    
    //MARK:- 创建一个空内容的Observable序列
    func emptyTest() {
        Observable<Int>.empty()
            .subscribe(onNext: { ele in
                print(ele)
            }, onCompleted: {
                print("emptyTest: completed")
            }).disposed(by: disposeBag)
    }
    
    //MARK:- 创建一个永远不会发出Event也不会终止的Observable序列
    func neverTest() {
        let _ = Observable<Int>.never()
    }
    
    //MARK:- 创建一个不做任何操作 直接发出一个error的Observable序列
    func errorTest() {
        enum MyError: Error {
            case A
            case B
        }
        Observable.error(MyError.A)
            .subscribe(onNext: { ele in
                print(ele)
            }).disposed(by: disposeBag)
    }
    
    //MARK:- range 通过制定起始和结束数值，创建一个以这个范围内所有值作为初始值的Observable序列
    func rangeTest() {
        Observable.range(start: 0, count: 5)
            .subscribe(onNext: { ele in
                print("rangeTest: \(ele)")
            }).disposed(by: disposeBag)
    }
    
    //MARK:- repeatElement 无限发出给定元素，永不终止
    func repeatElementTest() {
        Observable.repeatElement(3)
            .subscribe(onNext: { ele in
                print(ele)
            }).disposed(by: disposeBag)
    }
    
    //MARK:- generate 创建一个只有当提供的所有的判断条件都是true的时候，才会给出动作的observable序列
    func generateTest() {
        Observable.generate(initialState: 0, condition: { $0 <= 10 }, iterate: { $0 + 2 })
            .subscribe(onNext: { ele in
                print("generateTest: \(ele)")
            }).disposed(by: disposeBag)
    }
    
    //MARK:- create 接受一个block形式的参数，任务是对每一个过来的订阅进行处理
    func createTest() {
        Observable<String>.create { observer in
            observer.onNext("Hello")
            observer.onNext("World")
            observer.onCompleted()
            return Disposables.create()
            }.subscribe(onNext: { ele in
                print("createTest: \(ele)")
            }).disposed(by: disposeBag)
    }
    
    //MARK:- 相当于是创建一个Observable工厂，通过传入一个block来执行延迟 Observable 序列创建的行为，而这个 block 里就是真正的实例化序列对象的地方
    func deferredTest() {
        var isOdd = true
        let factory = Observable.deferred { () -> Observable<Int> in
            isOdd = !isOdd
            if isOdd {
                return Observable.of(1, 3, 5, 7)
            } else {
                return Observable.of(2, 4, 6, 8)
            }
        }
        factory.subscribe(onNext: { ele in
            print(ele)
        }).disposed(by: disposeBag)
        
        factory.subscribe(onNext: { ele in
            print(ele)
        }).disposed(by: disposeBag)
    }
    
    //MARK:- interval 每隔一段设定的时间，会发出一个索引数的元素。而且它会一直发送下去
    func intervalTest() {
        Observable<Int>.interval(1, scheduler: MainScheduler.instance)
            .subscribe(onNext: { ele in
                print(ele)
            }).disposed(by: disposeBag)
    }
    
    //MARK:- timer 1.在经过设定的一段时间后，产生唯一的一个元素。2.在经过设定的一段时间后，每隔一段时间产生一个元素
    func timerTest() {
        Observable<Int>.timer(2.0, scheduler: MainScheduler.instance)
            .subscribe(onNext: { ele in
                print("产生一个唯一的元素： \(ele)")
            }).disposed(by: disposeBag)
        
        Observable<Int>.timer(20, period: 1, scheduler: MainScheduler.instance)
            .subscribe(onNext: { ele in
                print("隔一段时间产生一个元素： \(ele)")
            }).disposed(by: disposeBag)
    }
    
}
