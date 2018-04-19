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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

