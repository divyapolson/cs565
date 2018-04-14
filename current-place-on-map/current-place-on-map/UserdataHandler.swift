//
//  UserdataHandler.swift
//  current-place-on-map
//
//  Created by Sushan Jiang on 4/14/18.
//  Copyright © 2018 William French. All rights reserved.
//

import UIKit
import CoreData

class UserdataHandler: NSObject {
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    class func saveObject(username:String, password:String) -> Bool {
        let user = fetchObject()
        for i in user! {
            if (i.username == username) {
                return false
            }
        }
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Account", in: context)
        let newData = NSManagedObject(entity: entity!, insertInto: context)
        newData.setValue(username, forKey: "username")
        newData.setValue(password, forKey: "password")
        print(newData)
        do {
            try context.save()
            return true
        } catch {
            print("Failed saving")
            return false
        }
    }
    
    class func fetchObject() -> [Account]? {
        let context = getContext()
        var account:[Account]? = nil
        do {
            account = try context.fetch(Account.fetchRequest())
            return account
        } catch {
            return account
        }
    }
}
