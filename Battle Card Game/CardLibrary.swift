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
}

struct TempoCards {
    static let all: [Card] = [
        Card(name: "Fish", power: 10, imageName: "Fish"),
        Card(name: "Goblin", power: 6, imageName: "Goblin"),
        Card(name: "Troll", power: 7, imageName: "Troll"),
        Card(name: "Wolf", power: 8, imageName: "Wolf"),
        Card(name: "Slime", power: 9, imageName: "Slime"),
        Card(name: "Orc", power: 5, imageName: "Orc"),
        Card(name: "Orc Black Eye", power: 7, imageName: "OrcBlackEye"),
        Card(name: "Fish Tamtacule", power: 8, imageName: "Fish2") // Add more as needed
    ]

    static func drawRandom() -> Card {
        all.randomElement()!
    }
}


