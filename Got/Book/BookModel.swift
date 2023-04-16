//
//  BookModel.swift
//  Got
//
//  Created by Henry Faul on 2023/04/11.
//

import SwiftUI
import Combine

class BookModel:  ObservableObject {
    
    @Published var isLoading = false;

    @Published var fetchedBooks: [GotBook] = []
    
    @Published var pageCount: Int = 1

    func increasePage(){
        
        if(pageCount < 1000){
            
            self.pageCount = self.pageCount + 20
        }
        
    }
    
    
    func tesLoad( _ completion: @escaping (_ success: Bool, _ data: [GotBook]?) -> Void) {
        
        
        guard let url = URL(string: "https://anapioficeandfire.com/api/books?pageSize=100") else {return}
        
        
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
                
                let result = try decoder.decode([GotBook].self, from: data)
                
                completion(true,result)
                
            } catch let error {
                print("error: \(error)")
                completion(false,nil)
            }
            
            
        }.resume()
        
    }
    
    
    func loadBooks(){
        
        if(self.isLoading == false){
            
            DispatchQueue.main.async {
                
                self.isLoading = true
                
            }
            
            print("Loading \(self.pageCount)")
            
            let url = "https://anapioficeandfire.com/api/books?pageSize=\(self.pageCount)"
            
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
                        
                        let books = try JSONDecoder().decode([GotBook].self, from: APIData)
                        
                        DispatchQueue.main.async {
                            
                            self.fetchedBooks = books
                                
                           // self.fetchedBooks.append(contentsOf: books)
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

