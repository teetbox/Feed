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
    
    let tableView: UITableView = {
        let table = Test2TableViewHandler(frame: .zero, style: .grouped)
        return table
    }()
    
    func setupViews() {
        view.addSubview(tableView)
        view.addConstraints(format: "H:|[v0]|", views: tableView)
        view.addConstraints(format: "V:|[v0]|", views: tableView)
    }
    
}

//extension Test2ViewController: UITableViewDataSource {
//    
//    
//    
//}

extension Test2ViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
//        headerView.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
//        headerView.clipsToBounds = true
//
//        let blueView = CornerShadowView(corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
//        headerView.addSubview(blueView)
//        headerView.addConstraints(format: "H:|-15-[v0]-15-|", views: blueView)
//        headerView.addConstraints(format: "V:[v0(50)]-(-5)-|", views: blueView)
//
//        return headerView
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 100
//    }
//
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView()
//        footerView.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
//        footerView.clipsToBounds = true
//
//        let blueView = CornerShadowView(corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
//
//        footerView.addSubview(blueView)
//        footerView.addConstraints(format: "H:|-15-[v0]-15-|", views: blueView)
//        footerView.addConstraints(format: "V:|-(-5)-[v0(40)]", views: blueView)
//
//        return footerView
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 50
//    }
    
}









