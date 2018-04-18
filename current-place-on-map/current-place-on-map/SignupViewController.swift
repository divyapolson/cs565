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
    override func viewDidLoad() {
        super.viewDidLoad()

        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func createaccountpressed(_ sender: UIButton) {
        
        if((!((username.text?.isEmpty)!)) && (!(password.text?.isEmpty)!) && (password.text == repeatpw.text))
        {
            let createSuccess = UserdataHandler.saveObject(username:username.text!, password:password.text!)
            if (createSuccess) {
                NSLog("Create account Successful");
                performSegue(withIdentifier: "gotologin", sender: nil)
            } else {
                NSLog("Create account failer");
                let alert1 = UIAlertController(title: "Create account failed", message:
                    "Already exist this username", preferredStyle: UIAlertControllerStyle.alert)
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
                    "password entered in two times didn't match", preferredStyle: UIAlertControllerStyle.alert)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
