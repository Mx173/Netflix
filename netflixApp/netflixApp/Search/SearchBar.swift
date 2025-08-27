//
//  SearchBar.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/19.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String //by changing this into the binding we saying that there will be diffrent source of truth, higher in ierarhy, it will be managed by parent view
    @State private var isEditing = false
    @Binding var isLoading: Bool
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.graySearchText)
                
                TextField("Search", text: $text) //SET PLACEHOLDER COLOR and marker color
                    .foregroundColor(.white)
                    .onTapGesture {
                        withAnimation {
                            isEditing = true
                        }
                    }
                
                if !text.isEmpty {
                    if isLoading {
                        Button {
                            text = ""
                        } label: {
                            ActivityIndicator(style: .medium, animate: .constant(true))//is it leak to animate ALL time??
                                .configure {
                                    $0.color = .white
                                }
                                .frame(width: 15, height: 15)
                        }
                    } else {
                        Button {
                            text = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.graySearchText)
                        }
                    }
                }
            }
            .padding(8)
            .background(Color(.graySearchBackground))
            .cornerRadius(8)
            
            if isEditing {
                Button(action: {
                    text = ""
                    withAnimation {
                        isEditing = false
                    }
                    hideKeyboard()
                }) {
                    Text("Cancel")
                        .foregroundColor(.white)
                }.padding(.leading, 6)
                    .transition(.move(edge: .trailing))
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        SearchBar(text: .constant(""), isLoading: .constant(false))
    }
}
