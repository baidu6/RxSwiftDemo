//
//  Test04ViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/12/4.
//  Copyright © 2018 王云. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class Test04ViewController: UIViewController {
    
    private var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        label = UILabel(frame: CGRect(x: 0, y: 100, width: 200, height: 30))
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Hello World"
        view.addSubview(label)
        
//        Observable<Int>.interval(1.0, scheduler: MainScheduler.instance)
//            .map { CGFloat($0 + 12) }
//            .bind(to: label.rx.fontSize)
//            .disposed(by: disposeBag)
        
        
        Observable<Int>.interval(1.0, scheduler: MainScheduler.instance)
            .map { "\($0)" }
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
        
    }
  

}

//MARK:- 对UI类进行扩展
//extension UILabel {
//    public var fontSize: Binder<CGFloat> {
//        return Binder(self) { label, fontSize in
//            label.font = UIFont.systemFont(ofSize: fontSize)
//        }
//    }
//}

//MARK:- 对Reactive类进行扩展
extension Reactive where Base: UILabel {
    public var fontSize: Binder<CGFloat> {
        return Binder(self.base) { label, fontSize in
            label.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
    
}
