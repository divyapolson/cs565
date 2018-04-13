//
//  CustomUISlider.swift
//  checkin
//
//  Created by Sushan Jiang on 4/5/18.
//  Copyright © 2018 sjiang23. All rights reserved.
//

import UIKit

class CustomUISlider: UISlider {

    @IBInspectable var trackHeight: CGFloat = 2
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: trackHeight))
    }
}
