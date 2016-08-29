//
//  MTCommentViewController.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/9.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTCommentViewController: UIViewController {
    
    @IBOutlet weak var commentTableView: UITableView!
    
    @IBOutlet weak var bottomSpace: NSLayoutConstraint!
    
    @IBOutlet weak var commentTextField: UITextField!
    
    var topic: MTTopic?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
