//
//  Test03ViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/12/3.
//  Copyright © 2018 王云. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Test03ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        let observer: AnyObserver<String> = AnyObserver { (event) in
            switch event {
            case .next(let data):
                print(data)
            case .error(let error):
                print(error)
            case .completed:
                print("completed")
            }
        }
        
        Observable.of("a", "b", "c").subscribe(observer)
        
        
        let label = UILabel(frame: CGRect(x: 0, y: 100, width: 200, height: 30))
        view.addSubview(label)
        
        let observer2: Binder<String> = Binder(label) { (view, text ) in
            view.text = text
        }
        Observable<Int>.interval(1, scheduler: MainScheduler.instance)
            .map { "当前索引: \($0)" }
            .bind(to: observer2)
            .disposed(by: disposeBag)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
