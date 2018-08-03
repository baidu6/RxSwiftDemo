 //
//  Test04ViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/8/3.
//  Copyright © 2018年 王云. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class Test04ViewController: BaseViewController {
    
    private var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        
        subscribeTest()
//        bindTest()
//        anyObserverTest()
        binderTest()
    }
    
    func addSubviews() {
        titleLabel = UILabel()
        titleLabel.textColor = UIColor.red
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    //MARK:- 在subscribe中创建观察者
    func subscribeTest() {
        Observable.of(1, 2, 3)
            .subscribe(onNext: { element in
                print(element)
            }, onError: { error in
                print(error)
            }, onCompleted: {
                print("completed")
            }, onDisposed: {
                print("diposed")
            })
    }
    
    //MARK:- 在bind中创建观察者
    func bindTest() {
        Observable<Int>.interval(1, scheduler: MainScheduler.instance)
            .map { "当前索引数： \($0)" }
            .bind { [weak self] (text) in
                self?.titleLabel.text = text
            }.disposed(by: disposeBag)
    }
    
    //MARK:- 使用AnyObserver创建观察者
    func anyObserverTest() {
        // 配合subscribe使用
        let observer: AnyObserver<String> = AnyObserver { event in
            switch event {
            case .next(let data):
                print(data)
            case .error(let error):
                print(error)
            case .completed:
                print("completed")
            }
        }
        Observable.of("a", "b", "c")
            .subscribe(observer)
        
        
        //配合bind使用
        let observer2: AnyObserver<String> = AnyObserver { [weak self] event in
            switch event {
            case .next(let data):
                self?.titleLabel.text = data
            case .error(let error):
                print(error)
            default:
                break
            }
        }
        Observable<Int>.interval(1, scheduler: MainScheduler.instance)
            .map { "当前的索引值是： \($0)" }
            .bind(to: observer2)
            .disposed(by: disposeBag)
    }
    
    //MARK:- 使用binder创建观察者
    func binderTest() {
        let observer: Binder<String> = Binder(titleLabel) { (label, text) in
            label.text = text
        }
        
        Observable<Int>.interval(1, scheduler: MainScheduler.instance)
            .map { "\($0)" }
            .bind(to: observer)
            .disposed(by: disposeBag)
    }

}
