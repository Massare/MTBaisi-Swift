//
//  MTRecommendTag.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/4.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit
import SwiftyJSON

class MTRecommendTag: NSObject {
    /**  图片  */
    var image_list = ""
    /**  名字  */
    var theme_name = ""
    /**  订阅数  */
    var sub_number:NSNumber?
    
    init(dic:JSON){
        super.init()
        self.image_list = dic["image_list"].stringValue
        self.theme_name = dic["theme_name"].stringValue
        self.sub_number = dic["sub_number"].numberValue
        
    }
    
    class func tags(array:[JSON]) -> NSMutableArray{
        
        let arrayM = NSMutableArray()
        
        for item in array{
            arrayM.addObject(MTRecommendTag.init(dic: item))
        }
        
        return arrayM
    }

}
