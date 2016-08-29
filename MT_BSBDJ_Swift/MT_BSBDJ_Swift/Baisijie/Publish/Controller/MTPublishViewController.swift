//
//  MTPublishViewController.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/2.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTPublishViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var sloganImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setbasic()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        setAnimation()
    }
    
    private func setbasic() {
        
        self.view.userInteractionEnabled = false
        self.containerView.transform = CGAffineTransformMakeTranslation(0, -500)
        self.sloganImageView.transform = CGAffineTransformMakeTranslation(200, -200)
    }
    
    private func setAnimation() {
        
        UIView.animateWithDuration(0.5,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 10,
            options: .CurveEaseInOut,
            animations: { () -> Void in
                self.containerView.transform = CGAffineTransformIdentity
                self.sloganImageView.transform = CGAffineTransformIdentity
                
            }) { (bool:Bool) -> Void in
                self.view.userInteractionEnabled = true
        }
    }

    //mark -
    @IBAction func cancelButtonClick(sender: AnyObject) {
        
        self.view.userInteractionEnabled = false
        
        self.containerView.transform = CGAffineTransformIdentity
        self.sloganImageView.transform = CGAffineTransformIdentity
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.containerView.transform = CGAffineTransformMakeTranslation(0, 500)
            self.sloganImageView.transform = CGAffineTransformMakeTranslation(0, 700)
            }) { (bool:Bool) -> Void in
                self.dismissViewControllerAnimated(false, completion: nil)
        }
        
        
    }

}
