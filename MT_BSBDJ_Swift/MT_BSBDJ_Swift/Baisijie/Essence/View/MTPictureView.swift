//
//  MTPictureView.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/4.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit
import Kingfisher


class MTPictureView: UIView {
    
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    @IBOutlet weak var gifIconImageView: UIImageView!
    
    @IBOutlet weak var bigPictureButton: UIButton!
    
//    @IBOutlet weak var progressView: DALabeledCircularProgressView!

    

    override func awakeFromNib() {
        autoresizingMask = .None
        pictureImageView.userInteractionEnabled = true
        pictureImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "showPictureViewController"))
//        progressView.progressLabel.textColor = UIColor.whiteColor()
//        progressView.roundedCorners = 2
    }
    
    func showPictureViewController() {
        let pictureController = MTPictureViewController()
        pictureController.topic = topic
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(pictureController, animated: true, completion: nil)
    }
    
    var topic : MTTopic? {
        didSet {
            setProgress()
      
            pictureImageView.kf_setImageWithURL(NSURL.init(string: (topic?.large_image)!)!,
                placeholderImage: nil,
                optionsInfo: nil,
                progressBlock: { (receivedSize, totalSize) -> () in
//                    progressView.hidden = false
//                    weakSelf.topic!.imageProgress = CGFloat(receivedSize)/CGFloat(totalSize)
//                    weakSelf.setProgress()
                },
                completionHandler: { (image, error, cacheType, imageURL) -> () in
                    
                    if image != nil{
//                        self.progressView.hidden = true
                        self.pictureImageView.userInteractionEnabled = true
                        
                        if (self.topic?.isBigImage == false) {
                            return
                        }
                        
                        // 为了让大图的顶部显示到上边
                        UIGraphicsBeginImageContextWithOptions(self.topic!.pictureFrame.size, true, 0.0);
                        
                        let width = self.topic!.pictureFrame.size.width
                        let height = width * (image?.size.height)! / (image?.size.width)!
                        image?.drawInRect(CGRect(x: 0, y: 0, width: width, height: height))
                        
                        self.pictureImageView.image = UIGraphicsGetImageFromCurrentImageContext();
                        
                        UIGraphicsEndImageContext();
                    }
                    
                }
            )

            //是否gif动图
            gifIconImageView.hidden = !topic!.large_image.lowercaseString.hasSuffix("gif")
            // 是否是大图
            bigPictureButton.hidden = !topic!.isBigImage
        }
    }
    
    private func setProgress() {
//        self.progressView.hidden = false;
//        self.progressView.setProgress(self.topic!.imageProgress, animated: false)
//        let str = NSString(string: "\((Int(self.topic!.imageProgress * 100)))%");
//        str.stringByReplacingOccurrencesOfString("-", withString: "")
//        self.progressView.progressLabel.text = str as String
        
        // 当没下载完的时候 不能查看大图
        self.pictureImageView.userInteractionEnabled = false
    }
    
    class func pictureView() ->MTPictureView {
        return NSBundle.mainBundle().loadNibNamed("MTPictureView", owner: nil, options:nil)[0] as! MTPictureView
    }

}
