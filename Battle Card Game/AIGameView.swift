//
//  AIGameView.swift
//  Battle Card Game
//
//  Created by Antikot Gemtessa on 5/1/25.
//

import SwiftUI

struct AIGameView: View {
    
    @State private var playerHand: [Card] = Array(RealCards.all.shuffled())
    @State private var aiHand: [Card] = Array(RealCards.all.shuffled())

    @State private var playerCard: Card?
    @State private var aiCard: Card?

    @State private var playerScore = 0
    @State private var aiScore = 0

    var body: some View {
        VStack(spacing: 16) {
            // AI Name
            Text("Opponent")
                .font(.title)

            // AI Cards (back only)
            HStack {
                ForEach(aiHand) { _ in
                    Image("Tempo Cards/back") // <-- Replace with your actual back image
                        .resizable()
                        .frame(width: 60, height: 90)
                }
            }

            Spacer()

            // Played Cards
            HStack(spacing: 40) {
                if let aiPlayed = aiCard {
                    VStack {
                        aiPlayed.image
                            .resizable()
                            .frame(width: 80, height: 120)
                        Text("Opponent: \(aiPlayed.power)")
                    }
                }

                if let playerPlayed = playerCard {
                    VStack {
                        playerPlayed.image
                            .resizable()
                            .frame(width: 80, height: 120)
                        Text("You: \(playerPlayed.power)")
                    }
                }
            }

            Spacer()

            // Player Hand
            Text("Your Cards")
                .font(.headline)

            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(playerHand) { card in
                        Button(action: {
                            playCard(card)
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

            // Deck Button
            Button(action: drawCard) {
                Text("Draw Card")
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            // Score
            Text("Score — You: \(playerScore) | Opponent: \(aiScore)")
                .font(.headline)
                .padding(.top, 10)
        }
        .padding()
    }

    // MARK: - Game Logic

    func playCard(_ card: Card) {
        playerCard = card
        playerHand.removeAll { $0 == card }

        aiCard = SimpleAI.chooseCard(from: aiHand, against: card)

        if let aiPlay = aiCard {
            aiHand.removeAll { $0 == aiPlay }

            // Determine winner
            if card.power > aiPlay.power {
                playerScore += 1
            } else if card.power < aiPlay.power {
                aiScore += 1
            }
            // If equal, no points
        } else {
            // AI has no valid card, draw one
            aiHand.append(RealCards.drawRandom())
        }

        // Clear played cards after delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            playerCard = nil
            aiCard = nil
        }
    }

    func drawCard() {
        playerHand.append(RealCards.drawRandom())
    }
}
#Preview {
    AIGameView()
}
