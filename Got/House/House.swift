//
//  House.swift
//  Got
//
//  Created by Henry Faul on 2023/04/04.
//

import Foundation
import SwiftUI

struct House:  Hashable, Codable {
    
    
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

struct Character:  Hashable, Codable {
    
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




class ViewModel: ObservableObject {
    
    @Published var houses: [House] = []
    
    func fetch(){
        
        guard let url = URL(string: "https://anapioficeandfire.com/api/houses/") else {return}
        
        
        URLSession.shared.dataTask(with: url) { [weak self]
            ( data, response, error) in
            
            if let error = error {
                print("error : \(error)")
            }
            
            guard let data = data else {
                print("no data found")
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                
                let result = try decoder.decode([House].self, from: data)
                
                DispatchQueue.main.async {
                    self?.houses = result
                }
                
            } catch let error {
                print("error: \(error)")
            }
            
            
        }.resume()
        
    }
}




class ViewModelCharacter: ObservableObject {
    
    
    
    @Published var character: Character? = nil
    
    func fetch(character_url: String){
        
        guard let url = URL(string: character_url) else {return}
        
        
        URLSession.shared.dataTask(with: url) { [weak self]
            ( data, response, error) in
            
            if let error = error {
                print("error : \(error)")
            }
            
            guard let data = data else {
                print("no data found")
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                
                let result = try decoder.decode(Character.self, from: data)
                
                DispatchQueue.main.async {
                    self?.character = result
                }
                
            } catch let error {
                print("error: \(error)")
            }
            
            
        }.resume()
        
    }
    
    func testFetch(character_url: String, _ completion: @escaping (_ success: Bool, _ data: Character?) -> Void) {
        
        
        guard let url = URL(string: character_url) else {return}
        
        
        URLSession.shared.dataTask(with: url) { [weak self]
            ( data, response, error) in
            
            if let error = error {
                print("error : \(error)")
                completion(false,nil)
            }
            
            guard let data = data else {
                print("no data found")
                completion(false,nil)
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                
                let result = try decoder.decode(Character.self, from: data)
                
                completion(true,result)
                
            } catch let error {
                print("error: \(error)")
                completion(false,nil)
            }
            
            
        }.resume()
        
    }
    
}




struct HouseList {
    
    static let testHouses = [
        
        House(url: "https://anapioficeandfire.com/api/houses/1", name: "House All Good", region: "The Westerlands", coatOfArms: nil, words: nil, titles: nil, seats: nil, currentLord: nil, heir: nil, overlord: nil, founded: nil, founder: nil, diedOut: nil, ancestralWeapons: nil, cadetBranches: nil, swornMembers: nil),
        
        House(url: "https://anapioficeandfire.com/api/houses/1", name: "House All Good", region: "The Westerlands", coatOfArms: nil, words: nil, titles: nil, seats: nil, currentLord: nil, heir: nil, overlord: nil, founded: nil, founder: nil, diedOut: nil, ancestralWeapons: nil, cadetBranches: nil, swornMembers: nil)
    ]
    
}
