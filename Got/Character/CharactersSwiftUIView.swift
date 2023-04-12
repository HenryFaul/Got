//
//  CharactersSwiftUIView.swift
//  Got
//
//  Created by Henry Faul on 2023/04/12.
//

import SwiftUI

struct CharactersSwiftUIView: View {
    
    @EnvironmentObject var characterData: CharacterModel
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                if (characterData.fetchedCharacters.isEmpty) {
                    
                    ProgressView().padding(.top, 30)
                }
                else {
                    
                    VStack(spacing:15){
                        
                        ForEach(characterData.fetchedCharacters){
                            character in
                            
                            if(character.url != ""){
                            
                                CharacterRowView(character: character)
                            }
                            
                            //BookRowView(book: book)
                        }
                        
                        if(characterData.isLoading == true){
                            
                            ProgressView()
                                .padding(.vertical)
                                .onAppear(perform: {
                                   
                                    
                                })
                            
                        }else{
                            
                            GeometryReader{ reader -> Color in
                                
                                let minY = reader.frame(in: .global).minY
                                
                                let height = UIScreen.main.bounds.height / 1.3
                                
                            
                                if ((minY < height) && characterData.isLoading == false){
                        
                                    print("Last")
                                    
                                    DispatchQueue.main.async {
                                        characterData.increasePage()
                                        characterData.loadCharacters()
                                    }
                                    
                                }
                                
                                
                                return Color.clear
                            }.frame(width: 20, height: 20)
                        }
                        
                        
                    }.padding(.vertical)
                }
                
                
            }).navigationTitle("Characters")
            
            
        }
        .onAppear{
            
            if (characterData.fetchedCharacters.isEmpty){
                characterData.loadCharacters()
            }
            
        }
    }
}

struct CharactersSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersSwiftUIView()
    }
}


struct CharacterRowView: View {
    
    var character: GotCharacter
    
    var body: some View{
        
        VStack (){
            
            NavigationLink(destination: CharacterDetailView(character_url: character.url!), label: {
                
                HStack{
                    
                    VStack (){
                        Image("GOT")
                            .resizable()
                            .scaledToFit()
                            .frame(height:50)
                            .padding(.vertical,4)
                        Text(((character.name) == nil || character.name == "" ? "Not set" : character.name)!)
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
