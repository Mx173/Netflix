//
//  VideoPreviewImage.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/14.
//

import SwiftUI
import Kingfisher

struct VideoPreviewImage: View {
    var imageURL: URL
    var videoURL: URL
    
    @State private var showingVideoPlayer = false
    
    var body: some View {
        ZStack {
            KFImage(imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Button(action: {
                showingVideoPlayer = true
            }, label: {
                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            })
            .sheet(isPresented: $showingVideoPlayer, content: {
                SwiftUIVideoView(url: videoURL)
            }) //WHY $$$ ^here
        }
    }
}

#Preview {
    VideoPreviewImage(imageURL: exampleImageURL1, videoURL: exampleVideoURL)
        .frame(height: 100)
}
