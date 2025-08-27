//
//  MoviePreviewRow.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/30.
//

import SwiftUI

struct MoviePreviewRow: View {
    var movies: [Movie]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Previews")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 6)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) { //with images better to use lazy
                    ForEach(0..<movies.count) { movieIndex in //its better to loop over indexes not just "movies" (and no empty cell too!!)
                        VStack {
                            MoviewPreviewCircle(movie: movies[movieIndex])
                                .frame(width: 140, height: 140)
                                .padding(.vertical, 6)
                            
                            Spacer()
                        }
                    }
                }
                .padding(.leading, 6)
            }
        }
        .frame(height: 220)
        
    }
}

#Preview {
    MoviePreviewRow(movies: exampleMovies)
        .background(.black)
}
