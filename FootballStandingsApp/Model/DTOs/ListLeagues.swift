//
//  ListLeagues.swift
//  FootballStandingsApp
//
//  Created by Nurlan Seitov on 27/7/23.
//

import Foundation

// MARK: - ListLeagues
struct ListLeagues: Codable {
    let status: Bool
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let id, name, slug, abbr: String
    let logos: Logos
}

// MARK: - Logos
struct Logos: Codable {
    let light: String
    let dark: String
}
