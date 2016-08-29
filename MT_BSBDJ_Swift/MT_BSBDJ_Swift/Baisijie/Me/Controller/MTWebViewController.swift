//
//  MTWebViewController.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/2.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTWebViewController: UIViewController {

    var webView = UIWebView.init()
    
    var url:NSURLRequest?{
        didSet{
            self.webView.loadRequest(url!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.frame = self.view.bounds
        self.view.addSubview(webView)
        
        
    }

}
