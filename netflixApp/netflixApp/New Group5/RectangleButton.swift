//
//  RectangleButton.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/08/23.
//

import SwiftUI

struct RectangleButton: View {
    var text: String
    var iconName: String
    var backgroundColor: Color = Color.white
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action() //TO DO: is it correct?
        } label: {
            HStack {
                Spacer()
                Image(systemName: iconName)
                    .font(.headline)
                Text(text)
                    .bold()
                Spacer()
            }
        }
        .padding(.vertical, 4)
        .background(backgroundColor)
        .foregroundColor(backgroundColor == .white ? .black : .white)
        .cornerRadius(5.0)
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        
        RectangleButton(text: "Play", iconName: "play.fill") {
            //
        }
    }
}
