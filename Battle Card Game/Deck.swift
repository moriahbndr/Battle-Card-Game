//
//  Decks.swift
//  Battle Card Game
//
//  Created by Moriah Bender on 5/3/25.
//

import SwiftUI
import Foundation

struct Deck: Identifiable, CustomStringConvertible {
    let id = UUID()
    var name: String
    var cards: [Card] = []

    var description: String {
        return "\(name): \(cards.count) cards"
    }
    
}





