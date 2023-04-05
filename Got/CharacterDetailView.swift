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
            
            Text(viewModelCharacter.character?.name ?? "Not set")
            Text(viewModelCharacter.character?.gender ?? "Not set")
            Text(viewModelCharacter.character?.culture ?? "Not set")
            Text(viewModelCharacter.character?.born ?? "Not set")
            Text(viewModelCharacter.character?.died ?? "Not set")
            Text(viewModelCharacter.character?.father ?? "Not set")
            Text(viewModelCharacter.character?.mother ?? "Not set")
            Text(viewModelCharacter.character?.spouse ?? "Not set")
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
