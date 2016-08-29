//
//  MTVoiceView.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/4.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTVoiceView: UIView {
    
    @IBOutlet weak var voiceImageView: UIImageView!
    
    @IBOutlet weak var playCountLabel: UILabel!

    @IBOutlet weak var voiceTimeLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    

    
    
    
    override func awakeFromNib() {
        autoresizingMask = .None
    }
    
    class func voiceView() -> MTVoiceView {
        return NSBundle.mainBundle().loadNibNamed("MTVoiceView", owner: nil, options: nil)[0] as! MTVoiceView
    }
    
    var topic : MTTopic? {
        didSet {
            self.voiceImageView.kf_setImageWithURL(NSURL.init(string: topic!.large_image)!)
            // 人数
            self.playCountLabel.text = NSString.init(format: "%d播放",topic!.playcount) as String
            // 时长
            let minute = topic!.voicetime / 60
            let second = topic!.voicetime % 60
            self.voiceTimeLabel.text = NSString.init(format: "%02d:%02d",minute,second) as String
        }
    }
    
    @IBAction func playButtonClick(sender: AnyObject) {
    }
    

}
