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
        
        //styling username + password text fields
        UsernameText.layer.borderWidth = 2
        PasswordText.layer.borderWidth = 2
        UsernameText.layer.masksToBounds = true
        PasswordText.layer.masksToBounds = true
        UsernameText.layer.borderColor = UIColor.white.cgColor
        PasswordText.layer.borderColor = UIColor.white.cgColor
        UsernameText.setLeftPaddingPoints(10)
        PasswordText.setLeftPaddingPoints(10)
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        //add gradient background
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
                globalUsername = i.username!
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

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
