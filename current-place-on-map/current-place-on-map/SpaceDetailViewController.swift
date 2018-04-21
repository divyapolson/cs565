//
//  SpaceDetailViewController.swift
//  current-place-on-map
//
//  Created by Divya Polson on 4/14/18.
//  Copyright © 2018 William French. All rights reserved.
//

import UIKit

class SpaceDetailViewController: UIViewController {
    
    @IBOutlet weak var spacetitle: UILabel!
    @IBOutlet weak var spacedesc: UILabel!
    @IBOutlet weak var spaceemojis: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.spacetitle.text = "\(globalSelectedPlaces)"
        self.spacedesc.text = "\((dict[globalSelectedPlaces])!.desc)"
        self.spaceemojis.text = "\((dict[globalSelectedPlaces])!.emojis)"
        
        //set gradient background
        setGradientBackground()
        
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        self.spacedesc.sizeToFit()

    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red:0.20, green:0.68, blue:0.75, alpha:1.0).cgColor
        let colorBottom = UIColor(red:0.23, green:0.67, blue:0.88, alpha:1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
