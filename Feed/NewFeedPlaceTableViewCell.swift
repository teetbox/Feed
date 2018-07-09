//
//  NewFeedPlaceTableViewCell.swift
//  Feed
//
//  Created by Tong Tian on 2018/7/9.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import UIKit

class NewFeedPlaceTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.fromHEX(string: "#ABCDEF")
        setupViews()
    }
    
    let placeLabel: UILabel = {
        let label = UILabel()
        label.text = "Place: "
        return label
    }()
    
    let placeTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        return textField
    }()
    
    func setupViews() {
        addSubview(placeLabel)
        addSubview(placeTextField)
        addConstraints(format: "H:|-15-[v0(60)]-10-[v1]-15-|", views: placeLabel, placeTextField)
        addConstraints(format: "V:|-10-[v0(44)]-10-|", views: placeLabel)
        addConstraints(format: "V:|-10-[v0(44)]-10-|", views: placeTextField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
