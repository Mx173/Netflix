//
//  PreviewVM.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/31.
//

import Foundation

class PreviewVM: ObservableObject {
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
