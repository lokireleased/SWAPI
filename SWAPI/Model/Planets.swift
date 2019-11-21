//
//  Planets.swift
//  SWAPI
//
//  Created by tyson ericksen on 11/21/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import Foundation

struct TopLevelDictionary: Codable {
    let results: [Planets]
    
//    struct Results: Codable {
//        let planetDictionary: Planets
//    }
//   
}


struct Planets: Codable {
    let name: String
    let climate: String
    let population: String
    let orbital_period: String
    let rotation_period: String
}
