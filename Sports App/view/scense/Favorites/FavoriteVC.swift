//
//  FavoriteVC.swift
//  Sports App
//
//  Created by AhmedNadyRabea on 29/03/2021.
//

import UIKit

class FavoriteVC: UIViewController {
    var coreDataService = [FavorLeague]()
    override func viewDidLoad() {
        super.viewDidLoad()
        coreDataService =   CoreDataService.shared.fetchLeagues()
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
}

