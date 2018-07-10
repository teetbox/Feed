//
//  TestInnerTableCell.swift
//  Feed
//
//  Created by Tong Tian on 2018/7/10.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import UIKit

class TestInnerTableCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .green
        
        setupViews()
    }
    
    let word: UILabel = {
        let label = UILabel()
        return label
    }()
    
    func setupViews() {
        addSubview(word)
        addConstraints(format: "H:|-20-[v0]", views: word)
        addConstraints(format: "V:|-10-[v0(24)]-10-|", views: word)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
