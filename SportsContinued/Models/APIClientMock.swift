//
//  APIClientMock.swift
//  SportsContinued
//
//  Created by Mostafa Zidan on 4/1/21.
//  Copyright © 2021 Mostafa Zidan. All rights reserved.
//

import Foundation


class APIClientMock: APIService {
    
    
    
    override func getTeam(urlLink: String, completion: @escaping ([String : [[String : Any]]]) -> ()) {
        if let offlineStubs = Bundle.main.url(forResource: "TeamJsonMock", withExtension: "json") {

            do {
                let data = try Data(contentsOf: offlineStubs, options:.mappedIfSafe)
                let offlineDataFromStubs = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    completion(offlineDataFromStubs as! [String : [[String : Any]]])
                }
            } catch let error {
                print("Error Loading Offline Data: \(error)")
            }
        }
    }
    
    
    
    override func getLeagueTeams(urlLink: String, completion: @escaping ([String : [[String : Any]]]) -> ()) {
        if let offlineStubs = Bundle.main.url(forResource: "LeagueTeamsMock", withExtension: "json") {

            do {
                let data = try Data(contentsOf: offlineStubs, options:.mappedIfSafe)
                let offlineDataFromStubs = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    completion(offlineDataFromStubs as! [String : [[String : Any]]])
                }
            } catch let error {
                print("Error Loading Offline Data: \(error)")
            }
        }
    }
}
