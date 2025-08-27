//
//  CustomTabView.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/10/11.
//

import SwiftUI

struct CustomTabView: View {
    @State private var currentTab: CustomTab = .episode
    
    var tabs: [CustomTab]
    @State private var textWidths: [CGFloat] = Array(repeating: 0, count: CustomTab.allCases.count)
    
    var movie: Movie
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    var body: some View {
        
        VStack {
            //custom tab picker
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 25) {
                    ForEach(0..<tabs.count, id: \.self) { index in
                        VStack {
                            Rectangle()
                                .frame(width: textWidths[index], height: 5)
                                .foregroundColor(tabs[index] == currentTab ? Color.red : Color.clear)
                                .padding(.bottom, 10)
                            Button {
                                currentTab = tabs[index]
                            } label: {
                                Text(tabs[index].rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .background(GeometryReader { geometry in
                                                        Color.clear
                                                            .onAppear {
                                                                textWidths[index] = geometry.size.width
                                                            }
                                                    })
                                    .foregroundColor(tabs[index] == currentTab ? Color.white : Color.gray)
                            }
                            .buttonStyle(PlainButtonStyle()) //less deep clicks
                        }
                    }
                }
            }
            
            //selected view
            switch currentTab {
            case .episode:
                EpisodesView(episodes: movie.episodes ?? [], showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
            case .trailers:
                TrailersAndMore(trailers: movie.trailers)
            case .more:
                MoreLikeThis(movies: movie.moreLikeThisMovies)
            }
            
        }
        .foregroundColor(.white)
    }
}

enum CustomTab: String, CaseIterable {
    case episode = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        CustomTabView(tabs: [.episode, .trailers, .more], movie: exampleMovie1, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
    }
}
