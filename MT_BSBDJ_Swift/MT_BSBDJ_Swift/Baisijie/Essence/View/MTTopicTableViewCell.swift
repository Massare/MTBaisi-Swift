//
//  MTTopicTableViewCell.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/4.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTTopicTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nickNameLabel: UILabel!
    
    @IBOutlet weak var creatTimeLabel: UILabel!
    
    @IBOutlet weak var text_label: UILabel!
  
    
    @IBOutlet weak var hotCommentView: UIView!
    
    @IBOutlet weak var hotCommentLabel: UILabel!
    
    @IBOutlet weak var dingButton: UIButton!
    
    @IBOutlet weak var caiButton: UIButton!
    
    @IBOutlet weak var repostButton: UIButton!
    
    @IBOutlet weak var commentButton: UIButton!
    
    
    let pictureView = MTPictureView.pictureView()
    let voiceView = MTVoiceView.voiceView()
    let videoView = MTVideoView.videoView()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        backgroundView = UIImageView(image: UIImage(named: "mainCellBackground"))
        
    }
    
    var topic : MTTopic? {
        didSet {
            self.profileImageView.kf_setImageWithURL(NSURL.init(string: topic!.profile_image)!, placeholderImage: UIImage.init(named: "defaultUserIcon"))
            
            
//            self.isVipView.hidden = !(topic?.sina_v)!
            self.nickNameLabel.text = topic?.name
            self.creatTimeLabel.text = topic?.create_time
            self.text_label.text = topic?.text
            
            setButtonTitle(dingButton, count: (topic?.ding)!, placeHolder: "顶")
            setButtonTitle(commentButton, count: (topic?.comment)!, placeHolder: "评论")
            setButtonTitle(repostButton, count: (topic?.repost)!, placeHolder: "转发")
            setButtonTitle(caiButton, count: (topic?.cai)!, placeHolder: "踩")
            
            // 处理cell中间的图片视频和音频
            if topic?.type == .Picture{
                if self.pictureView.superview == nil{
                    self.contentView.addSubview(pictureView)
                }
                self.pictureView.hidden = false
                self.pictureView.topic = topic
                self.pictureView.frame = topic!.pictureFrame
                
                self.voiceView.hidden = true
                self.videoView.hidden = true
            }else if topic?.type == .Sound{
                
                if self.voiceView.superview == nil{
                    self.contentView.addSubview(voiceView)
                }
                
                self.voiceView.hidden = false
                self.voiceView.topic = topic
                self.voiceView.frame = topic!.pictureFrame
                
                self.pictureView.hidden = true
                self.videoView.hidden = true
            }else if topic?.type == .Video{
                
                if self.videoView.superview == nil{
                    self.contentView.addSubview(videoView)
                }
                
                self.videoView.hidden = false
                self.videoView.topic = topic
                self.videoView.frame = topic!.pictureFrame
                
                self.pictureView.hidden = true
                self.voiceView.hidden = true
            }else{
                self.pictureView.hidden = true
                self.voiceView.hidden = true
                self.videoView.hidden = true
            }
            // 最热评论
            if let comment = topic!.top_cmt{
                self.hotCommentView.hidden = false
                let str = NSString.init(format: "%@:%@", comment.user!.username,comment.content) as String
                self.hotCommentLabel.text = str
            }else{
                self.hotCommentView.hidden = true
            }
        }
        }


    private func setButtonTitle(button: UIButton, count: Int, var placeHolder: String) {
        
        if count >= 10000 {
            placeHolder = "\(count / 10000)万"
        } else if count > 0 {
            placeHolder = "\(count)"
        }
        button.setTitle(placeHolder, forState: .Normal)

    }

    @IBAction func collectAndReportButtonClick(sender: AnyObject) {
        
        let alertController = MTAlertController()
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
    }

    
    @IBAction func dingButtonClick(sender: AnyObject) {
        
    }
    
    @IBAction func caiButtonClick(sender: AnyObject) {
        
    }

    
    @IBAction func repostButtonClick(sender: AnyObject) {
        
    }
    
    @IBAction func commentButtonClick(sender: AnyObject) {
        
    }
    

    var oldFrame:CGRect?
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set {
            if oldFrame == frame {
                return
            }
            var newFrame = frame
            newFrame.origin.x = MTMargin / 2
            newFrame.size.width -= MTMargin
            newFrame.origin.y += MTMargin
            newFrame.size.height -= MTMargin
            
            oldFrame = newFrame
            super.frame = newFrame
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
