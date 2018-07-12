//
//  Trip.swift
//  Feed
//
//  Created by Tong Tian on 2018/7/10.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import Foundation

struct Trip {
    var title: String
    var places: [Place]
    var hasImage: Bool
    
    init(title: String, places: [Place], hasImage: Bool = false) {
        self.title = title
        self.places = places
        self.hasImage = hasImage
    }
}
