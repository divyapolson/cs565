//
//  CustomUISlider.swift
//  current-place-on-map
//
//  Created by Sushan Jiang on 4/13/18.
//  Copyright © 2018 William French. All rights reserved.
//

import UIKit

class CustomUISlider: UISlider {


    @IBInspectable var trackHeight: CGFloat = 2
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: trackHeight))
    }

}
