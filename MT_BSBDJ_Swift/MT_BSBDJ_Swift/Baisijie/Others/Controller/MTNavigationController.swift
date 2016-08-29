//
//  MTNavigationController.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/1.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTNavigationController: UINavigationController {
    
    override class func initialize() {
        
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: UIFont.boldSystemFontOfSize(20)]
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "navigationbarBackgroundWhite"), forBarMetrics: .Default)
    UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName:UIFont.systemFontOfSize(17)], forState: .Normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.createBackButton(self, action: "backButtonClick")
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func backButtonClick() {
        popViewControllerAnimated(true)
    }

}
