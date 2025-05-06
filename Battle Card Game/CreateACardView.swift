//
//  CreateACardView.swift
//  Battle Card Game
//
//  Created by Moriah Bender on 5/6/25.
//

import SwiftUI
import Foundation

struct CreateACardView : View{
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            Text("Coming soon")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
   
}

#Preview {
    CreateACardView()
}
