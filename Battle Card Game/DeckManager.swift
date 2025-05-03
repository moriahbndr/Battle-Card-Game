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

class DeckManager: ObservableObject {
        
    
    @Published var deckList: [Deck] = []       // deck inventory

    // to create a new Deck
    func createDeck(name: String) {
        let newDeck = Deck(name: name)
        deckList.append(newDeck)
    }
    
    // Remove a deck
    func removeDeck(_ deck: Deck) {
        if let index = deckList.firstIndex(where: { $0.id == deck.id }) {
            deckList.remove(at: index)
        }
    }
    
    
    // adding a card to a deck, desk must be
    func addCard(_ card: Card, to deck: Deck) {
        if let index = deckList.firstIndex(where: { $0.id == deck.id }) {
            deckList[index].cards.append(card)
        }
    }
    
    func removeCard(_ card: Card, to deck: Deck) {
        if let deckIndex = deckList.firstIndex(where: { $0.id == deck.id }) {
            if let cardIndex = deckList[deckIndex].cards.firstIndex(of: card) {
                deckList[deckIndex].cards.remove(at: cardIndex)
            }
        }
    }

    

// ONCE INSIDE OF DECK ... //
    
    // Add a card to a specific deck
    func addCard2(_ card: Card, to deck: Deck) {
        if let index = deckList.firstIndex(where: { $0.id == deck.id }) {
            deckList[index].cards.append(card)
        }
    }
    
    // Remove a card from a specific deck
    func removeCard2(_ card: Card, from deck: Deck) {
        if let deckIndex = deckList.firstIndex(where: { $0.id == deck.id }) {
            if let cardIndex = deckList[deckIndex].cards.firstIndex(of: card) {
                deckList[deckIndex].cards.remove(at: cardIndex)
            }
        }
    }
    
    
    
    // dead code (for now) //
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
