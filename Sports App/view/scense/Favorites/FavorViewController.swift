//
//  FavorViewController.swift
//  Sports App
//
//  Created by AhmedNadyRabea on 01/04/2021.
//

import UIKit
import SDWebImage
import Alamofire
import Reachability
class FavorViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var favorTV: UITableView!
    var coreDataLayer = [MyLeague]()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        favorTV.delegate = self
        favorTV.dataSource = self
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataLayer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "FavorTableViewCell", for: indexPath) as? FavorTableViewCell
        if Connectivity.isConnectedToInternet() {
                print("Yes! internet is available.")
                // do some tasks..
            cell?.favorLabel.text = coreDataLayer[indexPath.row].strLeague
            let imageName = self.coreDataLayer[indexPath.row].strBadge
            cell?.youtubeLink = self.coreDataLayer[indexPath.row].strYouTube
            cell?.favorImage.sd_setImage(with: URL(string: imageName ?? ""), completed: nil)
        } else {
            let alert = UIAlertController(title: "Alert", message: "there are no internet", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        cell?.favorLabel.text = coreDataLayer[indexPath.row].strLeague
        let imageName = self.coreDataLayer[indexPath.row].strBadge
        cell?.youtubeLink = self.coreDataLayer[indexPath.row].strYouTube
        cell?.favorImage.sd_setImage(with: URL(string: imageName ?? ""), completed: nil)
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if Connectivity.isConnectedToInternet() {
            let leagueVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LeagueViewController") as? LeagueViewController
            leagueVC?.myFavorLeague!.idLeague = coreDataLayer[indexPath.row].idLeague
            leagueVC?.myFavorLeague!.strLeague = coreDataLayer[indexPath.row].strLeague
            leagueVC?.myFavorLeague!.strBadge = coreDataLayer[indexPath.row].strBadge
            leagueVC?.myFavorLeague!.strYouTube = coreDataLayer[indexPath.row].strYouTube

            self.present(leagueVC!, animated: true, completion: nil)
          //  self.navigationController?.pushViewController(leagueVC!, animated: true)
        } else{}
        
    }
    override func viewWillAppear(_ animated: Bool) {
        coreDataLayer = CoreDataService.shared.fetchLeagues()
        favorTV.reloadData()
    }
}
class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
