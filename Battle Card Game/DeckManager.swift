//
//  DeckManager.swift
//  Battle Card Game
//
//  Created by Moriah Bender on 5/3/25.
//
// -------------------------------------------- //
// This class will be responsible for
//      - creating a new Deck
//      - adding a new Deck to the Deck Inventory
//      -

import SwiftUI
import Foundation

class DeckManager: ObservableObject, Codable {
        
    
    @Published var deckList: [Deck] = []       // deck inventory
    private let fileName = "decksCreated.json"  // this is the a "file" where a player's/users deck gets stored to
                                                // and then read to load for the game
    
    // loadDecks() will always be called when a DeckManager class object is created
    init(){
        loadDecks()
    }

    
    // to create a new Deck
    func createDeck(name: String) {
        let newDeck = Deck(name: name) // allowing user to create the deck first without adding card to it initiallly
        //let newDeck = Deck(name: name, cards: []) // commented out this code for now out to possibly use later if users must
                                                    // create a deck with cards before it can be stored
        deckList.append(newDeck)
        saveDecks()
    }
    
    // Remove a deck
    func removeDeck(_ deck: Deck) {
        if let index = deckList.firstIndex(where: { $0.id == deck.id }) {
            //deckList.remove(at: index)
            deckList.removeAll { $0.id == deck.id }
            saveDecks()
        }
    }
    

// Deck functions that allow for saving and reading and removing to occur for the player/user //
    
    // returns the file Path for us to use later when storing/saving/removing/editting decks
    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }

    // direct/exact file location
    private func decksSavedFileURL() -> URL {
        getDocumentsDirectory().appendingPathComponent(fileName)
    }
    
    // function that saves decks to the file
    func saveDecks() {
        do {
            let data = try JSONEncoder().encode(deckList)
            try data.write(to: decksSavedFileURL())
        } catch {
            print("Failed to save decks: \(error)")
        }
    }
    
    // function that loads decks that have already been written out to the file
    func loadDecks() {
        let file = decksSavedFileURL()
        guard FileManager.default.fileExists(atPath: file.path) else { return }

        do {
            let data = try Data(contentsOf: file)
            let savedDecks = try JSONDecoder().decode([Deck].self, from: data)
            deckList = savedDecks
        } catch {
            print("Failed to load decks: \(error)")
        }
    }
    
    
    

// ONCE INSIDE OF DECK ... //
    
    // adding a card to a deck
    func addCard(_ card: Card, to deck: Deck) {
        if let index = deckList.firstIndex(where: { $0.id == deck.id }) {
            deckList[index].cards.append(card)
        }
    }
    
    // removing a card from a deck
    func removeCard(_ card: Card, from deck: Deck) {
        if let deckIndex = deckList.firstIndex(where: { $0.id == deck.id }) {
            if let cardIndex = deckList[deckIndex].cards.firstIndex(of: card) {
                deckList[deckIndex].cards.remove(at: cardIndex)
            }
        }
    }

 
    
    // dead code (for now) - Moriah //
    @Published var deckList2: [Card] = []

    // adds selected Card to current Deck
    func addCard(_ cardObject: Card){
        deckList2.append(cardObject)
        print("Added: \(cardObject)")
    }

    // removes selected Card from current Deck
    func removeCard(_ cardObject: Card){
        if let index = deckList2.firstIndex(of: cardObject) {
            let removed = deckList2.remove(at: index)
            print("Removed: \(removed)")
        } else {
            print("Card not found in deck.")
        }
    }
    
}


