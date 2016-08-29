//
//  MTLoginAndRegisgterViewController.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/3.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTLoginAndRegisgterViewController: UIViewController {
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var loginAndRegisterButton: UIButton!
    
    @IBOutlet weak var loginViewLeftSpace: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBasic()
    }

    private func setBasic() {
       UIApplication.sharedApplication().statusBarStyle = .LightContent
        
    }
    
    
    @IBAction func backButtonClick(sender: AnyObject) {
        UIApplication.sharedApplication().statusBarStyle = .Default
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func loginAndRegisterButton(sender: UIButton) {
        view.endEditing(true)
        sender.selected = !sender.selected
        loginViewLeftSpace.constant = sender.selected ? -self.view.width : 0
        UIView.animateWithDuration(0.25) { () -> Void in
            self.view.layoutIfNeeded()
        }
    }


}
