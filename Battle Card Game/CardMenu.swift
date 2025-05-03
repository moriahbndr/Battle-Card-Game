//
//  CardMenu.swift
//  Battle Card Game
//
//  Created by Moriah Bender on 5/2/25.
//

//
import SwiftUI


struct CardMenu: View {
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            
            VStack{
                Spacer()

                Text("Card Menu")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()

            }
        }
    }
}

#Preview {
    CardMenu()
}

