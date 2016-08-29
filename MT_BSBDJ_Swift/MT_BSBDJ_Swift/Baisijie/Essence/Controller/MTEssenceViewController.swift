//
//  MTEssenceViewController.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/1.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTEssenceViewController: UIViewController,UIScrollViewDelegate {
    
    
    let contentView = UIScrollView.init()
    
    let contentCount = 5
    
    let titleView = UIView.init()
    
    let indicateLine = UIView.init()
    
    var selectedBtn:UIButton?
    
    var contentIds:[TopicType] = [.All,.Video,.Picture,.Word,.Sound]

    var currentPage:Int{
        return Int(contentView.contentOffset.x / view.frame.size.width)
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setNavigationBarAndBasic()
        
        addChildViewControllers()
        
        setContentView()
        
        setTitleView()
        
    }

    private func setNavigationBarAndBasic() {
        navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButton("MainTagSubIcon", highlightedImage: "MainTagSubIconClick", target: self, action: "tagBarButtonClick")
        navigationItem.titleView = UIImageView(image: UIImage(named: "MainTitle"))
        
        view.backgroundColor = MTGlobalColor
    }
    
    func tagBarButtonClick() {
        navigationController?.pushViewController(MTTagTableViewController(), animated: true)
    }
    
    private func addChildViewControllers() {
        for i in 0..<contentCount {
            let vc = MTTopicTableViewController()
            vc.type = contentIds[i].rawValue
            addChildViewController(vc)
        }
    }
    
    private func setContentView() {
        automaticallyAdjustsScrollViewInsets = false
        
        contentView.backgroundColor = UIColor.clearColor()
        contentView.frame = view.bounds
        contentView.delegate = self
        contentView.pagingEnabled = true
        contentView.contentSize = CGSizeMake((view.width) * CGFloat(contentCount), 0)
        
        view.addSubview(contentView)
        
    }
    
    private func setTitleView() {
        titleView.frame = CGRect(x: 0, y: 64, width: MTScreenW, height: 35)
        titleView.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
        view.addSubview(titleView)
        
        indicateLine.backgroundColor = UIColor.redColor()
        indicateLine.frame = CGRect(x: 0, y: 33, width: 0, height: 2)
        
        let width = view.width * 0.2
        let height = titleView.height
        let array = ["全部","视频", "图片", "段子", "声音"]
        
        for i in 0..<contentCount {
            let btn = UIButton()
            btn.frame = CGRect(x: CGFloat(i)*width, y: 0, width: width, height: height)
            btn.tag = i
            btn.setTitle(array[i], forState: .Normal)
            btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            btn.setTitleColor(UIColor.redColor(), forState: .Disabled)
            btn.addTarget(self, action: "titleButtonClick:", forControlEvents: .TouchUpInside)
            titleView.addSubview(btn)
            
            if i == 0 {
                titleButtonClick(btn)
                btn.titleLabel?.sizeToFit()
                indicateLine.width = (btn.titleLabel?.width)!
                indicateLine.centerX = btn.centerX
                
            }
            titleView.addSubview(indicateLine)
        }
    }
    
    func titleButtonClick(button: UIButton) {
        
        selectedBtn?.enabled = true
        button.enabled = false
        selectedBtn = button
        weak var weakSelf = self

        UIView.animateWithDuration(0.2) { () -> Void in
            weakSelf!.indicateLine.width = (button.titleLabel?.width)!
            weakSelf!.indicateLine.centerX = button.centerX
        }
        contentView.setContentOffset(CGPoint(x: CGFloat(button.tag) * MTScreenW, y: 0), animated: true)
        
        scrollViewDidEndScrollingAnimation(contentView)
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
   
        scrollViewDidEndScrollingAnimation(scrollView)
        
        titleButtonClick(titleView.subviews[currentPage] as! UIButton)
     
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        
        let controller = childViewControllers[currentPage] as! MTTopicTableViewController
        
        controller.view.frame = view.frame
        controller.view.x = scrollView.contentOffset.x
        
        contentView.addSubview(controller.view)
        
        
    }
    
    
    
}
