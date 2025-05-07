//
//  DeckView.swift
//  Battle Card Game
//
//  Created by Moriah Bender on 5/7/25.
//

import SwiftUI
import Foundation

struct DeckView : View{
    @ObservedObject var deckManager = DeckManager()
    @State private var showingAddCards = false
    @State private var showingCreateCard = false
    
    
    let deck: Deck  // passed from the list

        var body: some View {
            
            NavigationView{
                
                
                ZStack {
                    Image("background")
                        .resizable()
                        .ignoresSafeArea()
                    
                    
                    VStack(spacing: 20) {
                        Spacer()
                        
                        Text(deck.name)
                            .font(.largeTitle)
                            .bold()

                        Text("Contains \(deck.cards.count) cards")
                            .font(.title2)

                        HStack{
                            
                            Spacer()
                            Button("Add Cards to Deck") {
                                showingAddCards = true
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(8)
                            .padding()
                            .sheet(isPresented: $showingAddCards) {
                                VStack {
                                    Text("TEST")
                                        .font(.headline)
                                    
                                    Button("TEST") {
                                        //deckManager.createDeck(name: newDeckName)
                                        //newDeckName = ""
                                        //showingCreateDeck = false
                                        
                                        
                                    }
                                }
                                .padding()
                                
                            }
                            
                            
                            //Spacer()
                            
                            
                            Button("Create a card") {
                                showingCreateCard = true
                            }
                            
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(8)
                            
                            Spacer()
                            
                        }
                        
                        List {
                            ForEach(deck.cards) { card in
                                HStack {
                                    card.image
                                        .resizable()
                                        .frame(width: 100, height: 140)
                                    Text(card.name)
                                        .foregroundColor(.white)
                                }
                                .listRowBackground(Color.clear)

                            }
                            .onDelete { indexSet in
                                indexSet.forEach { i in
                                    let cardToRemove = deck.cards[i]
                                    deckManager.removeCard(cardToRemove, from: deck)
                                }
                            }
                        }
    
                        .scrollContentBackground(.hidden)
                    
                    

                        Spacer()
                        
                    }
                    //.padding()
                    //.navigationTitle("Deck Details")
                    
                }
                
                
            }//
            
            
    }
    
    
}
#Preview {
    let sampleDeck = Deck(name: "Starter Deck", cards: Array(RealCards.all.prefix(5)))
        return DeckView(deck: sampleDeck)
}


