//
//  BaseTableViewCell.swift
//  RxSwiftDemo
//
//  Created by 王云 on 2018/8/1.
//  Copyright © 2018年 王云. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    private var titleLabel: UILabel!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        titleLabel = UILabel()
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-15)
        }
        
    }
    
    func displayText(title: String) {
        titleLabel.text = title
    }
    
}
