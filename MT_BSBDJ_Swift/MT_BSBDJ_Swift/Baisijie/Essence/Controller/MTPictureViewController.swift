//
//  MTPictureViewController.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/4.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTPictureViewController: UIViewController {
    
    
    @IBOutlet weak var containerScrollView: UIScrollView!
    
    let pictureImageView = UIImageView()
    
    
    var topic: MTTopic?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPictureImageView()
        
    }
    
   private func setPictureImageView() {
    let pictureW = MTScreenW
    let pictureH = MTScreenW * (topic?.height)! / (topic?.width)!
    
    if pictureH > MTScreenH {
        pictureImageView.frame = CGRect(x: 0, y: 0, width: pictureW, height: pictureH)
        containerScrollView.contentSize = pictureImageView.size
    }else {
        pictureImageView.size = CGSize(width: pictureW, height: pictureH)
        pictureImageView.centerY = MTScreenH * 0.5
    }
    
    pictureImageView.kf_setImageWithURL(NSURL(string: topic!.large_image)!)
    
    containerScrollView.addSubview(pictureImageView)

    }

    @IBAction func backButtonClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func saveButtonClick(sender: AnyObject) {
        
    }

    @IBAction func repostButtonClick(sender: AnyObject) {
        
    }
    
    @IBAction func commentButtonClick(sender: AnyObject) {
        
    }
    

}
