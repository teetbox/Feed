//
//  FeedTripCellPlaceTableView.swift
//  Feed
//
//  Created by Tong Tian on 2018/7/10.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import UIKit

class FeedTripCellPlaceTableView: UITableView {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        backgroundColor = UIColor.fromHEX(string: "#ABCDEF")
        separatorStyle = .none
        dataSource = self
        delegate = self
        
        register(FeedTripCellPlaceTableCell.self, forCellReuseIdentifier: "Cell")
    }
    
    var places: [Place]?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FeedTripCellPlaceTableView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedTripCellPlaceTableCell
        cell.place = places?[indexPath.row]
        return cell
    }
    
}
