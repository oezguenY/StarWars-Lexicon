//
//  Person.swift
//  Starwars Lexicon
//
//  Created by Özgün Yildiz on 22.04.21.
//

import Foundation

struct Person: Codable {
    let name: String
    let gender: String
    let birthYear: String
    let mass: String
    let height: String
    let hair: String
    let homeWorld: String
    let films: [String]
    let vehicles: [String]
    let starships: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case birthYear = "birth_year"
        case mass
        case height
        case hair = "hair_color"
        case homeWorld = "homeworld"
        case films
        case vehicles
        case starships
    }
}
