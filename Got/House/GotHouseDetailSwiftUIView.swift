//
//  GotHouseDetailSwiftUIView.swift
//  Got
//
//  Created by Henry Faul on 2023/04/10.
//

import SwiftUI


struct GotHouseDetailSwiftUIView: View {
    
    var house:GotHouse
    
    var body: some View {
        
        
        HStack{
            
            VStack{
                
                VStack{
                    Image("wolf")
                        .resizable()
                        .scaledToFit()
                        .frame(height:40)
                        .padding(.vertical,4)
                    
                    if((house.name) != nil){
                        
                        VStack{
                    
                            Text(house.name ?? "House not set")
                                .font(.title).lineLimit(5)
                        }
                        
                        
                    }
                    
                    if((house.region) != nil && (house.region) != ""){
                        
                        VStack{
                            Text("Region:").underline().padding(2)
                            Text(house.region ?? "Region not set")
                                .padding(3).lineLimit(5)
                        }
                       
                    }
                    if((house.coatOfArms) != nil && (house.coatOfArms) != ""){
                        VStack{
                            Text("Coat of arms:").underline().padding(2)
                            Text(house.coatOfArms ?? "Coat of arms not set")
                                .padding(10).lineLimit(5).fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.leading)
                        }
                    }
                    if((house.words) != nil && (house.words) != ""){
                        
                        VStack{
                            Text("Words:").underline().padding(2)
                            Text(house.words ?? "Words of arms not set")
                                .padding(3).lineLimit(5)
                        }
                        
                    }
                    if((house.diedOut) != nil && (house.diedOut) != ""){
                        
                        VStack{
                            Text("Died out:").underline()
                            Text(house.diedOut ?? "Died out not set")
                                .padding(3).lineLimit(5)
                        }
                        
                        
                    }
                    
                }
                
                Divider()
                
                VStack{
                    
                    List {
                        
                        if(house.currentLord != "" || house.heir != "" || house.currentLord != "" || house.overlord != "" || house.founder != "" ){
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
                        }
                        
                        
                        if(house.titles != [] && house.titles != nil && house.titles != [""]){
                            
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
                        }
                        
                        if(house.cadetBranches?.isEmpty == false){
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
                        }
                        
                        
                        if(house.swornMembers?.isEmpty == false){
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
}


