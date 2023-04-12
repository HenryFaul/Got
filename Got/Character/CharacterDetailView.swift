//
//  CharacterDetailView.swift
//  Got
//
//  Created by Henry Faul on 2023/04/05.
//

import SwiftUI




struct CharacterDetailView: View {
    
    let character_url: String
    
    @StateObject var viewModelCharacter = ViewModelCharacter();
    
    
    var body: some View {
        
        
        VStack{
            Text("Character Details")
                .font(.system(size: 32, weight: .medium, design: .default))
                .lineLimit(2).padding(5)
            
            if(viewModelCharacter.character?.name == nil){
                ProgressView()
                    .padding(.top, 20)
            } else {
                
                if(viewModelCharacter.character?.name != nil){
                    Text(viewModelCharacter.character?.name ?? "Not set")
                }
                
                if(viewModelCharacter.character?.gender != nil){
                    Text(viewModelCharacter.character?.gender ?? "Not set")
                }
                
                if(viewModelCharacter.character?.culture != nil){
                    Text(viewModelCharacter.character?.culture ?? "Not set")
                }
                
                if(viewModelCharacter.character?.born != nil){
                    Text(viewModelCharacter.character?.born ?? "Not set")
                }
                
                if(viewModelCharacter.character?.died != nil){
                    Text(viewModelCharacter.character?.died ?? "Not set")
                }
                
                if(viewModelCharacter.character?.father != nil){
                    Text(viewModelCharacter.character?.father ?? "Not set")
                }
                
                if(viewModelCharacter.character?.mother != nil){
                    Text(viewModelCharacter.character?.mother ?? "Not set")
                }
                
                if(viewModelCharacter.character?.spouse != nil){
                    Text(viewModelCharacter.character?.spouse ?? "Not set")
                }
                
            }
            
            Spacer()
            
        }.onAppear{
            viewModelCharacter.fetch(character_url: character_url)
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character_url: "https://anapioficeandfire.com/api/characters/1922")
    }
}
