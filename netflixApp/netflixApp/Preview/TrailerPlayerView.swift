//
//  TrailerPlayerView.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/31.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    var videoURL: URL?
    
    @Binding var playVideo: Bool
    
    var body: some View {
        if videoURL != nil {
        VideoPlayer(url: videoURL!, play: $playVideo)
            .autoReplay(true)
            //we cant pass optionals, bc of that we use unwrap !
        } else {
            Text("Could not load video")
        }
            
    }
}

#Preview {
    TrailerPlayerView(videoURL: nil, playVideo: .constant(true))
}

