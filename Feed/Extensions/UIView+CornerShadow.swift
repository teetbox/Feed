//
//  UIView+CornerShadow.swift
//  Feed
//
//  Created by Tong Tian on 2018/7/12.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import UIKit

class CornerShadowView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(corners: CACornerMask) {
        self.init(frame: .zero)
        self.corners = corners
        
        layoutView()
    }
    
    var corners: CACornerMask = []
    
    func layoutView() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.maskedCorners = corners
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.2
        
        layer.shouldRasterize = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}










