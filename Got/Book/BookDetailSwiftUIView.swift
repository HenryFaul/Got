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
            
            
            VStack{
               
                if((book.name) != nil && book.name != ""){
                    
                    HStack{
                        Text(book.name ?? "NA")
                            .font(.title).lineLimit(5)
                    } .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                    
                    
                }
                
                if((book.isbn) != nil && book.isbn != ""){
                    
                    HStack{
                        Text("Isbn: ").bold()
                        Text(book.isbn ?? "NA")
                            .padding(3).lineLimit(5)
                    } .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                    
                }
                
                if((book.publiser) != nil && book.publiser != ""){
                    
                    HStack{
                        Text("Publisher: ").bold()
                        Text(book.publiser ?? "NA")
                            .padding(3).lineLimit(5)
                    } .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                    
                }
                
            
                
                if((book.numberOfPages) != nil && "\(String(describing: book.numberOfPages))" != ""){
                    
                    HStack{
                        Text("Pages: ").bold()
                        Text(String(book.numberOfPages!))
                            .padding(3).lineLimit(5)
                    } .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                    
                }
                
                if((book.country) != nil && book.country != ""){
                    
                    HStack{
                        Text("Country: ").bold()
                        Text(book.country ?? "NA")
                            .padding(3).lineLimit(5)
                    } .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                    
                    
                }
                
                if((book.released) != nil && book.released != ""){
                    
                    HStack{
                        Text("Released: ").bold()
                        Text(book.released ?? "NA")
                            .padding(3).lineLimit(5)
                    } .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                    
                    
                }
                
                if((book.mediaType) != nil && book.mediaType != ""){
                    
                    HStack{
                        Text("Media Type: ").bold()
                        Text(book.mediaType ?? "NA")
                            .padding(3).lineLimit(5)
                    } .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                    
                    
                }
                
                VStack{
                    Divider()
                    
                    if((book.authors) != nil && !book.authors!.isEmpty){
                        
                        NavigationLink(destination: ListSwiftUIView(values:  book.authors), label: {
                            
                            HStack (){
                                Text("View Authors")
                            } .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                        })
                        
                    }
                
                    if((book.characters) != nil && !book.characters!.isEmpty){
                        
                        NavigationLink(destination: MemberSwiftUIView(swornMembers:  book.characters), label: {
                            
                            HStack (){
                                Text("View Characters")
                            } .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                        })
                        
                    }
                    
                    if((book.povCharacters) != nil && !book.povCharacters!.isEmpty){
                        
                        NavigationLink(destination: MemberSwiftUIView(swornMembers:  book.povCharacters), label: {
                            
                            HStack (){
                                Text("View Pov Characters")
                            } .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                        })
                        
                    }
                }
                
                Spacer()
            }
            
            
            
            
            

            
            
            
        }
    }
    
}
