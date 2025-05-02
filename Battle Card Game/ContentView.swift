//
//  ContentView.swift
//  Battle Card Game
//
//  Created by Moriah Bender on 4/30/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()

                    VStack {
                        Spacer()
                        
                        NavigationLink(destination: GameView()) {
                            Text("Start Game")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 200)
                                .background(Color.blue)
                                .cornerRadius(12)
                                .shadow(radius: 5)
                        }
                        
                        Spacer()
                    }
                }
            }
        }

#Preview {
    ContentView()
}
