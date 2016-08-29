//
//  MTUserTableViewCell.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/3.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit
import Kingfisher

class MTUserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var nickNameLabel: UILabel!

    @IBOutlet weak var fansCountLabel: UILabel!
    
    var user : MTUser? {
        didSet {
            nickNameLabel.text = user!.screen_name
            fansCountLabel.text = "\(user!.fans_count!)人关注"
            headerImageView.kf_setImageWithURL(NSURL(string: user!.header!)!, placeholderImage: UIImage(named: "defaultUserIcon"))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func concernButtonClick(sender: UIButton) {
    }
    
}
