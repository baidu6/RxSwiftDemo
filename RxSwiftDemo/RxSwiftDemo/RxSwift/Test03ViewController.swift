//
//  Test03ViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/8/3.
//  Copyright © 2018年 王云. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Test03ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribeTest()
        doOnTest()
        
    }
    
    //MARK:- subscribe订阅
    func subscribeTest() {
        Observable.of(1, 2, 3)
            .subscribe { event in
                print(event)
            }
        
        Observable.of("A", "B", "C", "D")
            .subscribe(onNext: { element in
                print(element)
            }, onError: { error in
                print(error)
            }, onCompleted: {
                print("completed")
            }, onDisposed: {
                print("disposed")
            })
    }
    
    //MARK:- 监听事件的生命周期 doOn do(onNext:) 方法就是在 subscribe(onNext:) 前调用；而 do(onCompleted:) 方法则会在 subscribe(onCompleted:) 前面调用
    func doOnTest() {
        print("==========\n")
        Observable.of("a", "b", "c", "d")
            .do(onNext: { element in
                print(element)
            }, onError: { error in
                print(error)
            }, onCompleted: {
                print("completed")
            }, onDispose: {
                print("disposed")
            })
            .subscribe(onNext: { element in
                print(element)
            }, onError: { error in
                print(error)
            }, onCompleted: {
                print("completed")
            }, onDisposed: {
                print("disposed")
            })
        
    }

    
}
