//
//  SimpleAI.swift
//  Battle Card Game
//
//  Created by Antikot Gemtessa on 5/1/25.
//

import Foundation

enum AIDifficulty {
    case easy, medium, hard
}

struct SimpleAI {
    // Change this to adjust how long the AI "thinks" (in seconds)
    static var responseDelay: TimeInterval = 1.5

    // You can change the difficulty level here
    static var difficulty: AIDifficulty = .medium

    static func chooseCard(from hand: [Card], against playerCard: Card) -> Card? {

        switch difficulty {
        case .easy:
            return hand.randomElement()

        case .medium:
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

        case .hard:
            // Always play the best card possible
            let sorted = hand.sorted(by: { $0.power > $1.power })
            return sorted.first(where: { $0.power >= playerCard.power }) ?? sorted.last
        }
    }
}


