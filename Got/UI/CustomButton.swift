//
//  CustomButton.swift
//  Got
//
//  Created by Henry Faul on 2023/04/04.
//

import Foundation
import SwiftUI

struct CustomButton: View {
    
    var ButtonLable:String
    
    var body: some View {
        
        Text(ButtonLable)
        
            .frame(width: 280,height: 50)
            .background(LinearGradient(gradient: Gradient(colors: [.gray,.white]),
                                       startPoint:.topLeading,
                                       endPoint:.bottomTrailing))
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}


