//
//  Test05ViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/8/3.
//  Copyright © 2018年 王云. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class Test05ViewController: BaseViewController {
    
    private var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()

        Observable<Int>.interval(1, scheduler: MainScheduler.instance)
            .map { CGFloat($0) }
            .bind(to: titleLabel.rx.fontSize)
            .disposed(by: disposeBag)
    }
    
    private func addSubviews() {
        titleLabel = UILabel()
        titleLabel.text = "Hello World"
        titleLabel.textColor = UIColor.red
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }

}

//MARK:- 给UILabel进行扩展，增加一个fontSize可绑定属性
extension UILabel {
    public var fontSize: Binder<CGFloat> {
        return Binder(self) { (label, fontSize) in
            label.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
}

//MARK:- 对Reactive类进行扩展
extension Reactive where Base: UILabel {
    public var fontSize: Binder<CGFloat> {
        return Binder(self.base) { (label, fontSize) in
            label.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
}
