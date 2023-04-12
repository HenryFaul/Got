//
//  BooksSwiftUIView.swift
//  Got
//
//  Created by Henry Faul on 2023/04/11.
//

import SwiftUI

struct BooksSwiftUIView: View {
    
    @EnvironmentObject var bookData: BookModel
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                if (bookData.fetchedBooks.isEmpty) {
                    
                    ProgressView().padding(.top, 30)
                }
                else {
                    
                    VStack(spacing:15){
                        
                        ForEach(bookData.fetchedBooks){
                            book in
                            
                            BookRowView(book: book)
                        }
                        
                        if(bookData.isLoading == true){
                            
                            ProgressView()
                                .padding(.vertical)
                                .onAppear(perform: {
                                   
                                    
                                })
                            
                        }else{
                            
                            GeometryReader{ reader -> Color in
                                
                                let minY = reader.frame(in: .global).minY
                                
                                let height = UIScreen.main.bounds.height / 1.3
                                
                            
                                if ((minY < height) && bookData.isLoading == false){
                        
                                    print("Last")
                                    
                                    DispatchQueue.main.async {
                                        bookData.increasePage()
                                        bookData.loadBooks()
                                    }
                                    
                                }
                                
                                
                                return Color.clear
                            }.frame(width: 20, height: 20)
                        }
                        
                        
                    }.padding(.vertical)
                }
                
                
            }).navigationTitle("Books")
            
            
        }
        .onAppear{
            
            if (bookData.fetchedBooks.isEmpty){
                bookData.loadBooks()
            }
            
        }
    }
}

struct BooksSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        BooksSwiftUIView()
    }
}


struct BookRowView: View {
    
    var book: GotBook
    
    var body: some View{
        
        VStack (){
            
            NavigationLink(destination: BookDetailSwiftUIView(book: book), label: {
                
                HStack{
                    
                    VStack (){
                        Image("GOT")
                            .resizable()
                            .scaledToFit()
                            .frame(height:50)
                            .padding(.vertical,4)
                        Text(book.name ?? "Not set")
                            .font(.system(size: 25, weight: .medium, design: .default))
                            .lineLimit(3)
                        
                        Text("view")
                            .underline()
                            
                        
                        
                    }.padding(10)
                }
            })
           
            Divider()
        }
        Spacer(minLength: 0)
    }
}
