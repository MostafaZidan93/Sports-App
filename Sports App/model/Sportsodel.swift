//
//  SportsModel.swift
//  Sports App
//
//  Created by AhmedNadyRabea on 25/03/2021.
//

import Foundation
// MARK: - Welcome
struct Sportsodel: Codable {
    let sports: [port]
}

// MARK: - Sport
struct port: Codable {
    let idSport, strSport: String
    let strFormat: StrFormat
    let strSportThumb, strSportThumbGreen: String
    let strSportDescription: String
}

enum StrFormat: String, Codable {
    case eventSport = "EventSport"
    case teamvsTeam = "TeamvsTeam"
}
