//
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/8/1.
//  Copyright © 2018年 王云. All rights reserved.
//

import UIKit
import StreamingKit

class ViewController: BaseViewController {
    
    private var listTableView: BaseTableView!
    private var titlesArray: [String] = ["01-两种编程方式的比较", "02-Observable", "04-Observer观察者", "05-自定义可绑定属性", "06-Subjects和Variables", "07-变换操作", "08-过滤操作", "09-条件和布尔操作符", "10-结合操作", "11-算数，以及聚合操作", "12-其它操作符"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "RxSwift"
        
        // 添加UITableView
        setupTableViews()
        
    }
    
    func setupTableViews() {
        listTableView = BaseTableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIHGT))
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(BaseTableViewCell.self, forCellReuseIdentifier: "BaseTableViewCell")
        view.addSubview(listTableView)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BaseTableViewCell") as! BaseTableViewCell
        cell.displayText(title: titlesArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let vc = Test01ViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = Tes02ViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = Test03ViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = Test04ViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = Test05ViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = Test06ViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 6:
            let vc = Test07ViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 7:
            let vc = Test08ViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 8:
            let vc = Test09ViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 9:
            let vc = Test10ViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 10:
            let vc = Test11ViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}

