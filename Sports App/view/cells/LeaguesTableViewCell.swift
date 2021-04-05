//
//  LeaguesTableViewCell.swift
//  Sports App
//
//  Created by AhmedNadyRabea on 27/03/2021.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    @IBOutlet weak var leaguesIV: UIImageView!
    @IBOutlet weak var leagueslabel: UILabel!
    var youtubeLink:String!
    override func awakeFromNib() {
        super.awakeFromNib()
        leaguesIV.layer.borderWidth = 1
        leaguesIV.layer.masksToBounds = false
        leaguesIV.layer.borderColor = UIColor.black.cgColor
        leaguesIV.layer.cornerRadius = leaguesIV.frame.height/2
        leaguesIV.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func youtubeBTN(_ sender: UIButton) {
        let currentView: UIViewController = self.window!.rootViewController!
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if  let registerViewController = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController {
            registerViewController.webUrl = self.youtubeLink
            let nanController = UINavigationController(rootViewController: registerViewController)
            currentView.present(nanController, animated: true, completion: nil)
            //self.present(registerViewController, animated: true)
            
        }
    }
}
//https://www.youtube.com/channel/UCLCH_ISdcQXKa4TqU1HZiAA
