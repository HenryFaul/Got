//
//  TitleSwiftUIView.swift
//  Got
//
//  Created by Henry Faul on 2023/04/05.
//

import SwiftUI



struct ListSwiftUIView: View {
    let values: [String]?
    
    var body: some View {
        
        ForEach(values!, id: \.self) { item in
            
            HStack{
                
                Text(item)
            }
        }
        
    }
}

struct ListSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ListSwiftUIView(values: ["String"])
    }
}
