//
//  ViewController.swift
//  Login
//
//  Created by Colleen J. Heinemann on 4/14/18.
//  Copyright © 2018 Colleen Heinemann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var UsernameText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var LoginButton: UIButton!
    
    @IBAction func LoginBtnPressed(_ sender: Any)
    {
        if((UsernameText.text?.contains("colleen"))! && (PasswordText.text?.contains("admin"))!)
        {
            NSLog("Login Successful");
        }
        else
        {
            NSLog("Login Failed");
        }
    }
}

