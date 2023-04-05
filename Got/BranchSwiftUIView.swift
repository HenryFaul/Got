//
//  BranchSwiftUIView.swift
//  Got
//
//  Created by Henry Faul on 2023/04/05.
//

import SwiftUI

struct BranchSwiftUIView: View {
    
    let cadetBranches: [String]?
    
    @StateObject var viewModelBranch = ViewModelBranch()
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(viewModelBranch.houses, id: \.self) { item in
                    
                    NavigationLink(destination: HouseDetailView(house: item), label: {
                        
                        VStack (alignment: .leading){
                            
                            
                            HStack{
                                
                                Image("wolf")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height:70)
                                    .padding(.vertical,4)
                                
                                Text(item.name ?? "View branch")
                                    .fontWeight(.semibold)
                                    .lineLimit(2)
                                
                            }
                            
                        }
                    })
                }
                
                
            }.onAppear{
                
                viewModelBranch.fetch(brances: cadetBranches)
            }
            .navigationTitle("Branch list:")
        }
        
        
        
    }
}

struct BranchSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        BranchSwiftUIView(cadetBranches: [""])
    }
}
