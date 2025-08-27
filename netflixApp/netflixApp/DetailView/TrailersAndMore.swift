//
//  TrailersAndMore.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/14.
//

import SwiftUI

struct TrailersAndMore: View {
    var trailers: [Trailer]
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            ForEach(trailers) { trailer in
                VStack(alignment: .leading) { //PLAY WITH ALIGH AND FRAME BELOW!!!
                    VideoPreviewImage(imageURL: trailer.thumbnailImageURL, videoURL: trailer.videoUrl)
                        .frame(maxWidth: screen.width)

                    Text(trailer.name)
                        .foregroundColor(.white)
                        .padding([.leading, .bottom], 10)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    TrailersAndMore(trailers: exampleTrailers)
        .background(.black)
}
