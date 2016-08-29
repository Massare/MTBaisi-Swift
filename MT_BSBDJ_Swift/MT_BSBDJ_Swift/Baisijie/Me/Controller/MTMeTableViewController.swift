//
//  MTMeTableViewController.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/1.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTMeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = MTGlobalColor
        
        setNavigationBar()
        
        setTableView()
        
    }
    
    override func viewWillLayoutSubviews() {
       self.tableView.contentSize = CGSize(width: MTScreenW, height:CGRectGetMaxY(self.tableView.tableFooterView!.frame))
    }
    
    
    
    func setNavigationBar () {
        // 设置导航栏标题
        navigationItem.title = "我的"
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem.createBarButton("mine-setting-icon", highlightedImage: "mine-setting-icon-click", target: self, action: "tagView"), UIBarButtonItem.createBarButton("mine-moon-icon", highlightedImage: "mine-moon-icon-click", target: self, action: "tagView")]
    }
    
    func tagView() {
        
    }
    
    func setTableView() {
        
        self.tableView.separatorStyle = .None
        
        self.tableView.sectionHeaderHeight = 0
        self.tableView.sectionFooterHeight = MTMargin
        
        self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0)
        
        self.tableView.tableFooterView = MTFooterView.init(frame: CGRectZero, settingHeightAction: { () -> () in
            //            self.tableView.setn
        })

    }
    
    // MARK: - tableView Datasource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = UITableViewCell.init()
        cell.selectionStyle = .None
        cell.textLabel?.font = UIFont.systemFontOfSize(17)
        
        if (indexPath.section == 0) {
            cell.imageView?.image = UIImage.init(named: "mine-moon-icon-nearby")
            cell.textLabel!.text = "登录/注册"
        } else if (indexPath.section == 1) {
            cell.textLabel!.text = "离线下载"
        }
        
        return cell
        
        
    }

}
