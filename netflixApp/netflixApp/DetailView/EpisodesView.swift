//
//  EpisodesView.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/16.
//

import SwiftUI

struct EpisodesView: View {
    var episodes: [Episode]
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    func getEpisodes(forSeason season: Int) -> [Episode] {
        return episodes.filter({ $0.season == season})
    }
    
    var body: some View {
        VStack {
            //season carousel
            HStack {
                Button(action: {
                    showSeasonPicker = true
                }, label: {
                    Group {
                        Text("Season \(selectedSeason)")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                })
                Spacer()
            }
            
            //episodes list
            ForEach(getEpisodes(forSeason: selectedSeason)) { episode in
                VStack(alignment: .leading) {
                    HStack {
                        VideoPreviewImage(imageURL: episode.thumbnailURL, videoURL: episode.videoURL)
                            .frame(width: 120, height: 70)
                            .clipped()
                            
                        VStack(alignment: .leading) {
                            Text("\(episode.episodeNumber). \(episode.name)")
                                .font(.system(size: 16))
                                .bold()
                                .lineLimit(1)
                            
                            Text("\(episode.length)m")
                                .font(.system(size: 13))
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "arrow.down.to.line")
                            .font(.system(size: 24))
                    }
                    
                    Text(episode.description)
                        .font(.system(size: 14))
                        .lineLimit(3)
                        .padding(.top, 2)
                }
                .padding(.vertical, 10)
                .foregroundColor(.white)
            }
            
         Spacer()
        }
        .padding(10)
    }
}

#Preview {
    EpisodesView(episodes: [exampleEpisode1, exampleEpisode2, exampleEpisode3], showSeasonPicker: .constant(false), selectedSeason: .constant(1))
        .background(.black)
}
