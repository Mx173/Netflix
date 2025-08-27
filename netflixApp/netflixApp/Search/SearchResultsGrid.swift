//
//  SearchResultsGrid.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/26.
//

import Kingfisher
import SwiftUI

struct SearchResultsGrid: View {
    var movies: [Movie]
    
    @Binding var movieDetailToShow: Movie? //wtf is that ? and !
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                Text("Movies & TV")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(10)
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(movies) { movie in
                        StandartHomeMovie(movie: movie)
                            .onTapGesture {
                                movieDetailToShow = movie
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    SearchResultsGrid(movies: generateMovies(20), movieDetailToShow: .constant(nil))
        .background(.black)
}
