//
//  MTRecommendViewController.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/3.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit
import MJRefresh
import SVProgressHUD


class MTRecommendViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var categoryTableView: UITableView!
    
    @IBOutlet weak var userTableView: UITableView!
    
    let categoryIdentifier = "categoryCell"
    let userIdentifier = "userCell"
    
    var categoryArray : [MTCategory] = []
    var currentCategory : MTCategory?
    
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        title = "推荐关注"
        
        setTableView()
        
        setRefresh()
        
        loadCategories()
    }
    
    
    //设置tableView
    private func setTableView() {
  
        categoryTableView.registerNib(UINib(nibName: "MTCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "MTCategoryTableViewCell")
        userTableView.registerNib(UINib(nibName:"MTUserTableViewCell", bundle: nil), forCellReuseIdentifier: "MTUserTableViewCell")
        
        automaticallyAdjustsScrollViewInsets = false
        categoryTableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        userTableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        userTableView.rowHeight = 70
    }
    
    private func setRefresh() {
        
        userTableView.tableFooterView = UIView.init()
        
        weak var weakSelf = self
        
        userTableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { () -> Void in
            weakSelf!.loadNewUsers()
        })

    }
    
    private func loadNewUsers() {
        
        let refreshCategory = self.currentCategory
        weak var weakSelf = self
        
        MTRecommendTool.getUsers(1, categoryId: (self.currentCategory?.id)!) { (obj) -> () in
            
            refreshCategory?.users = obj as! [MTUser]
            //   防止因为网速慢 导致 显示内容错位
            //  在闭包中，refreshCategory是局部变量，是值引用 不是址引用
            if refreshCategory != weakSelf!.currentCategory!{
                return
            }
            SVProgressHUD.dismiss()
            weakSelf!.userTableView.reloadData()
            //                let a =  self.userTableView.tableHeaderView as! MJRefreshNormalHeader
            //                a .endRefreshing()
            weakSelf!.userTableView.mj_header.endRefreshing()
            
        }
    }
    
  
    // MARK: - tableView DateSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if tableView == categoryTableView{
            return categoryArray.count
        }else{
            return currentCategory?.users.count ?? 0
        }
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        if tableView == categoryTableView{
            let cell = tableView.dequeueReusableCellWithIdentifier("MTCategoryTableViewCell") as! MTCategoryTableViewCell
            cell.category = categoryArray[indexPath.row]
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("MTUserTableViewCell", forIndexPath: indexPath) as! MTUserTableViewCell

            cell.user = currentCategory?.users[indexPath.row]

            return cell
        }
    }
    
    // MARK: - tableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if tableView == categoryTableView{
            
            //  停止刷新  网络请求并没有停止
//            let header =  self.userTableView.tableHeaderView as! MJRefreshNormalHeader
//            header.endRefreshing()
            self.userTableView.mj_header.beginRefreshing()
            
            currentCategory = categoryArray[indexPath.row]
            // 刷新tableView  保证 第一次加载时 不会显示刚刚的页面
            self.userTableView.reloadData()
            // 防止重新加载数据
            if (self.currentCategory!.users.isEmpty){
                self.userTableView.mj_header.endRefreshing()
            }
        }
    }
    
    // MARK: - private method
    // 获得左侧列表
    private func loadCategories() {
        
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(.Black)
        
        MTRecommendTool.getCategory { (obj) -> () in
            
            self.categoryArray = obj as! [MTCategory]
            self.categoryTableView.reloadData()
            self.categoryTableView.selectRowAtIndexPath(NSIndexPath.init(forRow: 0, inSection: 0), animated: true, scrollPosition: .Top)
            self.tableView(self.categoryTableView, didSelectRowAtIndexPath: NSIndexPath.init(forRow: 0, inSection: 0))
            
        }
        
    }

    

}
