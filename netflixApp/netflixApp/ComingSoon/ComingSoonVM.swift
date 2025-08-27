//
//  ComingSoonVM.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/26.
//

import Foundation

class ComingSoonVM: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        movies = generateMovies(20)
    }
}
