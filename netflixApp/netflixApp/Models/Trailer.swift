//
//  Trailer.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/14.
//

import Foundation

struct Trailer: Identifiable, Hashable { //every time we have a foreach we gonna do identifiable
    var id: String = UUID().uuidString
    var name: String
    var videoUrl: URL
    var thumbnailImageURL: URL
    
    
}
