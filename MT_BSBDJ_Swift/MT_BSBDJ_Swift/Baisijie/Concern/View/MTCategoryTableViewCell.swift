//
//  MTCategoryTableViewCell.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/3.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTCategoryTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var selectedIndicatorView: UIView!
    
    var category: MTCategory? {
        didSet {
            textLabel?.text = category?.name
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1.0)
        selectedIndicatorView.backgroundColor = UIColor(red: 219/255, green: 21/255, blue: 26/255, alpha: 1.0)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectedIndicatorView.hidden = !selected
        textLabel?.textColor = selected ? selectedIndicatorView.backgroundColor : UIColor(red: 78/255, green: 78/255, blue: 78/255, alpha: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel!.y = 1
        textLabel!.height = textLabel!.height - 2
    }
    
    
 
    
}
