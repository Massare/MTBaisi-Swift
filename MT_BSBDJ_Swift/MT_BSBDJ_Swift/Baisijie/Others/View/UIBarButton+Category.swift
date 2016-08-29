//
//  UIBarButton+Category.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/1.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    class func createBarButton(image: String, highlightedImage: String, target: AnyObject?, action: Selector) -> UIBarButtonItem{
        let mButton = UIButton()
        mButton.setBackgroundImage(UIImage(named: image), forState: .Normal)
        mButton.setBackgroundImage(UIImage(named: highlightedImage), forState: .Selected)
        mButton.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        mButton.sizeToFit()
        
        return UIBarButtonItem(customView: mButton)
    }
    
    class func createBackButton(target: AnyObject?, action: Selector) -> UIBarButtonItem{
        let mButton = UIButton()
        mButton.setTitle("返回", forState: .Normal)
        mButton.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        mButton.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        mButton.setImage(UIImage(named: "navigationButtonReturn"), forState: .Normal)
        mButton.setImage(UIImage(named: "navigationButtonReturnClick"), forState: .Selected)
        mButton.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        mButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment(rawValue: 1)!
        mButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        mButton.bounds.size = CGSize(width: 70, height: 30)
        
        return UIBarButtonItem(customView: mButton)
    }
}