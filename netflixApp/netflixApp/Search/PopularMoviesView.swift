//
//  PopularMoviesView.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/25.
//

import SwiftUI
import Kingfisher

struct PopularMoviesView: View {
    var movies: [Movie]
    
    @Binding var movieDetailToShow: Movie? //wtf is that ? and !
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                Text("Popular Searches")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(10)
                
                LazyVStack(spacing: 1) {
                    ForEach(movies, id: \.id) { movie in //why id
                        PopularMovie(movie: movie, movieDetailToShow: $movieDetailToShow)
                            .frame(height: UIScreen.main.bounds.width / 5)
                    }
                }
            }
        }
    }
}

#Preview {
    PopularMoviesView(movies: generateMovies(6), movieDetailToShow: .constant(nil))
        .background(.black)
}
