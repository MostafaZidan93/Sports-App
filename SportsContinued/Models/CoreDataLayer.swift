//
//  CoreDataLayer.swift
//  SportsContinued
//
//  Created by Mostafa Zidan on 4/1/21.
//  Copyright © 2021 Mostafa Zidan. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class CoreDataService {
    
    static let shared = CoreDataService()
    
    func addLeague(league: MyLeague) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "League", into: managedContext)
        
        entity.setValue(league.idLeague, forKey: "idLeague")
        entity.setValue(league.strBadge, forKey: "strBadge")
        entity.setValue(league.strLeague, forKey: "strLeague")
        entity.setValue(league.strYouTube, forKey: "strYouTube")
        
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    
    func fetchLeagues() -> [MyLeague]{
        var myLeaguesArray = [MyLeague]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "League")
        
        
        do {
            let leaguesFromCoreData = try managedContext.fetch(fetchRequest)
            if leaguesFromCoreData.count > 0 {
                for league in leaguesFromCoreData {
                    var tempLeague = MyLeague()
                    tempLeague.idLeague = league.value(forKey: "idLeague") as! String
                    tempLeague.strLeague = league.value(forKey: "strLeague") as! String
                    tempLeague.strBadge = league.value(forKey: "strBadge") as! String
                    tempLeague.strYouTube = league.value(forKey: "strYouTube") as! String
                    myLeaguesArray.append(tempLeague)
                }
            }
        } catch let error as NSError {
            print(error)
        }
        return myLeaguesArray
    }
}
