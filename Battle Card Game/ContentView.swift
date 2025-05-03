//
//  ContentView.swift
//  Battle Card Game
//
//  Created by Moriah Bender on 4/30/25.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    Text(" MAIN MENU ")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        
                    
                    NavigationLink(destination: GameView()) {
                        Text("Start Game")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 215)
                            .background(Color.blue)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }
                    
                    NavigationLink(destination: CardMenu()) {
                        Text("View Cards")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 215)
                            .background(Color.blue)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }
                    
                    NavigationLink(destination: AccountView()) {
                        Text("Account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 215)
                            .background(Color.blue)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }
                    
                    
                    Spacer()

                }
            }
        }
    }
}
#Preview {
    ContentView()
}
