//
//  Movie.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2023/09/06.
//

import Foundation

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailUrl: URL
    
    var categories: [String]
    var genre: HomeGenre = .AllGenres //make multiple genre for 1 movie?? YES
    
    //MovieDetail View
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    
    var currentEpisodeInfo: CurrentEpisodeInfo?
    //defaultFirstEpisode/movie
    var defaultEpisodeInfo: CurrentEpisodeInfo
    var cast: String
    var creators: String
    
    var moreLikeThisMovies: [Movie]
    
    var episodes: [Episode]?
    
    var movieType: MovieType {  //no need to initialize since its {}
        return episodes != nil ? .tvShow : .movie
    }
    
    var promotionalHeadline: String?
    
    var trailers: [Trailer]

    var previewImageName: String //names like in Assets
    var previewVideoURL: URL?
    
    var numberOfSeasonsDisplay: String {
        if let num = numberOfSeasons {
            if num == 1 {
                return "1 season"
            } else {
                return "\(num) seasons"
            }
        }
        return ""
    }
    
    var currentEpisodeTitle: String {
        if let current = currentEpisodeInfo {
            return "S\(current.season):E\(current.episode) \(current.title)"
        } else {
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.title)"
        }
    }
    
    var currentEpisodeDescription: String {
        if let current = currentEpisodeInfo {
            return current.description
        } else {
            return defaultEpisodeInfo.description
        }
    }
}

struct CurrentEpisodeInfo: Hashable, Equatable {
    var season: Int
    var episode: Int
    var title: String
    var description: String
}

enum MovieType {
    case movie
    case tvShow
}
