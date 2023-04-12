//
//  HousesSwiftUIView.swift
//  Got
//
//  Created by Henry Faul on 2023/04/10.
//

import SwiftUI

struct HousesSwiftUIView: View {
    
    @EnvironmentObject var houseData: HouseModel
    
    var body: some View {
       
        
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                VStack(spacing:15){
                    
                    HStack(spacing:10){
                        
                        Image(systemName:"magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search House", text: $houseData.searchQuery )
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.06), radius: 5, x: -5, y: -5)
                    
                }.padding()

                if let houses = houseData.fetchedHouses {
                    
                    
                    if(houseData.initialLoad == true){
                        
                        ProgressView()
                            .padding(.top, 20)
                    }
                    
                    
                    if houses.isEmpty {
                        Text("No results found..").padding(.top, 20)
                    }
                    else{
                       
                            ForEach(houses) { house in
                                
                                HouseRowView(house: house)
                            }
                    
                        
                    }
                    
                }
                else {
                    
                
                }
                
            })
            .navigationTitle("Houses")
            
        }.onAppear{
            
            houseData.loadInitial()
        }
        
        
    }
}

struct HousesSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavSwiftUIView()
    }
}


struct HouseRowView: View {
    
    var house: GotHouse
    
    var body: some View{
        
        VStack (){
            
            NavigationLink(destination: GotHouseDetailSwiftUIView(house: house), label: {
                
                HStack{
                    
                    VStack (){
                        Image("GOT")
                            .resizable()
                            .scaledToFit()
                            .frame(height:50)
                            .padding(.vertical,4)
                        Text(house.name ?? "Not set")
                            .font(.system(size: 25, weight: .medium, design: .default))
                            .lineLimit(3)
                        
                        Text("view")
                            .underline()
                            
                        
                        
                    }.padding(10)
                }
            })
           
            Divider()
        }
        Spacer(minLength: 0)
    }
}
