//
//  MTAlertController.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/8.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTAlertController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let collectAction = UIAlertAction(title: "收藏", style: .Default, handler: nil)
        
        let reportAction = UIAlertAction(title: "举报", style: .Default, handler: nil)
        
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel , handler: nil)
        addAction(collectAction)
        addAction(reportAction)
        addAction(cancelAction)
    }



}
