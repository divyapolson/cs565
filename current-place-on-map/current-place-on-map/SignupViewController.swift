//
//  SignupViewController.swift
//  current-place-on-map
//
//  Created by Sushan Jiang on 4/14/18.
//  Copyright © 2018 William French. All rights reserved.
//

import UIKit
import CoreData

class SignupViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repeatpw: UITextField!
    @IBOutlet weak var loginredirect: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        username.layer.borderWidth = 2
        password.layer.borderWidth = 2
        repeatpw.layer.borderWidth = 2
        username.layer.masksToBounds = true
        password.layer.masksToBounds = true
        repeatpw.layer.masksToBounds = true
        username.layer.borderColor = UIColor.white.cgColor
        password.layer.borderColor = UIColor.white.cgColor
        repeatpw.layer.borderColor = UIColor.white.cgColor
        username.setLeftPaddingPoints(10)
        password.setLeftPaddingPoints(10)
        repeatpw.setLeftPaddingPoints(10)
        
        //set gradient background
        setGradientBackground()
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        view.endEditing(true)
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
    
    @IBAction func returnlogin(_ sender: UIButton) {
        performSegue(withIdentifier: "gotologin", sender: self)
    }
    
    @IBAction func createaccountpressed(_ sender: UIButton) {
        
        if((!((username.text?.isEmpty)!)) && (!(password.text?.isEmpty)!) && (password.text == repeatpw.text))
        {
            let createSuccess = UserdataHandler.saveObject(username:username.text!, password:password.text!)
            if (createSuccess) {
                NSLog("Create account Successful");
                performSegue(withIdentifier: "gotologin", sender: nil)
            } else {
                NSLog("Create account failed");
                let alert1 = UIAlertController(title: "Create account failed", message:
                    "This username already exists", preferredStyle: UIAlertControllerStyle.alert)
                alert1.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: { (action) in
                    alert1.dismiss(animated:true, completion:nil)
                    self.username.text = ""
                    self.password.text = ""
                    self.repeatpw.text = ""
                }))
                self.present(alert1, animated: true, completion: nil)
            }
        }
        else
        {
            NSLog("Create account Failed");
            var alert : UIAlertController!
            if ((username.text?.isEmpty)! || (password.text?.isEmpty)!) {
                alert = UIAlertController(title: "Create account failed", message:
                    "Username and password can't be empty", preferredStyle: UIAlertControllerStyle.alert)
            }else if (password.text != repeatpw.text) {
                alert = UIAlertController(title: "Create account failed", message:
                    "Password entered didn't match", preferredStyle: UIAlertControllerStyle.alert)
            }
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: { (action) in
                alert.dismiss(animated:true, completion:nil)
                self.username.text = ""
                self.password.text = ""
                self.repeatpw.text = ""
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
