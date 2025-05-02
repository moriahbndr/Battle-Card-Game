//
//  SimpleAI.swift
//  Battle Card Game
//
//  Created by Antikot Gemtessa on 5/1/25.
//

import Foundation

struct SimpleAI {
    static func chooseCard(from hand: [Card], against playerCard: Card) -> Card? {
        // 1. Try to find a card that beats the player's card
        if let winningCard = hand.first(where: { $0.power > playerCard.power }) {
            return winningCard
        }

        // 2. Try to match the player's card power
        if let matchingCard = hand.first(where: { $0.power == playerCard.power }) {
            return matchingCard
        }

        // 3. Otherwise, discard the lowest power card
        return hand.min(by: { $0.power < $1.power })
    }
}

