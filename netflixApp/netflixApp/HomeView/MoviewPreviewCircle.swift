//
//  MoviewPreviewCircle.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/30.
//

import SwiftUI
import Kingfisher

struct MoviewPreviewCircle: View {
    var movie: Movie
    
    let colorsArray: [Color] = [.white, .yellow, .gray, .red, .orange]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(movie.thumbnailUrl)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(lineWidth: 3.0)
                        .foregroundColor(colorsArray.randomElement())
            }
            
            Image(movie.previewImageName)
                .resizable()
                .scaledToFit()
                //.offset(y: -20)
                .frame(height: 65)
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        
        MoviewPreviewCircle(movie: exampleMovie1)
            .frame(width: 140, height: 140)
    }
}
