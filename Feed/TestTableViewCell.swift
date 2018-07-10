//
//  TestTableViewCell.swift
//  Feed
//
//  Created by Tong Tian on 2018/7/10.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.fromHEX(string: "#ABCDEF")
        
        setupViews()
    }
    
    let innerTable: TestInnerTableView = {
        let table = TestInnerTableView()
        return table
    }()
    
    func setupViews() {
        addSubview(innerTable)
        addConstraints(format: "H:|-15-[v0]-15-|", views: innerTable)
        addConstraints(format: "V:|-15-[v0]-15-|", views: innerTable)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
