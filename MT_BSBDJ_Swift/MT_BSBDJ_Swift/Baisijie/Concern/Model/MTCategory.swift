//
//  MTCategory.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/3.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit
import SwiftyJSON

class MTCategory: NSObject {
    
    private(set) var a = 3
    //ID
    var id:NSNumber?
    //总数
    var count:NSNumber?
    //名字
    var name:String?
    /**  用户数据  */
    var users:[MTUser] = []
    
    init(dic:JSON){
        super.init()
        
        id = dic["id"].numberValue
        count = dic["count"].numberValue
        name = dic["name"].stringValue
        
    }
    
    class func categorys(array:[JSON]) -> NSMutableArray{
        
        let arrayM = NSMutableArray()
        
        for item in array{
            arrayM.addObject(MTCategory.init(dic: item))
            
        }
        
        return arrayM
    }
    

}
