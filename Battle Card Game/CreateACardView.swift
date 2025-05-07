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
            
            VStack{
                Spacer()
                
                HStack{
                    Spacer()
                    Text("Feature coming soon!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                   
                    Spacer()
                   
                }
                
                Text("Create your custom cards and abilities here!")
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                
                
                Spacer()
            }
            

        }
    }
   
}

#Preview {
    CreateACardView()
}
