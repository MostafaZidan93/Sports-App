//
//  ViewController.swift
//  Sports App
//
//  Created by AhmedNadyRabea on 25/03/2021.
//

import UIKit
import Alamofire
import SDWebImage
import AlamofireImage

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    

    @IBOutlet weak var sportsCollectionView: UICollectionView!
   // var getDataModel = GetDataModel()
    var dispatchGroup = DispatchGroup()
    var sports = [Sports]()
    let sportsUrl = "https://www.thesportsdb.com/api/v1/json/1/all_sports.php"
    //var hud = Hud()
   // var myData = [GetDataModel][Sport]()
   
    
    override func viewDidLoad() {
        sportsCollectionView.delegate = self
        sportsCollectionView.dataSource = self
        
       // sportsCollectionView.reloadData()
        super.viewDidLoad()
        DispatchQueue.global(qos: .background).async {
                           ApiModal.instance.getData(url: self.sportsUrl, completion:{(mySports: SportsModel?,error) in
                               if let myError = error{
                                   print(myError)
                               }else{
                                   guard let sports = mySports else {return}
                                  // self.sportsData = sports
                                   guard let mySport = sports.sports  else { return }
                                   self.sports = mySport
                                   print("my sports")
                                   print(self.sports.count)
                                   DispatchQueue.main.async {
                                       self.sportsCollectionView.reloadData()
                                   }
                               }
                           })
        }

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportsCollectionViewCell", for: indexPath) as! SportsCollectionViewCell
        
            // ...
       
            let imageName = self.sports[indexPath.row].strSportThumb
            let name = self.sports[indexPath.row].strSport
            cell.sportsNameLabel.text = name
        AF.request(imageName!, method: .get).response { response in
                                guard let image = UIImage(data:response.data!) else {
                                    // Handle error
                                    return
                                }
                let imageData = image.jpegData(compressionQuality: 1.0)
                cell.SportsImageView.image = UIImage(data : imageData!)
                            }
            
       
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width * 0.49, height: collectionView.frame.size.height * 0.2)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let allLeaguesVC = storyboard?.instantiateViewController(identifier: "AllLeaguesVC") as? AllLeaguesVC {
            allLeaguesVC.titlee = self.sports[indexPath.row].strSport!
            
            navigationController?.pushViewController(allLeaguesVC, animated: true) }
    }
}

  
