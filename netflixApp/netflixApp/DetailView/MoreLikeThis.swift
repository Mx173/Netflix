//
//  MoreLikeThis.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/10/29.
//

import SwiftUI

struct MoreLikeThis: View {
    
    var movies: [Movie]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, content: {
            ForEach(0..<movies.count) { index in
                StandartHomeMovie(movie: movies[index])
            }
        })
        .foregroundColor(.white)
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        MoreLikeThis(movies: exampleMovies)
    }
}
