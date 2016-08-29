//
//  MTSquareButton.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/2.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit
import Kingfisher

class MTSquareButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBasic()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBasic() {
        setBackgroundImage(UIImage(named: "mainCellBackground"), forState: .Normal)
        setTitleColor(UIColor.blackColor(), forState: .Normal)
        titleLabel?.font = UIFont.systemFontOfSize(14)
        titleLabel?.textAlignment = .Center
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        imageView!.y = height*0.15
        imageView!.width = width * 0.5
        imageView!.height = imageView!.width
        imageView!.centerX = width * 0.5  //须写在最后, 不然导致点击图片偏移
        
        titleLabel!.x = 0
        titleLabel!.y = CGRectGetMaxY(imageView!.frame)
        titleLabel!.width = width
        titleLabel!.height = height - titleLabel!.y
    }
    
    var square : MTSquare? {
        didSet {
            setTitle(square!.name, forState: .Normal)
            kf_setImageWithURL(NSURL.init(string: (square!.icon))!, forState: .Normal)
        }
        
    }



}
