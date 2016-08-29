//
//  MTSquare.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/2.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit
import SwiftyJSON

class MTSquare{
    
    var icon : String = ""
    var name : String = ""
    var url : String = ""
    
    init(dic: JSON) {
        self.icon = dic["icon"].stringValue
        self.name = dic["name"].stringValue
        self.url = dic["url"].stringValue
    }
    
    class func squares(Array: [JSON]) -> NSArray {
        let arrayM = NSMutableArray()
        for item in Array {
            arrayM.addObject(MTSquare.init(dic: item))
        }
        return arrayM
    }


}
