//
//  BookDetailSwiftUIView.swift
//  Got
//
//  Created by Henry Faul on 2023/04/11.
//

import SwiftUI

struct BookDetailSwiftUIView: View {
    
    var book:GotBook
    var body: some View {
        
        VStack{
            Image("wolf")
                .resizable()
                .scaledToFit()
                .frame(height:40)
                .padding(.vertical,4)
            
            if((book.name) != nil){
                Text(book.name ?? "NA")
                    .font(.title).lineLimit(5)
                
            }
            
            if((book.isbn) != nil){
                Text(book.isbn ?? "NA")
                
                    .padding(10).lineLimit(5)
            }
            
            if((book.publiser) != nil){
                Text(book.publiser ?? "NA")
                
                    .padding(10).lineLimit(5)
            }
            
            if((book.country) != nil){
                Text(book.country ?? "NA")
                
                    .padding(10).lineLimit(5)
            }
            
            if((book.released) != nil){
                Text(book.released ?? "NA")
                
                    .padding(10).lineLimit(5)
            }
            
            if((book.released) != nil){
                Text(book.released ?? "NA")
                
                    .padding(10).lineLimit(5)
            }
            
            if((book.mediaType) != nil){
                Text(book.mediaType ?? "NA")
                
                    .padding(10).lineLimit(5)
            }
        }
    }
}

