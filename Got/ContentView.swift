//
//  ContentView.swift
//  Got
//
//  Created by Henry Faul on 2023/04/02.
//

import SwiftUI

struct ContentView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        
        
        
        ZStack {
            if self.isActive {
              NavSwiftUIView()
            } else {
                LinearGradient(gradient: Gradient(colors: [.black,.gray,.white]),
                               startPoint:.topLeading,
                               endPoint:.bottomTrailing)
                .ignoresSafeArea(.all)
                
                VStack(spacing:10){
                    Text("Game of Tests")
                        .font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(.white)
                        .padding(20)
                    Image("GOT").resizable()
                        .scaledToFit()
                        .padding(10)
                    
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
