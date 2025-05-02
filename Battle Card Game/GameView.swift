//
//  GameView.swift
//  Battle Card Game
//
//  Created by Antikot Gemtessa on 5/1/25.
//
import SwiftUI

struct GameView: View {
    var body: some View {
        VStack(spacing: 30) {
            
            
            Text("Choose Game Mode")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)
            
            
            NavigationLink(destination: AIGameView()) {
                Text("Player vs AI")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220)
                    .background(Color.green)
                    .cornerRadius(12)
                    .shadow(radius: 5)
            }

            Button(action: {
                // Coming soon: Online 1v1
            }) {
                Text("Online 1v1 (Coming Soon)")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220)
                    .background(Color.gray)
                    .cornerRadius(12)
                    .shadow(radius: 5)
            }
            .disabled(true) // Feature not yet available

            Spacer()
        }
        .padding()
    }
}
#Preview {
    GameView()
}
