//
//  ComingSoonView.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/26.
//

import SwiftUI

struct ComingSoonView: View {
    @State private var showNotificationList = false
    @State private var movieDetailToShow: Movie? = nil
    
    @State private var highlightedIndex: Int? = nil
    
    @ObservedObject var vm = ComingSoonVM()
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                LazyVStack {
                    NotificationBar(showNotificationList: $showNotificationList)
                    
                    ForEach(vm.movies.indices, id: \.self) { index in
                        let movie = vm.movies[index]
                        ComingSoonCard(movie: movie, movieDetailToShow: $movieDetailToShow, isHighlighted: index == highlightedIndex)
                            .frame(height: 450)
                            .background( //.background(GeometryReader { geo in Color.clear }) is a common pattern in SwiftUI to read the layout or position information
                                GeometryReader { geo in
                                    Color.clear
                                        .onAppear {
                                            calculateHighlight(for: geo, index: index)
                                        }
                                        .onChange(of: geo.frame(in: .global)) { _ in
                                            calculateHighlight(for: geo, index: index)
                                        }
                                }
                            )
                            .animation(.easeInOut, value: highlightedIndex)
                    }
                }
            }
            .foregroundColor(.white)
        }
    }
    
    private func calculateHighlight(for geometry: GeometryProxy, index: Int) {
            let screenCenterY = UIScreen.main.bounds.midY
            let cardCenterY = geometry.frame(in: .global).midY

            if abs(cardCenterY - screenCenterY) < 250 { // Adjust threshold as needed
                highlightedIndex = index
            }
        }
}

#Preview {
    ComingSoonView()
}
