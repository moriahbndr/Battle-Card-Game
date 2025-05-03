//
//  CardMenu.swift
//  Battle Card Game
//
//  Created by Moriah Bender on 5/2/25.
//

//
import SwiftUI

struct CardMenu: View {
    
    @StateObject var deckManager = DeckManager() // or inject with @EnvironmentObject

    @State private var showingCreateDeck = false
    @State private var newDeckName = ""
    
    @State private var playerCard: Card?
    @State private var playerHand: [Card] = Array(TempoCards.all.prefix(5))

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                
                Spacer()
                
// Showing all cards available
                
                Text("Card Library")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(playerHand) { card in
                            Button(action: {
                                //playCard(card)
                            }) {
                                VStack {
                                    card.image
                                        .resizable()
                                        .frame(width: 80, height: 120)
                                    Text(card.name)
                                    Text("Power: \(card.power)")
                                        .font(.caption)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                }
                
                    
                Spacer()

                
                
                
                
// FOR DECKS & DECK CREATION //
                
                
                if(deckManager.deckList.isEmpty){
                   Text("No Decks created")
                        .font(.title)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                    Spacer()
                    
                } else {

                    // List of Decks
                    List {
                        ForEach(deckManager.deckList) {
                            deck in
                            VStack(alignment: .leading) {
                                Text(deck.name)
                                    .font(.headline)
                                Text("\(deck.cards.count) cards")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .onDelete { indexSet in
                            indexSet.forEach { i in
                                deckManager.removeDeck(deckManager.deckList[i])
                            }
                        }
                    }
                    .frame(maxHeight: 300)
                }
                

  
                Button("Create New Deck") {
                    showingCreateDeck = true
                }
                
                .padding()
                .background(Color.white)
                .cornerRadius(8)
            
                Spacer()
            }

// Once Create New Deck Button is Pressed //

            .padding()
            .sheet(isPresented: $showingCreateDeck) {
                VStack {
                    Text("New Deck Name")
                        .font(.headline)
                    TextField("Enter name", text: $newDeckName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button("Add Deck") {
                        deckManager.createDeck(name: newDeckName)
                        newDeckName = ""
                        showingCreateDeck = false
                    }
                }
                .padding()
            }
        }
    }
}


#Preview {
    CardMenu()
}

