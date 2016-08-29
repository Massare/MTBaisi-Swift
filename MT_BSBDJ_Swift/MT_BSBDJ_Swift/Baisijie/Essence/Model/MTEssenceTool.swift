//
//  MTEssenceTool.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/8.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTEssenceTool: NSObject {
    
    /**
     获得推荐标签
     */
    class func getCategory
        (parameters:[String: AnyObject]? = nil,
        failBlock:((obj:AnyObject)->())? = nil,
        successfulBlock:((obj:AnyObject)->())) {
            MTHTTPTool.getData("http://api.budejie.com/api/api_open.php?a=tag_recommend&c=topic&action=sub", failBlock: { (obj) -> Void in
                
                
                }) { (obj) -> Void in
                    successfulBlock(obj:MTRecommendTag.tags(obj.array!)  as AnyObject)
                    
            }
            
    }
    
    /**
     获得段子里的内容
     */
    class func getTopics
        (parameters:[String:AnyObject]?,
        successfulBlock:(obj:AnyObject)->()){
            
            MTHTTPTool.getData("http://api.budejie.com/api/api_open.php",parameters:parameters, failBlock: { (obj) -> Void in
                
                }) { (obj) -> Void in
                    
                    successfulBlock(obj:[MTTopic.topics(obj["list"].array!),obj["info"]["maxtime"].stringValue])
            }
    }
    
    class func getComments
        (parameters:[String:AnyObject]?,
        successfulBlock:(obj:AnyObject)->()){
            
            MTHTTPTool.getData("http://api.budejie.com/api/api_open.php",parameters:parameters, failBlock: { (obj) -> Void in
                
                }) { (obj) -> Void in
                    
                    if obj == []{
                        successfulBlock(obj: [[],[],0])
                        return
                    }
                    
                    print(MTComment.comments(obj["hot"].array!))
                    
                    successfulBlock(obj:[MTComment.comments(obj["hot"].array!),MTComment.comments(obj["data"].array!),obj["total"].intValue])
            }
            
    }

}
