//
//  Test2TableViewHandler.swift
//  Feed
//
//  Created by Tong Tian on 2018/7/12.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import UIKit

class Test2TableViewHandler: UITableView {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        setupViews()
    }
    
    func setupViews() {
        dataSource = self
        delegate = self
        separatorStyle = .none
        register(Test2TableViewPlaceCell.self, forCellReuseIdentifier: "PlaceCell")
        register(Test2TableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    lazy var trips: [Trip] = {
        let paris = Trip(title: "Go Paris", places:[Place(name: "Place A"), Place(name: "Place B")])
        let hawaii = Trip(title: "Go Hawaii Go Hawaii Go Hawaii Go Hawaii Go Hawaii", places: [Place(name: "Place C"), Place(name: "Place D")])
        let london = Trip(title: "Go London", places: [Place(name: "Place E"), Place(name: "Place F"), Place(name: "Place G GGGGGGGGGGGGGGGGGGGG GGGGGG GGGGGGGGGGGG")])
        return [paris, hawaii, london]
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension Test2TableViewHandler: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips[section].places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as! Test2TableViewPlaceCell
            cell.tripTitle.text = trips[indexPath.section].title
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Test2TableViewCell
            cell.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
            cell.placeLabel.text = trips[indexPath.section].places[indexPath.row].name
            
            return cell
        }
    }
    
}

extension Test2TableViewHandler: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
        headerView.backgroundColor = UIColor.fromHEX(string: "#ABCDEF")
        headerView.clipsToBounds = true
        
        let shadowView = CornerShadowView(corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        headerView.addSubview(shadowView)
        headerView.addConstraints(format: "H:|-15-[v0]-15-|", views: shadowView)
        headerView.addConstraints(format: "V:[v0(86)]-(-1)-|", views: shadowView)
        
        let sepeatorLine = UIView()
        sepeatorLine.backgroundColor = UIColor.fromHEX(string: "#DEDEDE")
        headerView.addSubview(sepeatorLine)
        headerView.addConstraints(format: "H:|-30-[v0]-30-|", views: sepeatorLine)
        headerView.addConstraints(format: "V:[v0(0.5)]|", views: sepeatorLine)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.fromHEX(string: "#E8E8E8")
        footerView.clipsToBounds = true
        
        let shadowView = CornerShadowView(corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        
        footerView.addSubview(shadowView)
        footerView.addConstraints(format: "H:|-15-[v0]-15-|", views: shadowView)
        footerView.addConstraints(format: "V:|-(-1)-[v0(36)]", views: shadowView)
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }

}

