//
//  ThreadTestViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/12/6.
//  Copyright © 2018 王云. All rights reserved.
//

import UIKit

class ThreadTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 40)
        btn.setTitle("Thread", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(ThreadAction), for: .touchUpInside)
    }
    
    @objc func ThreadAction() {
        
    }
  

}
