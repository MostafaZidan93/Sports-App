//
//  FavorTableViewCell.swift
//  Sports App
//
//  Created by AhmedNadyRabea on 01/04/2021.
//

import UIKit

class FavorTableViewCell: UITableViewCell {
    @IBOutlet weak var favorImage: UIImageView!
    var youtubeLink:String!
    @IBOutlet weak var favorLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        favorImage.layer.borderWidth = 1
        favorImage.layer.masksToBounds = false
        favorImage.layer.borderColor = UIColor.black.cgColor
        favorImage.layer.cornerRadius = favorImage.frame.height/2
        favorImage.clipsToBounds = true
        // Configure the view for the selected state
    }

    @IBAction func favorBtn(_ sender: UIButton) {
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
