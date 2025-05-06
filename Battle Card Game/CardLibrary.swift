//
//  AiGame.swift
//  Battle Card Game
//
//  Created by Antikot Gemtessa on 5/1/25.
//
import SwiftUI

struct Card: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let power: Int
    let imageName: String

    var image: Image {
        Image(imageName)
    }

    var cardLibrary: [Card] = []       // card inventory
}

struct RealCards {
    static let all: [Card] = [
        Card(name: "Kitten", power: 0, imageName: "Kitten"),
        Card(name: "Fish", power: 1, imageName: "Fish"),
        Card(name: "Slime", power: 2, imageName: "Slime"),
        Card(name: "Sad Slime", power: 3, imageName: "SadSlime"),
        Card(name: "Frog", power: 4, imageName: "Frog"),
        Card(name: "Pixie", power: 5, imageName: "Pixie"),
        Card(name: "Wolf", power: 6, imageName: "Wolf"),
        Card(name: "Fire Wolf", power: 7, imageName: "FireWolf"),
        Card(name: "Ice Wolf", power: 7, imageName: "IceWolf"),
        Card(name: "Ghost", power: 8, imageName: "Ghost"),
        Card(name: "Lion", power: 9, imageName: "Lion")
    ]

    static func drawRandom() -> Card {
        all.randomElement()!
    }
    
    // these are the cards each new player will start with //

}

