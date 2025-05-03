//
//  Menu.swift
//  Battle Card Game
//
//  Created by Moriah Bender on 5/2/25.
//

import SwiftUI

struct MenuView: View{
    
        
//          Menu here will include the option to
        
//              * Start Game
        
//              * View Cards / Card Library
//                  (only if the player has at least 1 deck created)
//                      - view current decks
//                          -- delete a deck
//                          -- add to deck
//                          -- remove from deck
//                      - create a new deck & (prompt for name)
//                          - player can choose from default cards or store(coming soon)
//
//
//              * View Player Account (Coming Soon, requires Internet Access to store decks to cloud)
//                  - Change username
//                  - set a password (Y/N) - then prompt for one
//
            
// the code here will also be added to ContentView, contentView acting as "main" for viewing app
    
    var body: some View {
        
        
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
            

            VStack{
                Spacer()
                Text(" MAIN MENU ")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding()
                    
                
                Spacer()

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
                

                NavigationLink(destination: GameView()) {
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
                
                Text("Account")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 215)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                
                Spacer()
            }

        }
        
        
        
    }
}


#Preview {
    MenuView()
}
