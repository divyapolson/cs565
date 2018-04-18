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
    var timearr = [NSDate]()
    override func viewDidLoad() {
        super.viewDidLoad()
        historytable.dataSource = self
        
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
            }
        }
        points.text = String(15*placearr.count)
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
        return cell
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
