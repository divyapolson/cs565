//
//  LoginViewController.swift
//  current-place-on-map
//
//  Created by Sushan Jiang on 4/14/18.
//  Copyright © 2018 William French. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

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
        let enteru = UsernameText.text
        let enterp = PasswordText.text
        if ((enteru?.isEmpty)! || (enterp?.isEmpty)!) {
            let alert1 = UIAlertController(title: "Login failed", message:
                "Username and password can't be empty", preferredStyle: UIAlertControllerStyle.alert)
            alert1.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: { (action) in
                alert1.dismiss(animated:true, completion:nil)
                self.UsernameText.text = ""
                self.PasswordText.text = ""
            }))
            self.present(alert1, animated: true, completion: nil)
        }
        var flag = false
        let users = UserdataHandler.fetchObject()
        for i in users! {
            if (i.username == enteru && i.password == enterp) {
                flag = true
                break
            }
        }
        if(flag)
        {
            NSLog("Login Successful");
            performSegue(withIdentifier: "gotomain", sender: nil)
        }
        else
        {
            NSLog("Login Failed");
            
            let alert = UIAlertController(title: "Login failed", message:
                "Username and Password don't match. Try again!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: { (action) in
                alert.dismiss(animated:true, completion:nil)
                self.UsernameText.text = ""
                self.PasswordText.text = ""
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }

}
