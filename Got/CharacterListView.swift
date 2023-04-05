//
//  CharacterListView.swift
//  Got
//
//  Created by Henry Faul on 2023/04/05.
//

import SwiftUI

struct CharacterListView: View {
    
    
    let currentLord: String?
    let heir: String?
    let overlord: String?
    let founder: String?
    
    
    
    var body: some View {
        
        NavigationView {
            
            HStack{
                
                VStack{
                    
                    
                    VStack{
                        
                        
                        List {
                            
                            NavigationLink(destination: CharacterDetailView(character_url: currentLord ?? "None"), label: {
                                
                                HStack (){
                                    Image("wolf")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height:70)
                                        .padding(.vertical,4)
                                    Text("Current lord")
                                }
                            })
                            
                            NavigationLink(destination: CharacterDetailView(character_url: heir ?? "None"), label: {
                                
                                HStack (){
                                    Image("wolf")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height:70)
                                        .padding(.vertical,4)
                                    Text("Heir")
                                }
                            })
                            
                            NavigationLink(destination: CharacterDetailView(character_url: overlord ?? "None"), label: {
                                
                                HStack (){
                                    Image("wolf")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height:70)
                                        .padding(.vertical,4)
                                    Text("Overlord")
                                }
                            })
                            
                            NavigationLink(destination: CharacterDetailView(character_url: founder ?? "None"), label: {
                                
                                HStack (){
                                    Image("wolf")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height:70)
                                        .padding(.vertical,4)
                                    Text("Founder")
                                }
                            })
                            
                        }
                        
                    }
                    
                    
                    
                }
                
            }
            .navigationTitle("Characters:")
        }
        
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(currentLord: "", heir: "", overlord: "", founder: "")
    }
}
