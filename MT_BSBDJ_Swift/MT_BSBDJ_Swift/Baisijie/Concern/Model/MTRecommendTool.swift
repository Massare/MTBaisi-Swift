//
//  MTRecommendTool.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/3.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit
import SwiftyJSON
import SVProgressHUD

class MTRecommendTool: NSObject {
    // 获得左侧的标签列表
    class func getCategory(successfulBlock:((obj:AnyObject)->())){
        
        
        MTHTTPTool.getData("http://api.budejie.com/api/api_open.php?a=category&c=subscribe", failBlock: { (obj) -> Void in
            SVProgressHUD.showErrorWithStatus("加载失败")
            
            }) { (obj) -> Void in
                
                successfulBlock(obj: MTCategory.categorys(obj["list"].array!) as AnyObject)
                
        }
        
        
    }
    
    // 获得右侧的用户列表
    class func getUsers(page:NSNumber,categoryId:NSNumber,successfulBlock:((obj:AnyObject)->())){
        
        MTHTTPTool.getData("http://api.budejie.com/api/api_open.php?a=list&c=subscribe&category_id=\(categoryId)", failBlock: { (obj) -> Void in
            
            
            }) { (obj) -> Void in
                successfulBlock(obj: MTUser.users(obj["list"].array!) as AnyObject)
                
        }
    }
    
}
