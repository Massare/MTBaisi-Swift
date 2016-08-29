//
//  MTVideoView.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/4.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTVideoView: UIView {
    
    @IBOutlet weak var videoImageView: UIImageView!
    
    @IBOutlet weak var playCountLabel: UILabel!

    @IBOutlet weak var videoTimeLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    override func awakeFromNib() {
        autoresizingMask = .None
    }
    
    class func videoView() -> MTVideoView {
        return NSBundle.mainBundle().loadNibNamed("MTVideoView", owner: nil, options: nil)[0] as! MTVideoView
    }
    
    var topic : MTTopic? {
        didSet {
            self.videoImageView.kf_setImageWithURL(NSURL.init(string: topic!.large_image)!)
            // 人数
            self.playCountLabel.text = NSString.init(format: "%d播放",topic!.playcount) as String
            // 时长
            let minute = topic!.videotime / 60
            let second = topic!.videotime % 60
            self.videoTimeLabel.text = NSString.init(format: "%02d:%02d",minute,second) as String
        }
    }
    
    @IBAction func playButtonClick(sender: AnyObject) {
    }
    
}
