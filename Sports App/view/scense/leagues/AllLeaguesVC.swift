//
//  AllLeaguesVC.swift
//  Sports App
//
//  Created by AhmedNadyRabea on 27/03/2021.
//

import UIKit
import SDWebImage
class AllLeaguesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let dispatchGroup = DispatchGroup()
    var titlee: String = ""
    var urls: [String] = []
    var titleLeague: [String] = []
    var imgLeague: [String] = []
    var iconUrl: [String] = []
    var myLeaguesData = [League]()
    
  //  var title = String()
   // var titlee: String
    @IBOutlet weak var leaguesTV: UITableView!
    var getLeagues = GetLeagues()
    var getDataById = GetDataById()
    var myLeaguesDataa = [Leagues]()
    
    var getModel = [League]()
    var finalArray = [Leagues]()
    
    
    override func viewDidLoad() {
        print("loaaaaaaaaaad")
        super.viewDidLoad()
        leaguesTV.delegate = self
        leaguesTV.dataSource = self
       
        // show loading here
        getLeagues.Get_Alamofire_Codable_Model{ [weak self] (titles, error) in
            guard let self = self else {return}
            if error != nil{
                return
            }
            guard let todos = titles else {return}
            self.myLeaguesData = todos
            self.dataaaaa()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myLeaguesDataa.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as? LeaguesTableViewCell {
            
            cell.leagueslabel.text = self.myLeaguesDataa[indexPath.row].strLeague
            cell.youtubeLink = self.myLeaguesDataa[indexPath.row].strYoutube

            let imageName = self.myLeaguesDataa[indexPath.row].strBadge
            print(myLeaguesDataa.count)

            cell.leaguesIV.sd_setImage(with: URL(string: imageName ?? ""), completed: nil)
            
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leagueVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LeagueViewController") as? LeagueViewController
        leagueVC?.myFavorLeague!.idLeague = myLeaguesDataa[indexPath.row].idLeague
        leagueVC?.myFavorLeague!.strLeague = myLeaguesDataa[indexPath.row].strLeague
        leagueVC?.myFavorLeague!.strBadge = myLeaguesDataa[indexPath.row].strBadge
        leagueVC?.myFavorLeague!.strYouTube = myLeaguesDataa[indexPath.row].strYoutube


        self.navigationController?.pushViewController(leagueVC!, animated: true)
        
    }

    func dataaaaa(){
        for item in 0..<self.myLeaguesData.count {
            if self.titlee == self.myLeaguesData[item].strSport.rawValue {
                self.getModel.append(self.myLeaguesData[item])
            } else {
                 print("error")
            }
        }
        
        for item in 0..<self.getModel.count {
            self.urls.append("\(self.getModel[item].idLeague)")
        }
        
        for item in 0..<self.urls.count{
            dispatchGroup.enter()
            self.getDataById.Get_Alamofire_Codable_Model_Id(urlId: self.urls[item]) {[weak self] (titles, error) in
                guard let self = self else {return}
                self.dispatchGroup.leave()
                if error != nil{
                    return
                }
                
                guard let todos = titles else {return}
                self.myLeaguesDataa.append(contentsOf: todos)
            }
        }
        dispatchGroup.notify(queue: .main){
            // hide loading here
            self.leaguesTV.reloadData()
        }

    }
}
