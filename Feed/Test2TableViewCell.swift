//
//  Test2TableViewCell.swift
//  Feed
//
//  Created by Tong Tian on 2018/7/12.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import UIKit

class Test2TableViewPlaceCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .white
        clipsToBounds = true
        
        setupViews()
    }
    
    let shadowView: UIView = {
        let view = CornerShadowView(corners: [])
        return view
    }()
    
    let tripTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    var tripTitleBottomConstraint: NSLayoutConstraint?
    
    let tripImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Wheatland")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var hasImage: Bool = false {
        didSet {
            updateViews()
        }
    }
    
    func setupViews() {
        addSubview(shadowView)
        addConstraints(format: "H:|-15-[v0]-15-|", views: shadowView)
        addConstraints(format: "V:|-(-1)-[v0]-(-1)-|", views: shadowView)
        
        addSubview(tripTitle)
        addConstraints(format: "H:|-30-[v0]-30-|", views: tripTitle)
        addConstraints(format: "V:|-30-[v0]", views: tripTitle)
        
        tripTitleBottomConstraint = tripTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        tripTitleBottomConstraint?.isActive = true
    }
    
    func updateViews() {
        if hasImage {
            tripTitleBottomConstraint?.isActive = false
            
            addSubview(tripImage)
            addConstraints(format: "H:|-30-[v0]-30-|", views: tripImage)
            addConstraints(format: "V:[v0(120)]-30-|", views: tripImage)
            
            tripImage.topAnchor.constraint(equalTo: tripTitle.bottomAnchor, constant: 10).isActive = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class Test2TableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .white
        clipsToBounds = true
        
        setupViews()
    }
    
    let shadowView: UIView = {
        let view = CornerShadowView(corners: [])
        return view
    }()
    
    let placeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    func setupViews() {
        addSubview(shadowView)
        addConstraints(format: "H:|-15-[v0]-15-|", views: shadowView)
        addConstraints(format: "V:|-(-1)-[v0]-(-1)-|", views: shadowView)
        
        addSubview(placeLabel)
        addConstraints(format: "H:|-30-[v0]-30-|", views: placeLabel)
        addConstraints(format: "V:|-10-[v0]-10-|", views: placeLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
