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

