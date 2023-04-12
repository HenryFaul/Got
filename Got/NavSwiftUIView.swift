//
//  NavSwiftUIView.swift
//  Got
//
//  Created by Henry Faul on 2023/04/10.
//

import SwiftUI

struct NavSwiftUIView: View {
    
    @StateObject var houseData = HouseModel()
    @StateObject var bookData = BookModel()
    @StateObject var characterData = CharacterModel()
    
    var body: some View {
       
        TabView{
            
            //List of Houses view
            HousesSwiftUIView()
                .tabItem{
                    Image(systemName: "house.lodge")
                    Text("Houses")
                }
                .environmentObject(houseData)
            
            CharactersSwiftUIView()
                .tabItem{
                    Image(systemName: "person.3")
                    Text("Characters")
                }.environmentObject(characterData)
            
            BooksSwiftUIView()
                .tabItem{
                    Image(systemName: "books.vertical")
                    Text("Books")
                }.environmentObject(bookData)
            
        }
    }
}

struct NavSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavSwiftUIView()
    }
}
