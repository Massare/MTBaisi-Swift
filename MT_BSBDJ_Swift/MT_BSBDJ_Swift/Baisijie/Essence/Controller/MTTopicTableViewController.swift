//
//  MTTopicTableViewController.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/8.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit
import MJRefresh
import SwiftyJSON

class MTTopicTableViewController: UITableViewController {
    /**  数据源  */
    var topics:[MTTopic] = []
    /**  话题id  */
    var type = 0
    /**  当前页  */
    var page = 1
    /**  请求下一页需要的参数  */
    var maxtime = ""
    /**  请求地址需要的的字典  */
    var params = NSMutableDictionary()
  
    var header:MJRefreshNormalHeader{
        return (self.tableView.tableHeaderView as? MJRefreshNormalHeader)!
    }
    /**  footer  */
    var footer:MJRefreshFooter{
        return (self.tableView.tableFooterView as? MJRefreshFooter)!
    }
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置tableview
        setupTableView()
        // 设置刷新控件
        setupRefrshControl()
        
    }
    
    
    
    // MARK: - private method
    
    // 设置tableview
    func setupTableView() {
        
       
        
        tableView.contentInset = UIEdgeInsets(top: 99, left: 0, bottom: 44, right: 0)
        // 滚动条的偏移值
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 99, left: 0, bottom: 44, right: 0)
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.clearColor()
        tableView.registerNib(UINib.init(nibName: "MTTopicTableViewCell", bundle: nil), forCellReuseIdentifier: "MTTopicTableViewCell")
    }
    
    // 设值刷新控件
    func setupRefrshControl() {
        
//        weak var weakSelf = self
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: { () -> Void in
            // 结束上啦刷新
            self.loadNewTopics()
        })
        tableView.mj_header.automaticallyChangeAlpha = true
        tableView.mj_header.beginRefreshing()
        
        tableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: { () -> Void in
            
            self.loadMoreTopics()
            
        })
        
        tableView.mj_footer.hidden = true
        
    }
    
    private func loadNewTopics() {
        
      
        tableView.mj_footer.endRefreshing()
        
        var params = [String:AnyObject]()
        params["a"] = self.parentViewController!.isKindOfClass(MTNewViewController) ? "newlist" : "list"
        params["c"] = "data";
        params["type"] = self.type
        
        self.params.setDictionary(params);
        
        // 发送请求
        MTEssenceTool.getTopics(params, successfulBlock: { (obj) -> () in
            // 返回的结果 不是最新一次的结果 不处理
            if (!self.params.isEqualToDictionary(params)){
                return
            }
            
            self.topics = obj[0] as! [MTTopic]
            self.tableView.mj_footer.hidden = false
            self.maxtime = obj[1] as! String
            self.tableView.reloadData()
            self.tableView.mj_header.endRefreshing()
            
            self.page = 0
        })
    }
    
    private func loadMoreTopics() {
        
        tableView.mj_header.endRefreshing()
        var params = [String:AnyObject]()
        params["a"] = self.parentViewController!.isKindOfClass(MTNewViewController) ? "newlist" : "list"
        params["c"] = "data"
        params["type"] = self.type
        let page = self.page + 1
        params["page"] = page
        params["maxtime"] = self.maxtime;
        self.params.setDictionary(params)
        // 发送请求
        MTEssenceTool.getTopics(params, successfulBlock: { (obj) -> () in
            // 返回的结果 不是最新一次的结果 不处理
            if (!self.params.isEqualToDictionary(params)){
                return
            }
            self.topics += obj[0] as! [MTTopic]
            self.maxtime = obj[1] as! String
            self.tableView.reloadData()
            self.tableView.mj_footer.endRefreshing()
            self.page = page
        })
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MTTopicTableViewCell") as! MTTopicTableViewCell
        cell.topic = self.topics[indexPath.row]
        return cell
    }
    
    
    
    // MARK: - tableView  delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let commentController = MTCommentViewController()
        commentController.topic = self.topics[indexPath.row]
        navigationController?.pushViewController(commentController, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return topics[indexPath.row].cellHeight
    }

 

}
