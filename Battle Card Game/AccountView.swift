//
//  AccountView.swift
//  Battle Card Game
//
//  Created by Moriah Bender on 5/3/25.
//

import SwiftUI
import Foundation

struct AccountView: View {
    var body: some View {
        
        ZStack{
            
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                
                Text("Account")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding()
                

            }
            
        }
        
        
    }
}




#Preview {
    AccountView()
}
