//
//  StandartHomeMovie.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2023/09/06.
//

import SwiftUI
import Kingfisher

struct StandartHomeMovie: View {
    var movie: Movie
    
    var body: some View {
        KFImage(movie.thumbnailUrl)
            .resizable()
            .scaledToFill()
            .clipped() //TO DO: is it best solution??
    }
}

struct StandartHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandartHomeMovie(movie: exampleMovie1)
            .frame(width: 200, height: 300)
    }
}
