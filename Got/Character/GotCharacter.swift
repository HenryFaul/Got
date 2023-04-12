//
//  GotCharacter.swift
//  Got
//
//  Created by Henry Faul on 2023/04/12.
//

import Foundation

struct GotCharacter:  Identifiable, Codable {
    
    
    let id = UUID()
    let url: String?
    let name: String?
    let gender: String?
    let culture: String?
    let born: String?
    let died: String?
    let titles: [String]?
    let aliases: [String]?
    let father: String?
    let mother: String?
    let spouse: String?
    let books: [String]?
    let allegiances: [String]?
    let povBooks: [String]?
    let tvSeries: [String]?
    let playedBy: [String]?
    
}
