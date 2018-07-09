//
//  FeedViewController.swift
//  Feed
//
//  Created by Tong Tian on 2018/7/5.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
        navigationItem.rightBarButtonItem = addButton
        
        setupViews()
        
        tableView.reloadData()
    }

    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.register(FeedTableViewCell.self, forCellReuseIdentifier: "Cell")
        table.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        return table
    }()
    
    lazy var trips: [Trip] = {
        let paris = Trip(title: "Go Paris", places: [Place(name: "Place A"), Place(name: "Place B")])
        let hawaii = Trip(title: "Go Hawaii", places: [Place(name: "Place C"), Place(name: "Place D")])
        let london = Trip(title: "Go London", places: [Place(name: "Place E"), Place(name: "Place F"), Place(name: "Place G")])
        return [paris, hawaii, london]
    }()
    
    func setupViews() {
        view.addSubview(tableView)
        view.addConstraints(format: "H:|[v0]|", views: tableView)
        view.addConstraints(format: "V:|[v0]-15-|", views: tableView)
    }
    
    @objc func handleAdd() {
        let newFeedViewController = NewFeedViewController()
        navigationController?.pushViewController(newFeedViewController, animated: true)
    }
    
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedTableViewCell
        cell.trip = trips[indexPath.row]
        
        return cell
    }
}

extension FeedViewController: UITableViewDelegate {
    
}









