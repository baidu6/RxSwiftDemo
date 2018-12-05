//
//  Test01ViewController.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/12/3.
//  Copyright © 2018 王云. All rights reserved.
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

// 传统方式
//struct MusicListViewModel {
//    let data = [Music(name: "01", singer: "01--"),
//                Music(name: "02", singer: "02--"),
//                Music(name: "03", singer: "03--"),
//                Music(name: "04", singer: "04--")
//            ]
//}

// 使用RxSwift
struct MusicListViewModel {
    let data = Observable.just([Music(name: "01", singer: "01--"),
                                Music(name: "02", singer: "02--"),
                                Music(name: "03", singer: "03--"),
                                Music(name: "04", singer: "04--")
        ])
}

class Test01ViewController: UIViewController {
    
    private var tableView: UITableView!
    
    let viewModel = MusicListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "两种编程方式的比较"
        
        addTableView()
        
        
        viewModel.data.bind(to: tableView.rx.items(cellIdentifier: "Test01CellID")) { _, music, cell in
            let c = cell as! Test01Cell
            c.displayData(model: music)
        }.disposed(by: disposeBag)
        
    }
    
    func addTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIHGT - 64))
        tableView.register(Test01Cell.self, forCellReuseIdentifier: "Test01CellID")
        tableView.rowHeight = 60
//        tableView.delegate = self
//        tableView.dataSource = self
        view.addSubview(tableView)
    }
    

}

//extension Test01ViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.data.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Test01CellID") as! Test01Cell
//        cell.displayData(model: viewModel.data[indexPath.row])
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
//}

class Test01Cell: UITableViewCell {
    private var titleLabel: UILabel!
    private var detailLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
    }
    
    func displayData(model: Music) {
        titleLabel.text = model.name
        detailLabel.text = model.singer
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        contentView.addSubview(titleLabel)
        
        detailLabel = UILabel()
        detailLabel.textColor = UIColor.lightGray
        contentView.addSubview(detailLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
        }
        
        detailLabel.snp.makeConstraints { (make) in
            make.bottom.left.equalToSuperview()
        }
    }
}
