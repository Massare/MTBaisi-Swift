//
//  MTUser.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/3.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit
import SwiftyJSON

class MTUser: NSObject {
    
    /**  昵称  */
    var screen_name:String?
    /**  头像  */
    var header:String?
    /**  粉丝  */
    var fans_count:NSNumber?
    
    
    init(dic:JSON){
        super.init()
        screen_name = dic["screen_name"].stringValue
        header = dic["header"].stringValue
        fans_count = dic["fans_count"].numberValue
        
    }
    
    
    
    class func users(array:[JSON]) -> NSMutableArray{
        
        let arrayM = NSMutableArray()
        
        for item in array{
            arrayM.addObject(MTUser.init(dic: item))
        }
        
        return arrayM
    }

}
