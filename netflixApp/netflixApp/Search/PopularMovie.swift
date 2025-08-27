//
//  PopularMovie.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/25.
//

import SwiftUI
import Kingfisher

struct PopularMovie: View {
    var movie: Movie
    
    @Binding var movieDetailToShow: Movie?
    //HEIGHT SET best practice check
    var body: some View {
        GeometryReader { proxy in
            HStack {
                KFImage(movie.thumbnailUrl)
                    .resizable()
                    //.aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width / 3, height: proxy.size.width / 5)
                    .clipped()
                    .padding(.leading, 2)
                
                Text(movie.name)
                    .lineLimit(1)
                    .padding(10)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Button {
                    //play
                } label: {
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .onTapGesture { //TO DO: tap gesture unrecognizable after label(right to)
                movieDetailToShow = movie
            }
        }
    }
}

#Preview {
    PopularMovie(movie: exampleMovie1, movieDetailToShow: .constant(nil))
        .background(.black)
        .frame(height: UIScreen.main.bounds.width / 5)
}
