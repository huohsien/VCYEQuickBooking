//
//  VCRoundButton.swift
//  VCYEQuickBooking
//
//  Created by victor on 2021/1/27.
//

import UIKit

class VCRoundButton: UIButton {
    
    @IBInspectable var titleColour: UIColor = .white {
        didSet {
            setTitleColor(titleColour, for: .normal)
        }
    }
    
    @IBInspectable var bgColour: UIColor = UIColor.gray {
        didSet {
            backgroundColor = bgColour
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
