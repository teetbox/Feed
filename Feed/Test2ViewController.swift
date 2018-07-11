//
//  Test2ViewController.swift
//  Feed
//
//  Created by Tong Tian on 2018/7/11.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import UIKit

class Test2ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.fromHEX(string: "#ABCDEF")
        
        setupViews()
    }
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return table
    }()
    
    func setupViews() {
        view.addSubview(tableView)
        view.addConstraints(format: "H:|[v0]|", views: tableView)
        view.addConstraints(format: "V:|[v0]|", views: tableView)
    }
    
    lazy var trips: [Trip] = {
        let paris = Trip(title: "Go Paris", places: [])
        let hawaii = Trip(title: "Go Hawaii", places: [Place(name: "Place C"), Place(name: "Place D")])
        let london = Trip(title: "Go London", places: [Place(name: "Place E"), Place(name: "Place F"), Place(name: "Place G GGGGGGGGGGGGGGGGGGGG GGGGGG GGGGGGGGGGGG")])
        return [paris, hawaii, london]
    }()
    
}

extension Test2ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips[section].places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .orange
        cell.textLabel?.text = trips[indexPath.section].places[indexPath.row].name
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
        headerView.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        headerView.clipsToBounds = true
        
        let blueView = UIView()
        blueView.backgroundColor = .white
        blueView.layer.cornerRadius = 10
        blueView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        blueView.layer.shadowColor = UIColor.black.cgColor
        blueView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        blueView.layer.shadowOpacity = 0.2
        blueView.layer.shadowRadius = 4.0
        
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
        
        let blueView = UIView()
        blueView.backgroundColor = .white
        blueView.layer.cornerRadius = 10
        blueView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        blueView.layer.shadowColor = UIColor.black.cgColor
        blueView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        blueView.layer.shadowOpacity = 0.2
        blueView.layer.shadowRadius = 4.0
        
        footerView.addSubview(blueView)
        footerView.addConstraints(format: "H:|-15-[v0]-15-|", views: blueView)
        footerView.addConstraints(format: "V:|-(-5)-[v0(40)]", views: blueView)
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
}

extension Test2ViewController: UITableViewDelegate {
    
}









