//
//  GetToDoModel.swift
//  MVP
//
//  Created by AhmedNadyRabea on 23/03/2021.
//

//import Foundation
import Foundation

// MARK: - GetToDoElement
struct GetToDo: Codable {
    let firstName, lastName: String
        let age: Int

        enum CodingKeys: String, CodingKey {
            case firstName = "first_name"
            case lastName = "last_name"
            case age
        }

}
