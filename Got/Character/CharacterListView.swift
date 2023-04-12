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
        
            
            HStack{
                
                VStack{
                    
                    
                    VStack{
                        
                        
                        List {
                            
                            if(currentLord != nil && currentLord != ""){
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
                            }
                            
                            if(heir != nil && heir != ""){
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
                            }
                            
                            if(overlord != nil && overlord != ""){
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
                            }
                            
                            if(founder != nil && founder != ""){
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
                
            }
            .navigationTitle("Characters:")
        }
        
    }


struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(currentLord: "", heir: "", overlord: "", founder: "")
    }
}
