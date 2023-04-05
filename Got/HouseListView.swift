//
//  HouseListView.swift
//  Got
//
//  Created by Henry Faul on 2023/04/04.
//

import Foundation
import SwiftUI



struct HouseListView: View {
    
    @StateObject var viewModel = ViewModel()
    
    
    var body: some View{
        
        NavigationView {
            
            List {
                
                ForEach(viewModel.houses, id: \.self) { item in
                    
                    NavigationLink(destination: HouseDetailView(house: item), label: {
                        
                        VStack (alignment: .leading){
                            
                            
                            Text(item.name ?? "Not set")
                                .font(.system(size: 32, weight: .medium, design: .default))
                                .lineLimit(2)
                            
                            HStack{
                                
                                Image("wolf")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height:70)
                                    .padding(.vertical,4)
                                
                                Text(item.region ?? "Not set")
                                    .fontWeight(.semibold)
                                    .lineLimit(2)
                                
                            }
                            
                        }
                    })
                    
                    
                }
                
            }.onAppear{
                viewModel.fetch()
            }
            .navigationTitle("House list:")
        }
        
        
    }
}

struct HouseListViewPreviews: PreviewProvider {
    static var previews: some View {
        HouseListView()
    }
}
