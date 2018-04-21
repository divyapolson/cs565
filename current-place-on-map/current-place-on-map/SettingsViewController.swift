//
//  SettingsViewController.swift
//  current-place-on-map
//
//  Created by Sushan Jiang on 4/20/18.
//  Copyright © 2018 William French. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var cpassword: UITextField!
    @IBOutlet weak var repeatcpassword: UITextField!
    @IBOutlet weak var privacyindication: UILabel!
    @IBOutlet weak var privacyswitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        let usernow = UserdataHandler.fetchOneObject(username:globalUsername)
        privacyswitch.isOn = usernow!.privacy
        if (!(privacyswitch.isOn)) {
            privacyindication.text="Your comments will be seen by others."
        } else {
            privacyindication.text="Your comments will not be seen by others."
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickchangepw(_ sender: UIButton) {
        if( (!(cpassword.text?.isEmpty)!) && (repeatcpassword.text == cpassword.text))
        {
            var usernow = UserdataHandler.fetchOneObject(username:globalUsername)
            usernow!.setValue(cpassword.text, forKey: "password")
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            do {
                try context.save()
            } catch {
                NSLog("Create account fail");
                let alert1 = UIAlertController(title: "Change password failed", message:
                    "some system error", preferredStyle: UIAlertControllerStyle.alert)
                alert1.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: { (action) in
                    alert1.dismiss(animated:true, completion:nil)
                    self.cpassword.text = ""
                    self.repeatcpassword.text = ""
                }))
                self.present(alert1, animated: true, completion: nil)
            }
            NSLog("Create account success");
            let alert1 = UIAlertController(title: "Change password succeed!", message:
                "You can now use your new password for log in", preferredStyle: UIAlertControllerStyle.alert)
            alert1.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: { (action) in
                alert1.dismiss(animated:true, completion:nil)
                self.cpassword.text = ""
                self.repeatcpassword.text = ""
            }))
            self.present(alert1, animated: true, completion: nil)
        }
        else
        {
            NSLog("Create account Failed");
            var alert : UIAlertController!
            if ((cpassword.text?.isEmpty)!) {
                alert = UIAlertController(title: "Change password failed", message:
                    "Password can't be empty", preferredStyle: UIAlertControllerStyle.alert)
            }else if (cpassword.text != repeatcpassword.text) {
                alert = UIAlertController(title: "Change password failed", message:
                    "password entered in two times didn't match", preferredStyle: UIAlertControllerStyle.alert)
            }
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: { (action) in
                alert.dismiss(animated:true, completion:nil)
                self.cpassword.text = ""
                self.repeatcpassword.text = ""
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func switchprivacy(_ sender: UISwitch) {
        var usernow = UserdataHandler.fetchOneObject(username:globalUsername)
        if (!(privacyswitch.isOn)) {
            usernow!.setValue(false, forKey: "privacy")
            privacyindication.text="Your comments will be seen by others."
        } else {
            usernow!.setValue(true, forKey: "privacy")
            privacyindication.text="Your comments will not be seen by others."
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        do {
            try context.save()
        } catch {
            print("Failed updating privacy")
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
