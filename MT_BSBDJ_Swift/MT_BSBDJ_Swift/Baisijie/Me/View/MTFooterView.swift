//
//  MTFooterView.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/2.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTFooterView: UIView {

    var settingHeightAction = {()}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clearColor()
        // 参数
        var params = [String:String]()
        params["a"] = "square";
        params["c"] = "topic";
        
        MTHTTPTool.getData("http://api.budejie.com/api/api_open.php" , parameters: params, failBlock: { (obj) -> Void in
            
            }) { (obj) -> Void in
                let squares = MTSquare.squares(obj["square_list"].array!)
                
                self.create(squares)
        }
        
    }
    
    convenience init(frame: CGRect, settingHeightAction:()->()) {
        self.init(frame: frame)
        self.settingHeightAction = settingHeightAction
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func create(squares:NSArray) {
        
        let maxCols:CGFloat = 4
        
        
        let buttonW = MTScreenW / maxCols
        let buttonH = buttonW - 1
        
        for i in 0 ..< squares.count{
            
            let button =  MTSquareButton.init()
            let square = squares[i] as! MTSquare
            button.square = square
            button.addTarget(self, action: "loadWebView:", forControlEvents: .TouchUpInside)
            self.addSubview(button)
            
            let col = CGFloat(i) % maxCols
            let row = i / Int(maxCols)
            
            button.width = buttonW
            button.height = buttonH
            button.x = col * buttonW
            button.y = CGFloat(row) * buttonH
            
            
            button.frame = CGRect(x: button.x, y: button.y, width: button.width, height: button.height)
            
        }
        
        let rows = (CGFloat(squares.count) + maxCols - 1) / maxCols
        self.height = rows * buttonH + MTMargin
        
    }
    
    func loadWebView(button:MTSquareButton) {
        
        if button.square!.url.hasPrefix("http"){
            let vc = MTWebViewController.init()
            
            vc.url = NSURLRequest.init(URL:NSURL.init(string: button.square!.url)! )
            
            let tvc = UIApplication.sharedApplication().keyWindow?.rootViewController as! UITabBarController
            let nvc = tvc.selectedViewController as! UINavigationController
            
            vc.title = button.square?.name
            nvc.pushViewController(vc, animated: true)
        }
    }
    

}
