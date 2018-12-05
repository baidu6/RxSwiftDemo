//
//  Test05ViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/12/4.
//  Copyright © 2018 王云. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Test05ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
//        publishSubjectTest()
//        behaviorSubjectTest()
//        replaySubjectTest()
        behaviorReplayTest()
        
    }
    
    //MARK:- PublishSubject 只能接收订阅之后的事件
    func publishSubjectTest() {
        let subject = PublishSubject<String>()
        
        subject.onNext("1111")
        subject.subscribe(onNext: {
            print("第一次订阅 \($0)")
        }, onCompleted: {
            print("第一次订阅结束")
        }).disposed(by: disposeBag)
        
        
        subject.onNext("222")
        subject.subscribe(onNext: {
            print("第二次订阅 \($0)")
        }, onCompleted: {
            print("第二次订阅结束")
        }).disposed(by: disposeBag)
        
        
        subject.onNext("333")
        subject.onCompleted()
        
        
        subject.onNext("444")
        subject.subscribe(onNext: {
            print("第三次订阅 \($0)")
        }, onCompleted: {
            print("第三次订阅结束")
        }).disposed(by: disposeBag)
    }
    
    //MARK:- 能够接受订阅之前的一个事件
    func behaviorSubjectTest() {
        let subject = BehaviorSubject(value: "1")
        
        subject.subscribe(onNext: {
            print("第一次订阅：\($0)")
        }).disposed(by: disposeBag)
        
        subject.onNext("2")
        
//        subject.onError(NSError(domain: "local", code: 0, userInfo: nil))
        
        subject.onNext("3")
        
        subject.subscribe(onNext: {
            print("第二次订阅：\($0)")
        }).disposed(by: disposeBag)
    }
    
    //MARK:- ReplaySubject 在创建时候需要设置一个 bufferSize，表示它对于它发送过的 event 的缓存个数。
    func replaySubjectTest() {
        let subject = ReplaySubject<String>.create(bufferSize: 2)
        subject.onNext("1")
        subject.onNext("2")
        subject.onNext("3")
        
        subject.subscribe(onNext: {
            print("第一次订阅: \($0)")
        })  .disposed(by: disposeBag)
        
        subject.onNext("4")
        subject.subscribe(onNext: {
            print("第二次订阅: \($0)")
        }).disposed(by: disposeBag)
        
        subject.onCompleted()
        
        subject.subscribe(onNext: {
            print("第三次订阅：\($0)")
        }).disposed(by: disposeBag)
    }
    
    func behaviorReplayTest() {
        
//        let subject = BehaviorRelay<String>(value: "1")
//
//        subject.accept("2")
//
//        subject.asObservable().subscribe {
//            print("都一次订阅： \($0)")
//        }.disposed(by: disposeBag)
//
//        subject.accept("3")
//
//        subject.asObservable().subscribe {
//            print("第二次订阅: \($0)")
//        }.disposed(by: disposeBag)
//
//        subject.accept("4")
        
        
        let subject = BehaviorRelay<[String]>(value: ["1"])
        
        subject.accept(subject.value + ["2", "3"])
        
        subject.asObservable().subscribe {
            print("都一次订阅： \($0)")
            }.disposed(by: disposeBag)
        
        subject.accept(subject.value + ["4", "5"])
        
        subject.asObservable().subscribe {
            print("第二次订阅: \($0)")
            }.disposed(by: disposeBag)
        
        subject.accept(subject.value + ["6"])
    }
    
}
