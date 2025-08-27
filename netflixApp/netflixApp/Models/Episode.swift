//
//  Episode.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/08/26.
//

import Foundation

struct Episode: Identifiable {
    var id = UUID().uuidString
    
    var name: String
    var season: Int
    var episodeNumber: Int
    var description: String
    var length: Int
    var thumbnailImageURLString: String
    var videoURL: URL
    var thumbnailURL: URL {
        return URL(string: thumbnailImageURLString)!
    }
}
