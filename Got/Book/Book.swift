//
//  Book.swift
//  Got
//
//  Created by Henry Faul on 2023/04/11.
//

import Foundation

struct GotBook:  Identifiable, Codable {
   
    let id = UUID()
    
    let url: String?
    let name: String?
    let isbn: String?
    let authors: [String]?
    let numberOfPages: Int?
    let publiser: String?
    let country: String?
    let released: String?
    let mediaType: String?
    let characters: [String]?
    let povCharacters: [String]?
    
    
}


