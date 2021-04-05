//
//  GetDataModel.swift
//  Sports App
//
//  Created by AhmedNadyRabea on 25/03/2021.
//


import Foundation
import Alamofire

class ApiModal {
    static let instance = ApiModal()
    func getData<T :Decodable>(url: String, completion: @escaping (T?,Error?)->Void) {
        AF.request(url).responseJSON { (response) in
            guard let data = response.data else{ return }
            switch response.result{
            case .success(_):
                    do {
                        let myData = try JSONDecoder().decode(T.self, from: data)
                        completion(myData, nil)
                    } catch let jsonError {
                        print(jsonError)
                    }
            case .failure(let error):
                completion(nil,error)
            }
        }
    }
}
