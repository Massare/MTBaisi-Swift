//
//  MTTabBarController.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/1.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTTabBarController: UITabBarController {
    
    override class func initialize() {
        var attrs = [String : AnyObject]()
        attrs[NSForegroundColorAttributeName] = UIColor.darkGrayColor()
        UITabBarItem.appearance().setTitleTextAttributes(attrs, forState: .Selected)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewControllers()
        
        setTabBar()
    }
    
    private func addChildViewControllers() {
        addChildViewController(MTEssenceViewController(), title: "精华", image: "tabBar_essence_icon", selectedImage: "tabBar_essence_click_icon")
        addChildViewController(MTNewViewController(), title: "新贴", image: "tabBar_new_icon", selectedImage: "tabBar_new_click_icon")
        addChildViewController(MTConcernViewController(), title: "关注", image: "tabBar_friendTrends_icon", selectedImage: "tabBar_friendTrends_click_icon")
        addChildViewController(MTMeTableViewController(style:.Grouped), title: "我", image: "tabBar_me_icon", selectedImage: "tabBar_me_click_icon")
    }

    private func setTabBar() {
        let mTabBar = MTTabBar()
        setValue(mTabBar, forKey: "tabBar")
    }
    
    private func addChildViewController(childController: UIViewController, title: String, image: String, selectedImage: String) {
        childController.title = title
        childController.tabBarItem.image = UIImage(named: image)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImage)
        
        let nav = MTNavigationController()
        nav.addChildViewController(childController)
        addChildViewController(nav)
    }

}
