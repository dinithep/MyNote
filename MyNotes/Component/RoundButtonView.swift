//
//  RoundButtonView.swift
//  MyNotes
//
//  Created by Dinithe Asiri on 2021-10-02.
//

import UIKit
import Foundation

@IBDesignable
class RoundButton: UIButton {
    
    @IBInspectable var cornerRadius :CGFloat = 8 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        // Common logic goes here
    }
}
