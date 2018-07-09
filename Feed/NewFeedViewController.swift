//
//  NewFeedViewController.swift
//  Feed
//
//  Created by Tong Tian on 2018/7/9.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import UIKit

class NewFeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        navigationItem.rightBarButtonItem = doneButton
        
        placeData = ["Paris"]
        
        setupViews()
    }
    
    let tripLabel: UILabel = {
        let label = UILabel()
        label.text = "Trip"
        return label
    }()
    
    let tripTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        return textField
    }()
    
    var placeData: [String] = []
    
    lazy var places: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.register(NewFeedPlaceTableViewCell.self, forCellReuseIdentifier: "Cell")
        return table
    }()
    
    func setupViews() {
        view.addSubview(tripLabel)
        view.addSubview(tripTextField)
        view.addConstraints(format: "H:|-15-[v0]", views: tripLabel)
        view.addConstraints(format: "V:|-80-[v0(40)]", views: tripLabel)
        view.addConstraints(format: "H:|-15-[v0]-15-|", views: tripTextField)
        view.addConstraints(format: "V:|-120-[v0(40)]", views: tripTextField)
        
        view.addSubview(places)
        view.addConstraints(format: "H:|[v0]|", views: places)
        view.addConstraints(format: "V:|-180-[v0]|", views: places)
    }
    
    @objc func handleDone() {
        print("Trip: \(tripTextField.text ?? "blank")")
        
        for index in (0..<placeData.count) {
            if let cell = places.cellForRow(at: IndexPath(row: index, section: 0)) as? NewFeedPlaceTableViewCell {
                let value = "Place \(index + 1): \(cell.placeTextField.text ?? "blank")"
                print(value)
            }
        }
    }
    
}

extension NewFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeData.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == placeData.count {
            let cell = UITableViewCell()
            cell.textLabel?.text = "Add"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewFeedPlaceTableViewCell
            cell.placeTextField.placeholder = placeData[indexPath.row]
            cell.selectionStyle = .none
            
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == placeData.count {
            placeData.append("New Place")
            tableView.insertRows(at: [indexPath], with: .fade)
        }
    }
    
}
