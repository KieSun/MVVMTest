//
//  ViewController.swift
//  MMVMTest
//
//  Created by 俞诚恺 on 16/4/15.
//  Copyright © 2016年 com.edu-meta.student. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UITableViewController {

    var dataArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        setupNavigationItem()
        setupTableView()
        loadData()
    }

    func setupNavigationItem() -> Void {
        navigationItem.title = "首页"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "navigationbar_setting"), style: .Done, target: self, action: #selector(ViewController.chick))
    }
    
    func setupTableView() -> Void {
        tableView.delegate = self
        tableView.dataSource = self
        automaticallyAdjustsScrollViewInsets = false
        tableView.rowHeight = 80.0
    }
    
    func loadData() {
        cellViewModel.loadCellData({ (dataSoure) in
            self.dataArray = dataSoure
            self.tableView.reloadData()
            }) { (error) in
            print(error)
        }
    }
    
    func chick() -> Void {
        print("chick")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let model = dataArray[indexPath.row] as! cellModel
        
        let cell = TableViewCell.tableViewCell(tableView, indexPath: indexPath, model: model)
        
        return cell
    }
}

