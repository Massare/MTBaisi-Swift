//
//  MTComment.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/4.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit
import SwiftyJSON

class MTComment: NSObject {
    

    var id = ""

    var voicetime = 0

    var voiceuri:String = ""

    var content = ""

    var like_count = 0

    var user:MTTopicUser?

    var cellHeight:CGFloat = 0
    
    init(dic:JSON){
        super.init()
        self.id = dic["id"].stringValue
        self.voicetime = dic["voicetime"].intValue
        self.voiceuri = dic["voiceuri"].stringValue
        self.content = dic["content"].stringValue
        self.like_count = dic["like_count"].intValue
        self.user = MTTopicUser.init(dic: dic["user"])
        
        let topic = self.content as NSString
        let maxSize = CGSizeMake(UIScreen.mainScreen().bounds.width - 105,CGFloat(MAXFLOAT))
        let textH = topic.boundingRectWithSize(maxSize, options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName : UIFont.systemFontOfSize(17)], context: nil).size.height
        // 只有文字时的高度
        self.cellHeight = CGFloat(50) + textH
        
        if !self.voiceuri.isEmpty{
            self.cellHeight = 74
        }
        
        
        
    }
    
    class func comments(array:[JSON]) -> NSMutableArray{
        
        let arrayM = NSMutableArray()
        
        for item in array{
            arrayM.addObject(MTComment.init(dic: item))
        }
        
        return arrayM
    }

}
