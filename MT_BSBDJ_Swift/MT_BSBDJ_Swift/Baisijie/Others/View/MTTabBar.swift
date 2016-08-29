//
//  MTTabBar.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/1.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTTabBar: UITabBar {
    let publishButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        publishButton.setBackgroundImage(UIImage(named: "tabBar_publish_icon"), forState: .Normal)
        publishButton.setBackgroundImage(UIImage(named: "tabBar_publish_click_icon"), forState: .Highlighted)
        
        publishButton.addTarget(self, action: "presentPublishViewController", forControlEvents: .TouchUpInside)
        
        publishButton.sizeToFit()
        addSubview(publishButton)
        
        backgroundImage = UIImage(named: "tabbar-light")
        
    }
    
    func presentPublishViewController() {
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(MTPublishViewController(), animated: false, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var add = true
        let width = frame.width*0.2
        var buttonIndex : CGFloat = 0

        publishButton.center = CGPoint(x: self.center.x, y: self.frame.size.height*0.5)
        
        for item in subviews {
            if item.isKindOfClass(NSClassFromString("UITabBarButton")!) {
                item.frame = CGRect(x: width*((buttonIndex > 1) ? (buttonIndex + 1) : buttonIndex), y: 0, width: width, height: self.frame.size.height)
                buttonIndex++
                if add == true {
//                    item.addTarget(self, action: "itemButtonClick", forControlEvents: .TouchUpInside)
                }
            }
        }
        add = false
    }
    
    func itemButtonClick() {
        NSNotificationCenter.defaultCenter().postNotificationName(MCTabBarDidSelectNotification, object: nil, userInfo: nil)
    }
    
    
    
    
    
    
    
    
    
}
