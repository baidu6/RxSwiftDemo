//
//  BaseSubTitleCell.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/8/2.
//  Copyright © 2018年 王云. All rights reserved.
//

import UIKit

class BaseSubTitleCell: UITableViewCell {
    
    private var titleLabel: UILabel!
    private var descLabel: UILabel!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        titleLabel = UILabel()
        titleLabel.textAlignment = .left
        titleLabel.textColor = .black
        contentView.addSubview(titleLabel)
        
        descLabel = UILabel()
        descLabel.textAlignment = .left
        descLabel.textColor = UIColor.lightGray
        contentView.addSubview(descLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(15)
        }
        
        descLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-15)
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
    }
    
    func displayData(title: String, desc: String) {
        titleLabel.text = title
        descLabel.text = desc
    }
    
}
