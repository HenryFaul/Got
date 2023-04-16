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
            
            if(viewModelCharacter.character?.name == nil && viewModelCharacter.character?.name != ""){
                ProgressView()
                    .padding(.top, 20)
            } else {
                
                if(viewModelCharacter.character?.name != nil && viewModelCharacter.character?.name != ""){
                    
                    HStack{
                        Text("Name: ").bold()
                        Text(viewModelCharacter.character?.name ?? "Not set")
                    }.frame(maxWidth: .infinity, alignment: .leading).padding(15)
                    
                   
                }
                
                if(viewModelCharacter.character?.gender != nil && viewModelCharacter.character?.gender != ""){
                    
                    HStack{
                        Text("Gender: ").bold()
                        Text(viewModelCharacter.character?.gender ?? "Not set")
                    } .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                    
                }
                
                if(viewModelCharacter.character?.culture != nil && viewModelCharacter.character?.culture != ""){
                    
                    HStack{
                        Text("Culture: ").bold()
                        Text(viewModelCharacter.character?.culture ?? "Not set")
                    } .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                   
                }
                
                if(viewModelCharacter.character?.born != nil && viewModelCharacter.character?.born != ""){
                    
                    HStack{
                        Text("Born: ").bold()
                        Text(viewModelCharacter.character?.born ?? "Not set")
                    } .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                    
                   
                }
                
                if(viewModelCharacter.character?.died != nil && viewModelCharacter.character?.died != ""){
                    
                    HStack{
                        Text("Died: ").bold()
                        Text(viewModelCharacter.character?.died ?? "Not set")
                    } .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                   
                }
                
                if(viewModelCharacter.character?.father != nil && viewModelCharacter.character?.father != ""){
                    
                    NavigationLink(destination: CharacterDetailView(character_url: (viewModelCharacter.character?.father)!), label: {
                        
                        HStack{
                            Text("Father: ").bold()
                            Text("View")
                        } .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                    })
                    
                }
                
                if(viewModelCharacter.character?.mother != nil && viewModelCharacter.character?.mother != ""){
                    
                    NavigationLink(destination: CharacterDetailView(character_url: (viewModelCharacter.character?.mother)!), label: {
                        
                        HStack{
                            Text("Mother: ").bold()
                            Text("View")
                        } .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                    })
                    
                }
                
                if(viewModelCharacter.character?.spouse != nil && viewModelCharacter.character?.spouse != ""){
                    
                    NavigationLink(destination: CharacterDetailView(character_url: (viewModelCharacter.character?.spouse)!), label: {
                        
                        HStack{
                            Text("Spouse: ").bold()
                            Text("View")
                        } .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                    })
                    
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
