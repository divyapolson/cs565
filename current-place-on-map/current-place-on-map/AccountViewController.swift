//
//  AccountViewController.swift
//  current-place-on-map
//
//  Created by Sushan Jiang on 4/18/18.
//  Copyright © 2018 William French. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var historytable: UITableView!
    @IBOutlet weak var points: UILabel!
    var placearr = [String]()
    var commentarr = [String]()
    var prodarr = [Int]()
    var energyarr = [Int]()
    var angryarr = [Int]()
    var sadarr = [Int]()
    var anxiousarr = [Int]()
    var feararr = [Int]()
    var happyarr = [Int]()
    var neutralarr = [Int]()
    var playarr = [Int]()
    var relaxarr = [Int]()
    var checkinarr = [Checkindata]()
    var timearr = [NSDate]()
    var isLoadingViewController = false
    override func viewDidLoad() {
        super.viewDidLoad()
        isLoadingViewController = true
        viewLoadSetup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isLoadingViewController {
            isLoadingViewController = false
        } else {
            viewLoadSetup()
            historytable.reloadData()
        }
        
    }
    
    func viewLoadSetup() {
        
        historytable.dataSource = self
        
        checkinarr = [Checkindata]()
        placearr = [String]()
        commentarr = [String]()
        prodarr = [Int]()
        energyarr = [Int]()
        timearr = [NSDate]()
        angryarr = [Int]()
        sadarr = [Int]()
        anxiousarr = [Int]()
        feararr = [Int]()
        happyarr = [Int]()
        neutralarr = [Int]()
        playarr = [Int]()
        relaxarr = [Int]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        var checkindata:[Checkindata]? = nil
        do {
            checkindata = try context.fetch(Checkindata.fetchRequest())
        } catch {
            print("error fetching data")
        }
        for item in checkindata! {
            if (item.username == globalUsername) {
                placearr.insert(item.place!, at:0)
                commentarr.insert(item.comments!, at:0)
                energyarr.insert(Int(item.energy), at: 0)
                prodarr.insert(Int(item.productivity),at:0)
                timearr.insert(item.time!, at:0)
                angryarr.insert(Int(item.angry),at:0)
                sadarr.insert(Int(item.sad),at:0)
                anxiousarr.insert(Int(item.anxious),at:0)
                feararr.insert(Int(item.fear),at:0)
                happyarr.insert(Int(item.happy),at:0)
                neutralarr.insert(Int(item.neutral),at:0)
                playarr.insert(Int(item.play),at:0)
                relaxarr.insert(Int(item.relax),at:0)
                checkinarr.insert(item, at:0)
            }
        }
        let usernow = UserdataHandler.fetchOneObject(username:globalUsername)
        points.text = String(usernow!.point)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placearr.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historytable.dequeueReusableCell(withIdentifier: "cell") as! LogTableViewCell
        cell.placelabel?.text = placearr[indexPath.row]
        cell.commentlabel?.text = commentarr[indexPath.row]
        cell.energylabel?.text = String(energyarr[indexPath.row])+"/5"
        cell.productivitylabel?.text = String(prodarr[indexPath.row])+"/5"
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        cell.timelabel?.text = formatter.string(from: timearr[indexPath.row] as Date)
        var emojicontent = ""
        if ( angryarr[indexPath.row] == 1 ) {
            emojicontent = emojicontent + " 😠"
        } else if ( angryarr[indexPath.row] == 2 ) {
            emojicontent = emojicontent + " 😤"
        } else if ( angryarr[indexPath.row] == 3 ) {
            emojicontent = emojicontent + " 😡"
        }
        if ( sadarr[indexPath.row] == 1 ) {
            emojicontent = emojicontent + " 😔"
        } else if ( sadarr[indexPath.row] == 2 ) {
            emojicontent = emojicontent + " 😢"
        } else if ( sadarr[indexPath.row] == 3 ) {
            emojicontent = emojicontent + " 😭"
        }
        if ( anxiousarr[indexPath.row] == 1 ) {
            emojicontent = emojicontent + " 😓"
        } else if ( anxiousarr[indexPath.row] == 2 ) {
            emojicontent = emojicontent + " 😣"
        } else if ( anxiousarr[indexPath.row] == 3 ) {
            emojicontent = emojicontent + " 😖"
        }
        if ( feararr[indexPath.row] == 1 ) {
            emojicontent = emojicontent + " 😳"
        } else if ( feararr[indexPath.row] == 2 ) {
            emojicontent = emojicontent + " 😨"
        } else if ( feararr[indexPath.row] == 3 ) {
            emojicontent = emojicontent + " 😱"
        }
        if ( neutralarr[indexPath.row] == 1 ) {
            emojicontent = emojicontent + " 😐"
        }
        if ( playarr[indexPath.row] == 1 ) {
            emojicontent = emojicontent + " 😛"
        } else if ( playarr[indexPath.row] == 2 ) {
            emojicontent = emojicontent + " 😜"
        } else if ( playarr[indexPath.row] == 3 ) {
            emojicontent = emojicontent + " 🤣"
        }
        if ( relaxarr[indexPath.row] == 1 ) {
            emojicontent = emojicontent + " 😌"
        } else if ( relaxarr[indexPath.row] == 2 ) {
            emojicontent = emojicontent + " ☺️"
        }
        if ( happyarr[indexPath.row] == 1 ) {
            emojicontent = emojicontent + " 🙂"
        } else if ( happyarr[indexPath.row] == 2 ) {
            emojicontent = emojicontent + " 😊"
        } else if ( happyarr[indexPath.row] == 3 ) {
            emojicontent = emojicontent + " 😀"
        }
        cell.emojilabel?.text = emojicontent
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let todeletedata = checkinarr[indexPath.row]
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            context.delete(todeletedata)
            do {
                try context.save()
            } catch {
                print("delete error")
            }
            placearr.remove(at: indexPath.row)
            commentarr.remove(at: indexPath.row)
            energyarr.remove(at: indexPath.row)
            prodarr.remove(at: indexPath.row)
            timearr.remove(at: indexPath.row)
            angryarr.remove(at: indexPath.row)
            sadarr.remove(at: indexPath.row)
            anxiousarr.remove(at: indexPath.row)
            feararr.remove(at: indexPath.row)
            happyarr.remove(at: indexPath.row)
            neutralarr.remove(at: indexPath.row)
            playarr.remove(at: indexPath.row)
            relaxarr.remove(at: indexPath.row)
            
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
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
