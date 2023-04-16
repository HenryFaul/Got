//
//  HouseDetailView.swift
//  Got
//
//  Created by Henry Faul on 2023/04/04.
//

import SwiftUI

struct HouseDetailView: View {
    
    var house:House
    
    var body: some View {
        
        
        HStack{
            
            VStack{
                
                VStack{
                    Image("wolf")
                        .resizable()
                        .scaledToFit()
                        .frame(height:70)
                        .padding(.vertical,4)
                    
                    if((house.name) != nil){
                        VStack{
                            
                            Text("House name:")
                            Text(house.name ?? "House not set")
                                .font(.system(size: 32, weight: .medium, design: .default))
                                .lineLimit(3)
                        }
                        
                    }
                    
                    if((house.region) != nil){
                        
                        VStack{
                            
                            Text("Region:").padding(3)
                            Text(house.region ?? "Region not set")
                                .font(.system(size: 20, weight: .medium, design: .default))
                                .lineLimit(3).padding(3)
                        }
                        
                        
                       
                    }
                    if((house.coatOfArms) != nil){
                        
                        VStack{
                            
                            Text("Coat of arms:").padding(3)
                            Text(house.coatOfArms ?? "Coat of arms not set")
                                .font(.system(size: 20, weight: .medium, design: .default))
                                .lineLimit(3).padding(3)
                        }
                        
                        
                        
                    }
                    if((house.words) != nil){
                        
                        VStack{
                            
                            Text("House words:").padding(3)
                            Text(house.words ?? "Words of arms not set")
                                .font(.system(size: 20, weight: .medium, design: .default))
                                .lineLimit(3).padding(3)
                        }
                        
                       
                    }
                    if((house.diedOut) != nil){
                        
                        
                        VStack{
                            
                            Text("House words:").padding(3)
                            Text(house.diedOut ?? "Died out not set")
                                .font(.system(size: 20, weight: .medium, design: .default))
                                .lineLimit(3).padding(3)
                        }
                        
                        
                    }
                    
                    
                    
                    
                }
                
                Divider()
                
                VStack{
                    
                    List {
                        
                        NavigationLink(destination: CharacterListView(currentLord: house.currentLord, heir: house.heir, overlord: house.overlord, founder: house.founder), label: {
                            
                            HStack (){
                                Image("wolf")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height:70)
                                    .padding(.vertical,4)
                                Text("View Characters")
                            }
                        })
                        
                        
                        
                        
                        NavigationLink(destination: ListSwiftUIView(values:  house.titles), label: {
                            
                            HStack (){
                                Image("wolf")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height:70)
                                    .padding(.vertical,4)
                                Text("View Titles")
                            }
                        })
                        
                        NavigationLink(destination: ListSwiftUIView(values:  house.titles), label: {
                            
                            HStack (){
                                Image("wolf")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height:70)
                                    .padding(.vertical,4)
                                Text("View Ancestral Weapons")
                            }
                        })
                        
                        NavigationLink(destination: BranchSwiftUIView(cadetBranches: house.cadetBranches), label: {
                            
                            HStack (){
                                Image("wolf")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height:70)
                                    .padding(.vertical,4)
                                Text("View Cadet Brances")
                            }
                        })
                        
                        NavigationLink(destination: MemberSwiftUIView(swornMembers:  house.swornMembers), label: {
                            
                            HStack (){
                                Image("wolf")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height:70)
                                    .padding(.vertical,4)
                                Text("View Sworn Members")
                            }
                        })
                        
                        
                        
                    }
                    
                }
                
                
                
            }
            
            
        }
        
        
    }
}


