//
//  HouseModel.swift
//  Got
//
//  Created by Henry Faul on 2023/04/10.
//

import SwiftUI
import Combine

class HouseModel:  ObservableObject {
    
    @Published var searchQuery = "";
    @Published var initialLoad = true;
    
    var searchCancellable: AnyCancellable? = nil
    
    @Published var fetchedHouses: [GotHouse]? = nil
    @Published var initialfetchedHouses: [GotHouse]? = nil
    
    init(){
        
        searchCancellable = $searchQuery
            .removeDuplicates()
            .debounce(for: 0.6, scheduler: RunLoop.main)
            .sink(receiveValue: {
                str in
                
                if str == "" {
                    //reset
                    
                    if(self.initialfetchedHouses != nil){
                        self.fetchedHouses = self.initialfetchedHouses
                    }else{
                        self.fetchedHouses = nil
                    }
                    
                }
                else {
                    self.searchHouse()
                }
            })
    }
    
    func searchHouse(){
        
        
        let originalQuery = searchQuery.replacingOccurrences(of: " ", with: "%20")
        
        let page = 1
        
        let url = "https://anapioficeandfire.com/api/houses?pageSize=1000&page=\(page)&name=\(originalQuery)"
        
        let session = URLSession(configuration: .default)
        
        DispatchQueue.main.async {
            self.initialLoad = true
        }
        
        session.dataTask(with: URL(string: url)!){
            (data, _, err) in
            
            if let error = err{
                print(error)
                return
            }
            
            guard let APIData = data else {
                print("No data found")
                return
            }
            
            do{
                
                let houses = try JSONDecoder().decode([GotHouse].self, from: APIData)
                
                DispatchQueue.main.async {
                    self.fetchedHouses = houses
                    self.initialLoad = false
                }
                
            } catch {
                print(error)
            }
            
            
        }.resume()
    }
    
    func testSearchHouse(toFind: String, _ completion: @escaping (_ success: Bool, _ data: [GotHouse]?) -> Void) {
        
        
        let originalQuery = toFind.replacingOccurrences(of: " ", with: "%20")
        
        let url = "https://anapioficeandfire.com/api/houses?pageSize=10&page=1&name=House%20Algood"
        
        let session = URLSession(configuration: .default)
        
    
        session.dataTask(with: URL(string: url)!){
            (data, _, err) in
            
            if let error = err{
                print(error)
                completion(false,nil)
              return
            }
            
            guard let APIData = data else {
                print("No data found")
                completion(false,nil)
                return
            }
            
            do{
                print("house found")
                
                let houses = try JSONDecoder().decode([GotHouse].self, from: APIData)
                completion(true, houses)
                
            } catch {
                completion(false,nil)
                print(error)
            }
            
            
        }.resume()
        
    }
    
    func loadInitial(){
        
        let page = 1
        
        let url = "https://anapioficeandfire.com/api/houses?pageSize=1000&page=\(page)"
        
        let session = URLSession(configuration: .default)
        
        DispatchQueue.main.async {
            
            if self.initialfetchedHouses == nil {
                self.initialLoad = true
            }
            
        }
        
        session.dataTask(with: URL(string: url)!){
            (data, _, err) in
            
            if let error = err{
                print(error)
                return
            }
            
            guard let APIData = data else {
                print("No data found")
                return
            }
            
            do{
                
                let houses = try JSONDecoder().decode([GotHouse].self, from: APIData)
                
                DispatchQueue.main.async {
                    if self.initialfetchedHouses == nil {
                        
                        self.initialfetchedHouses = houses
                        self.initialLoad = false
                    }
                }
                
            } catch {
                print(error)
            }
            
            
        }.resume()
    }
}

class ViewModelMembers: ObservableObject {
    
    @Published var characters: [GotCharacter] = []
    @Published var initialLoad = true
    
    func fetch(characters: [String]?) {
        
        if(true){
            
            for character in characters! {
                
                guard let url = URL(string: character) else {return}
                
                URLSession.shared.dataTask(with: url) { [weak self]
                    ( data, response, error) in
                    
                    if let error = error {
                        print("error : \(error)")
                    }
                    
                    guard let data = data else {
                        print("no data found")
                        return
                    }
                    
                    
                    if(self!.initialLoad == true){
                        do {
                            let decoder = JSONDecoder()
                            
                            let result = try decoder.decode(GotCharacter.self, from: data)
                            
                            DispatchQueue.main.async {
                                
                                
                                self?.characters.append(result)
                                
                                
                            }
                            
                        } catch let error {
                            print("error: \(error)")
                        }
                    }
                    
                    
                }.resume()
            }
            
            DispatchQueue.main.async {
                
                self.initialLoad = false;
                
            }
            
            
        }
        
        
        func tesFetch(character_url: String, _ completion: @escaping (_ success: Bool, _ data: Character?) -> Void) {
            
            
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
}


class ViewModelBranch: ObservableObject {
    
    @Published var houses: [GotHouse] = []
    @Published var initialLoad = true
    
    func fetch(brances: [String]?) {
        
        
        for branch in brances! {
            
            guard let url = URL(string: branch) else {return}
            
            URLSession.shared.dataTask(with: url) { [weak self]
                ( data, response, error) in
                
                if let error = error {
                    print("error : \(error)")
                }
                
                guard let data = data else {
                    print("no data found")
                    return
                }
                
                
                if(self!.initialLoad == true) {
                    
                    do {
                        let decoder = JSONDecoder()
                        
                        let result = try decoder.decode(GotHouse.self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            self?.houses.append(result)
                        }
                        
                        
                    } catch let error {
                        print("error: \(error)")
                    }
                }
                
                
            }.resume()
        }
        
       
        DispatchQueue.main.async {
            
            self.initialLoad = false
        }
        
    }
}
