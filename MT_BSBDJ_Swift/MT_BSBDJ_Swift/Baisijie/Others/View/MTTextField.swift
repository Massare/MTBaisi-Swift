//
//  MTTextField.swift
//  MT_BSBDJ_Swift
//
//  Created by Austen on 16/8/3.
//  Copyright © 2016年 mlc. All rights reserved.
//

import UIKit

class MTTextField: UITextField {

    override func awakeFromNib() {
        tintColor = textColor
        resignFirstResponder()
    }
    
    override func becomeFirstResponder() -> Bool {
        let attrs = [NSForegroundColorAttributeName:textColor as! AnyObject]
        let placeholder = NSAttributedString.init(string: self.placeholder!, attributes: attrs)
        attributedPlaceholder = placeholder
        return super.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        let attrs = [NSForegroundColorAttributeName : UIColor.darkGrayColor() as AnyObject]
        let placeHolder = NSAttributedString(string: placeholder!, attributes: attrs)
        attributedPlaceholder = placeHolder
        
        return super.resignFirstResponder()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        endEditing(true)
    }
}
