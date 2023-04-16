//
//  CharacterModel.swift
//  Got
//
//  Created by Henry Faul on 2023/04/12.
//

import Foundation
import SwiftUI
import Combine

class CharacterModel:  ObservableObject {
    
    @Published var isLoading = false;

    @Published var fetchedCharacters: [GotCharacter] = []
    
    @Published var pageCount: Int = 1

    func increasePage(){
        
        if(pageCount < 100){
            
            self.pageCount = self.pageCount + 1
        }
        
    }
    
    func tesLoad( _ completion: @escaping (_ success: Bool, _ data: [GotCharacter]?) -> Void) {
        
        
        guard let url = URL(string: "https://anapioficeandfire.com/api/characters?pageSize=1000&page=1") else {return}
        
        
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
                
                let result = try decoder.decode([GotCharacter].self, from: data)
                
                completion(true,result)
                
            } catch let error {
                print("error: \(error)")
                completion(false,nil)
            }
            
            
        }.resume()
        
    }
    
    func loadCharacters(){
        
        if(self.isLoading == false){
            
            DispatchQueue.main.async {
                
                self.isLoading = true
                
            }
            
            print("Loading \(self.pageCount)")
            
            let url = "https://anapioficeandfire.com/api/characters?pageSize=100&page\(self.pageCount)"
            
            let session = URLSession(configuration: .default)
            
            
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
                
                if(true){
                    do{
                        
                        let characters = try JSONDecoder().decode([GotCharacter].self, from: APIData)
                        
                        DispatchQueue.main.async {
                            
                            //self.fetchedCharacters = characters
                                
                            self.fetchedCharacters.append(contentsOf: characters)
                            self.isLoading = false
                        
                        }
                        
                    } catch {
                        print(error)
                    }
                }
                
                
            }.resume()
        }
        
        
        
    }
}

