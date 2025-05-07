//
//  CardMenu.swift
//  Battle Card Game
//
//  Created by Moriah Bender on 5/2/25.
//

//
import SwiftUI

struct CardMenu: View {
    
    @StateObject var deckManager = DeckManager() 
    @State private var showingAddCards = false
    @State private var showingCreateCard = false
    @State private var showingCreateDeck = false

    @State private var newDeckName = ""
    
    @State private var playerCard: Card?
    @State private var playerHand: [Card] = Array(RealCards.all)

    @State private var selectedCard: Card? = nil
    
    
    var body: some View {
        
        NavigationStack{
            
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 38) {
                    
                    // Showing all cards available
                    Spacer()
                    
                    Text("CARD LIBRARY")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(playerHand) { card in
                                Button(action: {
                                    //playCard(card)
                                    selectedCard = card
                                }) {
                                    VStack {
                                        card.image
                                            .resizable()
                                            .frame(width: 120, height: 160)
                                        Text(card.name)
                                            .foregroundColor(.gray)
                                        //Text("Power: \(card.power)")
                                        // .font(.caption)
                                    }
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    
                    HStack{
                        
                        Spacer()
                        Button("Add new cards"){
                            // show page where a player can purchase new cards
                            // ** this is a coming soon feauture (for future development)
                            showingAddCards = true
                        }
                        
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(8)
                        Spacer()
                        
                        
                        Button("Create a card") {
                            showingCreateCard = true
                            
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(8)
                        
                        Spacer()
                        
                        
                    }
                    
                    .navigationDestination(isPresented: $showingAddCards) {
                        AddCardsView()
                    }
                    
                    .navigationDestination(isPresented: $showingCreateCard) {
                        CreateACardView()
                    }
                    
                    
                    
                    
                    // FOR DECKS & DECK CREATION //
                    
                    
                    if(deckManager.deckList.isEmpty){
                        Text("deck library is empty")
                            .font(.title)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                            .bold()
                        
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
                            
                            // Since this is the section where adding a deck occurs, will have to understad in Swift how to write to a file and read from it since that file will be used as a means for storing data for this game app.
                            
                            //  When the Card Library is opened it must immediately read from the text file and display any decks created.
                            
                            // Once a player creates a Deck it must immediately be Written to a file (aka. stored)
                            
                            // A player must also have the option to delete a deck, modify a deck (adding or removing cards)
                        }
                    }
                    .padding()
                    
                }
            }
        }
        
// if we were to choose a sheet instead of a new page view for creating a card
        //.sheet(isPresented: $showingCreateCard) {
        //    VStack {   }}
                
                
                
       
        .sheet(item: $selectedCard) { card in
            VStack(spacing: 20) {
                
                
                card.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 400)
                
                Text(card.name)
                    .font(.title)
                    .bold()
                
                Text("Power: \(card.power)")
                Text("Card Abilities: .....")  // after discussing more card abilities with Kai, can add text about card here + add more
                    .font(.headline)
                
                Button("Close") {
                    selectedCard = nil
                }
                .padding()
            }
            .padding()
            
        }
        

    }
    
}


#Preview {
    CardMenu()
}
