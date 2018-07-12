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
        register(Test2TableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    lazy var trips: [Trip] = {
        let paris = Trip(title: "Go Paris", places: [])
        let hawaii = Trip(title: "Go Hawaii", places: [Place(name: "Place C"), Place(name: "Place D")])
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Test2TableViewCell
        cell.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        cell.placeLabel.text = trips[indexPath.section].places[indexPath.row].name

        return cell
    }
    
}

extension Test2TableViewHandler: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
        headerView.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        headerView.clipsToBounds = true
        
        let blueView = CornerShadowView(corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        headerView.addSubview(blueView)
        headerView.addConstraints(format: "H:|-15-[v0]-15-|", views: blueView)
        headerView.addConstraints(format: "V:[v0(50)]-(-5)-|", views: blueView)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        footerView.clipsToBounds = true
        
        let blueView = CornerShadowView(corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        
        footerView.addSubview(blueView)
        footerView.addConstraints(format: "H:|-15-[v0]-15-|", views: blueView)
        footerView.addConstraints(format: "V:|-(-5)-[v0(40)]", views: blueView)
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }

}

