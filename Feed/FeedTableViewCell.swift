//
//  FeedTableViewCell.swift
//  Feed
//
//  Created by Tong Tian on 2018/7/10.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        setupViews()
    }
    
    var trip: Trip? {
        didSet {
            setupData()
        }
    }
    
    let tripView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.fromHEX(string: "#F1F1F1").cgColor
        view.backgroundColor = .white
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Trip:"
        return label
    }()
    
    let title: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let sepeatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.fromHEX(string: "#DEDEDE")
        return view
    }()
    
    private func setupViews() {
        addSubview(tripView)
        addConstraints(format: "H:|-15-[v0]-15-|", views: tripView)
        addConstraints(format: "V:|-15-[v0(100)]|", views: tripView)
        
        tripView.addSubview(titleLabel)
        tripView.addConstraints(format: "H:|-20-[v0(40)]", views: titleLabel)
        tripView.addConstraints(format: "V:|[v0(50)]", views: titleLabel)
        
        tripView.addSubview(title)
        tripView.addConstraints(format: "H:|-65-[v0]-15-|", views: title)
        tripView.addConstraints(format: "V:|[v0(50)]", views: title)
        
        tripView.addSubview(sepeatorLine)
        tripView.addConstraints(format: "H:|[v0]|", views: sepeatorLine)
        tripView.addConstraints(format: "V:|-45-[v0(0.5)]", views: sepeatorLine)
        
        
    }
    
    private func setupData() {
        title.text = trip?.title
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
