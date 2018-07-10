//
//  FeedTripCellPlaceTableCell.swift
//  Feed
//
//  Created by Tong Tian on 2018/7/10.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import UIKit

class FeedTripCellPlaceTableCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = UIColor.fromHEX(string: "#ABCDEF")
        
        setupViews()
    }
    
    var place: Place? {
        didSet {
            setupData()
        }
    }
    
    let placeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let placeValue: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private func setupViews() {
        addSubview(placeLabel)
        addConstraints(format: "H:|-20-[v0(40)]", views: placeLabel)
        addConstraints(format: "V:|[v0(44)]|", views: placeLabel)
        
        addSubview(placeValue)
        addConstraints(format: "H:|-80-[v0]", views: placeValue)
        addConstraints(format: "V:|[v0(44)]|", views: placeValue)
    }
    
    private func setupData() {
        placeValue.text = place?.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
