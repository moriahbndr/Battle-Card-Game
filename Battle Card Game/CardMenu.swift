//
//  CardMenu.swift
//  Battle Card Game
//
//  Created by Moriah Bender on 5/2/25. and Antikot

//State private var deckName: player-input name for the deck being created.
//State private var selectedCards: tracks which cards the player selected (up to 10).
//EnvironmentObject var deckManager: connects to your global DeckManager instance to store decks.



import SwiftUI

struct CardMenu: View {
    @EnvironmentObject var deckManager: DeckManager   // Access shared deck manager
    @State private var selectedCards: [Card] = []     // Cards selected for the new deck
    @State private var deckName: String = ""          // Name for the deck being created

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()

            VStack(spacing: 10) {
                Text("Card Menu")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)

                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
                        ForEach(TempoCards.all) { card in
                            VStack {
                                Image(card.imageName) // Replace with actual image from assets
                                    .resizable()
                                    .frame(width: 80, height: 100)
                                    .cornerRadius(8)
                                
                                Text(card.name)
                                    .foregroundColor(.white)
                                Text("Power: \(card.power)")
                                    .font(.caption)
                                    .foregroundColor(.gray)

                                Button(action: {
                                    toggleSelection(for: card)
                                }) {
                                    Text(selectedCards.contains(card) ? "Remove" : "Select")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .padding(5)
                                        .background(selectedCards.contains(card) ? Color.red : Color.blue)
                                        .cornerRadius(6)
                                }
                            }
                            .padding(5)
                        }
                    }
                    .padding()
                }

                TextField("Enter Deck Name", text: $deckName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Create Deck") {
                    if selectedCards.count == 5 {
                        let newDeck = Deck(name: deckName, cards: selectedCards)
                        deckManager.deckList.append(newDeck)
                        selectedCards.removeAll()
                        deckName = ""
                    }
                }
                .disabled(selectedCards.count != 10 || deckName.isEmpty)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)

                Text("Selected: \(selectedCards.count)/10")
                    .foregroundColor(.white)
                    .padding(.bottom)
            }
            .padding()
        }
    }

    // Adds or removes a card from selection
    func toggleSelection(for card: Card) {
        if let index = selectedCards.firstIndex(of: card) {
            selectedCards.remove(at: index)
        } else if selectedCards.count < 10 {
            selectedCards.append(card)
        }
    }
}

#Preview {
    CardMenu()
}

