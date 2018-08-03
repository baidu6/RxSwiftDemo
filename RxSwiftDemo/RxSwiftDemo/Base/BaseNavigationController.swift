//
//  BaseNavigationController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/8/1.
//  Copyright © 2018年 王云. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.barTintColor = Common.Main_Color
    }

}
