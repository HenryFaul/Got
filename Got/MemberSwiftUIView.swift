//
//  MemberSwiftUIView.swift
//  Got
//
//  Created by Henry Faul on 2023/04/05.
//

import SwiftUI

struct MemberSwiftUIView: View {
    
    let swornMembers: [String]?
    
    @StateObject var viewModelMembers = ViewModelMembers()
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(viewModelMembers.characters, id: \.self) { item in
                    
                    NavigationLink(destination: CharacterDetailView(character_url: item.url ?? ""), label: {
                        
                        VStack (alignment: .leading){
                            
                            
                            HStack{
                                
                                Image("wolf")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height:70)
                                    .padding(.vertical,4)
                                
                                Text(item.name ?? "View character")
                                    .fontWeight(.semibold)
                                    .lineLimit(2)
                                
                            }
                            
                        }
                    })
                }
                
                
            }.onAppear{
                
                viewModelMembers.fetch(characters: swornMembers)
            }
            .navigationTitle("Swornmember list:")
        }
        
        
        
    }
}

struct MemberSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MemberSwiftUIView(swornMembers: ["String"])
    }
}
