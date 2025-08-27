//
//  HomeVM.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2023/09/06.
//

import Foundation

class HomeVM: ObservableObject {
    
    //string=category!!
    @Published var movies: [String: [Movie]] = [:] //dictionary
    
    public var allCategories: [String] {
        movies.keys.map( {String($0) })
    }
    
    public var allGenres: [HomeGenre] = [.AllGenres, .Action, .Adventure, .Comedy, .Horror, .Thriller, .Anime, .Cartoon, .Documentary]
    
    public func getMovie(forCat cat: String, andHomeRow homeRow: HomeTopRow, andGenre genre: HomeGenre) -> [Movie] { //swift-like "for" and "and"
        switch homeRow {
        case .home:
            return movies[cat] ?? []
        case .tvShows:
            return (movies[cat] ?? []).filter({ ($0.movieType == .tvShow) && ($0.genre == genre) }) //$0 - each and every
        case .movies:
            return (movies[cat] ?? []).filter({ ($0.movieType == .movie) && ($0.genre == genre) })
        case .myList:
            return movies[cat] ?? [] //setsup mylist later
        }
    }
    
    init() {
        setupMovies()
    }
    
    func setupMovies() { //[here is categorys]
        movies["Trending now"] = exampleMovies
        movies["Malchiki"] = exampleMovies.shuffled()
        movies["Stop Hata"] = exampleMovies.shuffled()
    }
}
