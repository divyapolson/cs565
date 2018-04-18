//
//  CheckinViewController.swift
//  current-place-on-map
//
//  Created by Sushan Jiang on 4/13/18.
//  Copyright © 2018 William French. All rights reserved.
//

import UIKit
import CoreData

class CheckinViewController: UIViewController {

    @IBOutlet weak var checkinlabel: UILabel!
    @IBOutlet weak var comments: UITextField!
    @IBOutlet weak var angry1: UIButton!
    @IBOutlet weak var angry2: UIButton!
    @IBOutlet weak var angry3: UIButton!
    @IBOutlet weak var angryd: UIButton!
    @IBOutlet weak var sad1: UIButton!
    @IBOutlet weak var sad2: UIButton!
    @IBOutlet weak var sad3: UIButton!
    @IBOutlet weak var sadd: UIButton!
    @IBOutlet weak var fear1: UIButton!
    @IBOutlet weak var fear2: UIButton!
    @IBOutlet weak var fear3: UIButton!
    @IBOutlet weak var feard: UIButton!
    @IBOutlet weak var neutral: UIButton!
    @IBOutlet weak var neutrald: UIButton!
    @IBOutlet weak var play1: UIButton!
    @IBOutlet weak var play2: UIButton!
    @IBOutlet weak var play3: UIButton!
    @IBOutlet weak var playd: UIButton!
    @IBOutlet weak var relax1: UIButton!
    @IBOutlet weak var relax2: UIButton!
    @IBOutlet weak var relaxd: UIButton!
    @IBOutlet weak var happy1: UIButton!
    @IBOutlet weak var happy2: UIButton!
    @IBOutlet weak var happy3: UIButton!
    @IBOutlet weak var happyd: UIButton!
    @IBOutlet weak var anxious1: UIButton!
    @IBOutlet weak var anxious2: UIButton!
    @IBOutlet weak var anxious3: UIButton!
    @IBOutlet weak var anxiousd: UIButton!
    @IBOutlet weak var productivityslider: UISlider!
    @IBOutlet weak var energyslider: CustomUISlider!
    
    var checkin_loc:String = ""
    var angryd_click = false
    var angryscale = 0
    var angry1loc: CGPoint!
    var angry2loc: CGPoint!
    var angry3loc: CGPoint!
    var sadd_click = false
    var sadscale = 0
    var sad1loc: CGPoint!
    var sad2loc: CGPoint!
    var sad3loc: CGPoint!
    var anxiousd_click = false
    var anxiousscale = 0
    var anxious1loc: CGPoint!
    var anxious2loc: CGPoint!
    var anxious3loc: CGPoint!
    var feard_click = false
    var fearscale = 0
    var fear1loc: CGPoint!
    var fear2loc: CGPoint!
    var fear3loc: CGPoint!
    var neutrald_click = false
    var neutralscale = 0
    var neutralloc: CGPoint!
    var playd_click = false
    var playscale = 0
    var play1loc: CGPoint!
    var play2loc: CGPoint!
    var play3loc: CGPoint!
    var relaxd_click = false
    var relaxscale = 0
    var relax1loc: CGPoint!
    var relax2loc: CGPoint!
    var happyd_click = false
    var happyscale = 0
    var happy1loc: CGPoint!
    var happy2loc: CGPoint!
    var happy3loc: CGPoint!
    var producticityscale = 0
    var energyscale = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        producticityscale = 0
        energyscale = 0
        
        angry1loc = angry1.center
        angry2loc = angry2.center
        angry3loc = angry3.center
        angry1.center = angryd.center
        angry2.center = angryd.center
        angry3.center = angryd.center
        angryd_click = false
        angryscale = 0
        
        
        sad1loc = sad1.center
        sad2loc = sad2.center
        sad3loc = sad3.center
        sad1.center = sadd.center
        sad2.center = sadd.center
        sad3.center = sadd.center
        sadd_click = false
        sadscale = 0
        
        anxious1loc = anxious1.center
        anxious2loc = anxious2.center
        anxious3loc = anxious3.center
        anxious1.center = anxiousd.center
        anxious2.center = anxiousd.center
        anxious3.center = anxiousd.center
        anxiousd_click = false
        anxiousscale = 0
        
        fear1loc = fear1.center
        fear2loc = fear2.center
        fear3loc = fear3.center
        fear1.center = feard.center
        fear2.center = feard.center
        fear3.center = feard.center
        feard_click = false
        fearscale = 0
        
        neutralloc = neutral.center
        neutral.center = neutrald.center
        neutrald_click = false
        neutralscale = 0
        
        play1loc = play1.center
        play2loc = play2.center
        play3loc = play3.center
        play1.center = playd.center
        play2.center = playd.center
        play3.center = playd.center
        playd_click = false
        playscale = 0
        
        relax1loc = relax1.center
        relax2loc = relax2.center
        relax1.center = relaxd.center
        relax2.center = relaxd.center
        relaxd_click = false
        relaxscale = 0
        
        happy1loc = happy1.center
        happy2loc = happy2.center
        happy3loc = happy3.center
        happy1.center = happyd.center
        happy2.center = happyd.center
        happy3.center = happyd.center
        happyd_click = false
        happyscale = 0
        
        self.checkinlabel.text = "\(spaceName)"
        checkin_loc = spaceName
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }

//Calls this function when the tap is recognized.
func dismissKeyboard() {
    view.endEditing(true)
}

    @IBAction func angry1clicked(_ sender: UIButton) {
        angryd.setImage(#imageLiteral(resourceName: "angry1"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.angry1.center = self.angryd.center
            self.angry2.center = self.angryd.center
            self.angry3.center = self.angryd.center
        })
        angryd_click = !angryd_click
        angryscale = 1
    }
    @IBAction func angry2clicked(_ sender: UIButton) {
        angryd.setImage(#imageLiteral(resourceName: "angry2"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.angry1.center = self.angryd.center
            self.angry2.center = self.angryd.center
            self.angry3.center = self.angryd.center
        })
        angryd_click = !angryd_click
        angryscale = 2
    }
    @IBAction func angry3clicked(_ sender: UIButton) {
        angryd.setImage(#imageLiteral(resourceName: "angry3"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.angry1.center = self.angryd.center
            self.angry2.center = self.angryd.center
            self.angry3.center = self.angryd.center
        })
        angryd_click = !angryd_click
        angryscale = 3
    }
    @IBAction func angrydclicked(_ sender: UIButton) {
        if !angryd_click {
            // expand
            UIView.animate(withDuration: 0.3, animations: {
                self.angry1.center = self.angry1loc
                self.angry2.center = self.angry2loc
                self.angry3.center = self.angry3loc
            })
            angryd_click = !angryd_click
        } else {
            // collapse
            UIView.animate(withDuration: 0.3, animations: {
                self.angry1.center = self.angryd.center
                self.angry2.center = self.angryd.center
                self.angry3.center = self.angryd.center
            })
            angryd_click = !angryd_click
        }
    }
    
    
    @IBAction func sad1clicked(_ sender: UIButton) {
        sadd.setImage(#imageLiteral(resourceName: "sad1"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.sad1.center = self.sadd.center
            self.sad2.center = self.sadd.center
            self.sad3.center = self.sadd.center
        })
        sadd_click = !sadd_click
        sadscale = 1
    }
    @IBAction func sad2clicked(_ sender: UIButton) {
        sadd.setImage(#imageLiteral(resourceName: "sad2"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.sad1.center = self.sadd.center
            self.sad2.center = self.sadd.center
            self.sad3.center = self.sadd.center
        })
        sadd_click = !sadd_click
        sadscale = 2
    }
    @IBAction func sad3clicked(_ sender: UIButton) {
        sadd.setImage(#imageLiteral(resourceName: "sad3"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.sad1.center = self.sadd.center
            self.sad2.center = self.sadd.center
            self.sad3.center = self.sadd.center
        })
        sadd_click = !sadd_click
        angryscale = 3
    }
    @IBAction func saddclicked(_ sender: UIButton) {
        if !sadd_click {
            // expand
            UIView.animate(withDuration: 0.3, animations: {
                self.sad1.center = self.sad1loc
                self.sad2.center = self.sad2loc
                self.sad3.center = self.sad3loc
            })
            sadd_click = !sadd_click
        } else {
            // collapse
            UIView.animate(withDuration: 0.3, animations: {
                self.sad1.center = self.sadd.center
                self.sad2.center = self.sadd.center
                self.sad3.center = self.sadd.center
            })
            sadd_click = !sadd_click
        }
    }
    
    @IBAction func anxious1clicked(_ sender: UIButton) {
        anxiousd.setImage(#imageLiteral(resourceName: "anxious1"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.anxious1.center = self.anxiousd.center
            self.anxious2.center = self.anxiousd.center
            self.anxious3.center = self.anxiousd.center
        })
        anxiousd_click = !anxiousd_click
        anxiousscale = 1
    }
    
    @IBAction func anxious2clicked(_ sender: UIButton) {
        anxiousd.setImage(#imageLiteral(resourceName: "anxious2"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.anxious1.center = self.anxiousd.center
            self.anxious2.center = self.anxiousd.center
            self.anxious3.center = self.anxiousd.center
        })
        anxiousd_click = !anxiousd_click
        anxiousscale = 2
    }
    
    @IBAction func anxious3clicked(_ sender: UIButton) {
        anxiousd.setImage(#imageLiteral(resourceName: "anxious3"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.anxious1.center = self.anxiousd.center
            self.anxious2.center = self.anxiousd.center
            self.anxious3.center = self.anxiousd.center
        })
        anxiousd_click = !anxiousd_click
        anxiousscale = 3
    }
    
    @IBAction func anxiousdclicked(_ sender: UIButton) {
        if !anxiousd_click {
            // expand
            UIView.animate(withDuration: 0.3, animations: {
                self.anxious1.center = self.anxious1loc
                self.anxious2.center = self.anxious2loc
                self.anxious3.center = self.anxious3loc
            })
            anxiousd_click = !anxiousd_click
        } else {
            // collapse
            UIView.animate(withDuration: 0.3, animations: {
                self.anxious1.center = self.anxiousd.center
                self.anxious2.center = self.anxiousd.center
                self.anxious3.center = self.anxiousd.center
            })
            anxiousd_click = !anxiousd_click
        }
    }
    
    @IBAction func fear1clicked(_ sender: UIButton) {
        
        feard.setImage(#imageLiteral(resourceName: "fear1"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.fear1.center = self.feard.center
            self.fear2.center = self.feard.center
            self.fear3.center = self.feard.center
        })
        feard_click = !feard_click
        fearscale = 1
    }
    
    @IBAction func fea2clicked(_ sender: UIButton) {
        feard.setImage(#imageLiteral(resourceName: "fear2"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.fear1.center = self.feard.center
            self.fear2.center = self.feard.center
            self.fear3.center = self.feard.center
        })
        feard_click = !feard_click
        fearscale = 2
        
    }
    
    @IBAction func fear3clicked(_ sender: UIButton) {
        feard.setImage(#imageLiteral(resourceName: "fear3"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.fear1.center = self.feard.center
            self.fear2.center = self.feard.center
            self.fear3.center = self.feard.center
        })
        feard_click = !feard_click
        fearscale = 3
    }
    
    @IBAction func feardclicked(_ sender: UIButton) {
        if !feard_click {
            // expand
            UIView.animate(withDuration: 0.3, animations: {
                self.fear1.center = self.fear1loc
                self.fear2.center = self.fear2loc
                self.fear3.center = self.fear3loc
            })
            feard_click = !feard_click
        } else {
            // collapse
            UIView.animate(withDuration: 0.3, animations: {
                self.fear1.center = self.feard.center
                self.fear2.center = self.feard.center
                self.fear3.center = self.feard.center
            })
            feard_click = !feard_click
        }
    }
    
    @IBAction func neutralclicked(_ sender: UIButton) {
        neutrald.setImage(#imageLiteral(resourceName: "neutral"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.neutral.center = self.neutrald.center
        })
        neutrald_click = !neutrald_click
        neutralscale = 1
    }
    @IBAction func neutraldclicked(_ sender: UIButton) {
        if !neutrald_click {
            // expand
            UIView.animate(withDuration: 0.3, animations: {
                self.neutral.center = self.neutralloc
            })
            neutrald_click = !neutrald_click
        } else {
            // collapse
            UIView.animate(withDuration: 0.3, animations: {
                self.neutral.center = self.neutrald.center
            })
            neutrald_click = !neutrald_click
        }
    }
    @IBAction func play1clicked(_ sender: UIButton) {
        playd.setImage(#imageLiteral(resourceName: "play1"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.play1.center = self.playd.center
            self.play2.center = self.playd.center
            self.play3.center = self.playd.center
        })
        playd_click = !playd_click
        playscale = 1
    }
    @IBAction func play2clicked(_ sender: UIButton) {
        playd.setImage(#imageLiteral(resourceName: "play2"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.play1.center = self.playd.center
            self.play2.center = self.playd.center
            self.play3.center = self.playd.center
        })
        playd_click = !playd_click
        playscale = 2
    }
    @IBAction func play3clicked(_ sender: UIButton) {
        playd.setImage(#imageLiteral(resourceName: "play3"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.play1.center = self.playd.center
            self.play2.center = self.playd.center
            self.play3.center = self.playd.center
        })
        playd_click = !playd_click
        playscale = 3
    }
    @IBAction func playdclicked(_ sender: UIButton) {
        if !playd_click {
            // expand
            UIView.animate(withDuration: 0.3, animations: {
                self.play1.center = self.play1loc
                self.play2.center = self.play2loc
                self.play3.center = self.play3loc
            })
            playd_click = !playd_click
        } else {
            // collapse
            UIView.animate(withDuration: 0.3, animations: {
                self.play1.center = self.playd.center
                self.play2.center = self.playd.center
                self.play3.center = self.playd.center
            })
            playd_click = !playd_click
        }
    }
    
    @IBAction func relax1clicked(_ sender: UIButton) {
        relaxd.setImage(#imageLiteral(resourceName: "relax1"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.relax1.center = self.relaxd.center
            self.relax2.center = self.relaxd.center
        })
        relaxd_click = !relaxd_click
        relaxscale = 1
    }
    @IBAction func relax2clicked(_ sender: UIButton) {
        relaxd.setImage(#imageLiteral(resourceName: "relax2"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.relax1.center = self.relaxd.center
            self.relax2.center = self.relaxd.center
        })
        relaxd_click = !relaxd_click
        relaxscale = 2
    }
    @IBAction func relaxdclicked(_ sender: UIButton) {
        if !relaxd_click {
            // expand
            UIView.animate(withDuration: 0.3, animations: {
                self.relax1.center = self.relax1loc
                self.relax2.center = self.relax2loc
            })
            relaxd_click = !relaxd_click
        } else {
            // collapse
            UIView.animate(withDuration: 0.3, animations: {
                self.relax1.center = self.relaxd.center
                self.relax2.center = self.relaxd.center
            })
            relaxd_click = !relaxd_click
        }
    }
    
    @IBAction func happy1clicked(_ sender: UIButton) {
        happyd.setImage(#imageLiteral(resourceName: "happy1"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.happy1.center = self.happyd.center
            self.happy2.center = self.happyd.center
            self.happy3.center = self.happyd.center
        })
        happyd_click = !happyd_click
        happyscale = 1
    }
    
    @IBAction func happy2clicked(_ sender: UIButton) {
        happyd.setImage(#imageLiteral(resourceName: "happy2"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.happy1.center = self.happyd.center
            self.happy2.center = self.happyd.center
            self.happy3.center = self.happyd.center
        })
        happyd_click = !happyd_click
        happyscale = 2
    }
    @IBAction func happy3clicked(_ sender: UIButton) {
        
        happyd.setImage(#imageLiteral(resourceName: "happy3"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            self.happy1.center = self.happyd.center
            self.happy2.center = self.happyd.center
            self.happy3.center = self.happyd.center
        })
        happyd_click = !happyd_click
        happyscale = 3
    }
    @IBAction func happydclicked(_ sender: UIButton) {
        if !happyd_click {
            // expand
            UIView.animate(withDuration: 0.3, animations: {
                self.happy1.center = self.happy1loc
                self.happy2.center = self.happy2loc
                self.happy3.center = self.happy3loc
            })
            happyd_click = !happyd_click
        } else {
            // collapse
            UIView.animate(withDuration: 0.3, animations: {
                self.happy1.center = self.happyd.center
                self.happy2.center = self.happyd.center
                self.happy3.center = self.happyd.center
            })
            happyd_click = !happyd_click
        }
    }
    
    @IBAction func slideproductivity(_ sender: UISlider) {
        productivityslider.value = roundf(productivityslider.value)
        producticityscale = Int(roundf(productivityslider.value))
    }
    @IBAction func slideenergy(_ sender: CustomUISlider) {
        energyslider.value = roundf(energyslider.value)
        energyscale = Int(roundf(energyslider.value))
    }
    
    @IBAction func submitclicked(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Checkindata", in: context)
        let newData = NSManagedObject(entity: entity!, insertInto: context)
        newData.setValue(angryscale, forKey: "angry")
        newData.setValue(sadscale, forKey: "sad")
        newData.setValue(fearscale, forKey: "fear")
        newData.setValue(anxiousscale, forKey: "anxious")
        newData.setValue(neutralscale, forKey: "neutral")
        newData.setValue(playscale, forKey: "play")
        newData.setValue(relaxscale, forKey: "relax")
        newData.setValue(happyscale, forKey: "happy")
        newData.setValue(producticityscale, forKey: "productivity")
        newData.setValue(energyscale, forKey: "energy")
        newData.setValue(comments.text, forKey: "comments")
        newData.setValue(Date(), forKey: "time")
        newData.setValue(checkin_loc, forKey: "place")
        newData.setValue(globalUsername, forKey: "username")
        print(newData)
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
        
        let alert = UIAlertController(title: "Thanks for checking in!", message:
            "+15 points", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: { (action) in
            alert.dismiss(animated:true, completion:nil)
            self.angryd.setImage(#imageLiteral(resourceName: "angryd"), for: .normal)
            self.angryscale = 0
            self.sadd.setImage(#imageLiteral(resourceName: "sadd"), for: .normal)
            self.sadscale = 0
            self.feard.setImage(#imageLiteral(resourceName: "feard"), for: .normal)
            self.fearscale = 0
            self.anxiousd.setImage(#imageLiteral(resourceName: "anxiousd"), for: .normal)
            self.anxiousscale = 0
            self.neutrald.setImage(#imageLiteral(resourceName: "neutrald"), for: .normal)
            self.neutralscale = 0
            self.playd.setImage(#imageLiteral(resourceName: "playd"), for: .normal)
            self.playscale = 0
            self.relaxd.setImage(#imageLiteral(resourceName: "relaxd"), for: .normal)
            self.relaxscale = 0
            self.happyd.setImage(#imageLiteral(resourceName: "happyd"), for: .normal)
            self.happyscale = 0
            self.energyslider.value = 0
            self.productivityslider.value = 0
            self.comments.text = ""
        }))
        
        self.present(alert, animated: true, completion: nil)
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
