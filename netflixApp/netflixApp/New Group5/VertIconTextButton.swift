//
//  VertIconTextButton.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/08/23.
//

import SwiftUI

struct VertIconTextButton: View {
    var text: String
    var isOn: Bool
    var onStateIcon: String
    var offStateIcon: String
    
    var iconName: String {
        if (isOn) {
            return onStateIcon
        } else {
            return offStateIcon
        }
    }
    
    
    
    var action: () -> Void
    
    var body: some View {
        Button(action: {
           action()
        }, label: {
            VStack {
                Image(systemName: iconName)
                Text(text)
                    .font(.system(size: 14))
                    .bold()
            }
            .foregroundColor(.white)
        })
    }
}

struct VertIconTextButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VertIconTextButton(text: "test",
                               isOn: false,
                               onStateIcon: "circle.fill",
                               offStateIcon: "star") {
                //action
                //when action is last parameter - we can use this kind of closures
            }
        }
    }
}
