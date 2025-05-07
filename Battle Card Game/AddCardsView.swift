//
//  AddCardsView.swift
//  Battle Card Game
//
//  Created by Moriah Bender on 5/6/25.
//


import SwiftUI
import Foundation

struct AddCardsView : View{
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Feature coming soon!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                HStack{
                    
                    
                }
                
                Text("Shop will be launched soon")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                
            }
            
            
        }
    }
   
}

#Preview {
    AddCardsView()
}

