//
//  MTTopicUser.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/4.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit
import SwiftyJSON

class MTTopicUser: NSObject {
    /**  用户  */
    var username = ""
    /**  性别  */
    var sex = ""
    /**  头像 */
    var profile_image = ""
    
    init(dic:JSON){
        super.init()
        
        self.username = dic["username"].stringValue
        self.sex = dic["sex"].stringValue
        self.profile_image = dic["profile_image"].stringValue
        
    }
    
    class func users(array:[JSON]) -> NSMutableArray{
        
        let arrayM = NSMutableArray()
        
        for item in array{
            arrayM.addObject(MTUser.init(dic: item))
        }
        
        return arrayM
    }
}
