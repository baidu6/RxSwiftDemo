//
//  Test01ViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/8/2.
//  Copyright © 2018年 王云. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct Music {
    let name: String
    let singer: String
    init(name: String, singer: String) {
        self.name = name
        self.singer = singer
    }
}

extension Music: CustomStringConvertible {
    var description: String {
        return "name: \(name), singer: \(singer)"
    }
}

struct MusiListViewModel {
    let data = [Music(name: "记得带走", singer: "徐佳莹"),
                Music(name: "无人知晓的我", singer: "A-Lin"),
                Music(name: "还会记得我吗", singer: "李玖哲"),
                Music(name: "重来", singer: "蔡健雅")
    ]
}

struct MusicRxListViewModel {
    let data = Observable.just([
            Music(name: "记得带走", singer: "徐佳莹"),
            Music(name: "无人知晓的我", singer: "A-Lin"),
            Music(name: "还会记得我吗", singer: "李玖哲"),
            Music(name: "重来", singer: "蔡健雅"),
        ])
}

class Test01ViewController: BaseViewController {
    
    private var tableView: BaseTableView!
    
    let musicListViewModel = MusiListViewModel()
    
    let musicRxListViewModel = MusicRxListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
//        traditionalWay()
        rxSwiftWay()
    }
    
    //MARK:- 添加UItableView
    func setupTableView() {
        tableView = BaseTableView(frame: view.bounds)
        tableView.register(BaseSubTitleCell.self, forCellReuseIdentifier: "BaseSubTitleCell")
        view.addSubview(tableView)
    }
    
    //MARK:- 传统方式
    func traditionalWay() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK:- 使用RxSwift，响应式编程
    func rxSwiftWay() {
        
        musicRxListViewModel.data
            .bind(to: tableView.rx.items(cellIdentifier: "BaseSubTitleCell")) { _, music, cell in
                let c = cell as! BaseSubTitleCell
                c.displayData(title: music.name, desc: music.singer)
            }.disposed(by: disposeBag)
        
        //tableView的点击事件
        tableView.rx.modelSelected(Music.self).subscribe(onNext: {
            music in
            print("您选中的歌曲信息是：\(music)")
        }).disposed(by: disposeBag)
    }

}

extension Test01ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicListViewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BaseSubTitleCell") as! BaseSubTitleCell
        let music = musicListViewModel.data[indexPath.row]
        cell.displayData(title: music.name, desc: music.singer)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("您选中的歌曲信息是：\(musicListViewModel.data[indexPath.row])")
    }

}
