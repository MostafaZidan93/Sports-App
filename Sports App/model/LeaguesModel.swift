//
//  LeaguesModel.swift
//  Sports App
//
//  Created by AhmedNadyRabea on 27/03/2021.
//

import Foundation

// MARK: - Welcome
struct LeaguesModel: Codable {
    let leagues: [League]
    
}

// MARK: - League
struct League: Codable {
    let idLeague, strLeague: String
    let strSport: StrSport
    let strLeagueAlternate: String?
    
   
}

enum StrSport: String, Codable {
    case americanFootball = "American Football"
    case australianFootball = "Australian Football"
    case baseball = "Baseball"
    case basketball = "Basketball"
    case cricket = "Cricket"
    case cycling = "Cycling"
    case darts = "Darts"
    case eSports = "ESports"
    case esports = "Esports"
    case fieldHockey = "Field Hockey"
    case fighting = "Fighting"
    case golf = "Golf"
    case handball = "Handball"
    case iceHockey = "Ice Hockey"
    case motorsport = "Motorsport"
    case motorsports = "Motorsports"
    case netball = "Netball"
    case rugby = "Rugby"
    case snooker = "Snooker"
    case soccer = "Soccer"
    case tennis = "Tennis"
    case volleyball = "Volleyball"
    
    
}

