//
//  MTConcernViewController.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/3.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTConcernViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationItem()
    }
    
    private func setNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButton("friendsRecommentIcon", highlightedImage: "friendsRecommentIcon-click", target: self, action: "pushRecommendViewController")
    }
    
    func pushRecommendViewController() {
        navigationController?.pushViewController(MTRecommendViewController(), animated: true)
    }

    @IBAction func loginAndRegisterButtonClick(sender: AnyObject) {
        presentViewController(MTLoginAndRegisgterViewController(), animated: true, completion: nil)
    }
    

}
