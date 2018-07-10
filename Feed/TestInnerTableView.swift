//
//  TestInnerTableView.swift
//  Feed
//
//  Created by Tong Tian on 2018/7/10.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import UIKit

class TestInnerTableView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
        
        setupViews()
        
        tableView.reloadData()
    }
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(TestInnerTableCell.self, forCellReuseIdentifier: "Cell")
        return table
    }()
    
    var tableViewHeightConstraint: NSLayoutConstraint?
    
    func setupViews() {
        addSubview(tableView)
        addConstraints(format: "H:|-15-[v0]-15-|", views: tableView)
        addConstraints(format: "V:|-15-[v0]-15-|", views: tableView)
        
        tableViewHeightConstraint = tableView.heightAnchor.constraint(equalToConstant: 10)
        tableViewHeightConstraint?.isActive = true
    }
    
    var words: [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(words.count)
        tableViewHeightConstraint?.constant = 44 * CGFloat(words.count)
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TestInnerTableCell
        cell.word.text = words[indexPath.row]
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
