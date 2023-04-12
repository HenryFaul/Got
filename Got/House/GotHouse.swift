//
//  GotHouse.swift
//  Got
//
//  Created by Henry Faul on 2023/04/10.
//

import Foundation
import SwiftUI



struct APIResult: Codable {
    
    var data: APIHouseData
}

struct APIHouseData: Codable {
    var results: [GotHouse]
}

struct GotHouse:  Identifiable, Codable {
   
    let id = UUID()
    
    let url: String?
    let name: String?
    let region: String?
    let coatOfArms: String?
    let words: String?
    let titles: [String]?
    let seats: [String]?
    let currentLord: String?
    let heir: String?
    let overlord: String?
    let founded: String?
    let founder: String?
    let diedOut: String?
    let ancestralWeapons: [String]?
    let cadetBranches: [String]?
    let swornMembers: [String]?
    
}
