//
//  SwiftUIVideoView.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/14.
//

import SwiftUI
import AVKit

struct SwiftUIVideoView: View {
    var url: URL
    
    private var player: AVPlayer {
        AVPlayer(url: url)
    }
    
    var body: some View {
        VideoPlayer(player: player)
    }
}
    
#Preview {
    SwiftUIVideoView(url: exampleVideoURL)
}
