////
////  GetLeagues.swift
////  Sports App
////
////  Created by AhmedNadyRabea on 27/03/2021.
////
//

import Foundation
import Alamofire

class GetDataById{

    func Get_Alamofire_Codable_Model_Id(urlId:String, completion: @escaping ([Leagues]?, Error?) -> ()){

        let url = "https://www.thesportsdb.com/api/v1/json/1/lookupleague.php?id=\(urlId)"

        AF.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { (response) in

            switch response.result{

            case .success(_):

                do{

                    guard let data = response.data else {return}

                    let result = try JSONDecoder().decode(DetailsByIdModel.self, from: data)

                    completion(result.leagues, nil)

                }catch{
                    completion(nil, error)
                }

            case .failure(_):
                completion(nil, response.error)
            }

        }

    }
}
