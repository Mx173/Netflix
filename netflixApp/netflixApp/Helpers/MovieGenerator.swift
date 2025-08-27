//
//  MovieGenerator.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/24.
//

import Foundation
//deep learning below
func generateMovies(_ count: Int) -> [Movie] {
    guard count > 0 else { return [] }
    
    var allMovies: [Movie] = []
    
    for _ in 0..<count {
        let id = UUID().uuidString
        
        let nameLength = Int.random(in: 9..<20)
        let name = randomString(length: nameLength)
        
        let randThumbnail = Int.random(in: 0...9)
        let thumbnail = URL(string: "https://picsum.photos/200/30\(randThumbnail)")!
        
        let year = Int.random(in: 1999...2025)
        
        let cast = "Leonardo Di Caprio, Rob De Niro"
        let creators = "mr Nolan"
        let categories = ["Comedy","Action", "Adventure"]
        
        let headline = "Watch me right Now"
        
        let numSeasons = Int.random(in: 1...5)
        
        var allEpisodes: [Episode] = []
        
        for i in 1...numSeasons {
            allEpisodes.append(contentsOf: generateEpisodes(6, forsSeason: i))
        }
        
        let epinameLength = Int.random(in: 9..<20)
        let epiname = randomString(length: epinameLength)
        
        let epidescLength = Int.random(in: 150..<200)
        let epidesc = randomString(length: epidescLength)
        let defEpiInfo = CurrentEpisodeInfo(season: 1, episode: 1, title: epiname, description: epidesc)
        
        let allTrailers = generateTrailers(3)
        
        let moreLikeThis = exampleMovies
        
        let movie = Movie(id: id, name: name,
                          thumbnailUrl: thumbnail,
                          categories: categories, genre: .AllGenres,
                          year: year,
                          rating: "TV-MA",
                          numberOfSeasons: numSeasons, currentEpisodeInfo: defEpiInfo,
                          defaultEpisodeInfo: defEpiInfo,
                          cast: cast,
                          creators: creators,
                          moreLikeThisMovies: moreLikeThis,
                          episodes: allEpisodes,
                          promotionalHeadline: headline,
                          trailers: allTrailers
                          ,previewImageName: ""
        )
        allMovies.append(movie)
    }
    
    return allMovies
}

func generateTrailers(_ count: Int) -> [Trailer] {
    var allTrailers: [Trailer] = []
    
    for _ in 0..<count {
        let id = UUID().uuidString
        
        let nameLength = Int.random(in: 9..<20)
        let name = randomString(length: nameLength)
        
        let randThumbnail = Int.random(in: 0...9)
        let thumbnail = URL(string: "https://picsum.photos/300/10\(randThumbnail)")! //TO DO: check all incomming pic sizes and limit test 
        
        let trailer = Trailer(id: id, name: name, videoUrl: exampleVideoURL, thumbnailImageURL: thumbnail)
        
        allTrailers.append(trailer)
    }
    
    return allTrailers
}

func generateEpisodes(_ count: Int, forsSeason season: Int) -> [Episode] {
    var allEpisodes: [Episode] = []
    
    for num in 0..<count {
        let id = UUID().uuidString
        
        let nameLength = Int.random(in: 9..<20)
        let name = randomString(length: nameLength)
        
        let randThumbnail = Int.random(in: 0...9)
        let thumbnail = "https://picsum.photos/300/10\(randThumbnail)"
        
        let desc = "Does second seasons even have pilots?? I thisnk so loong title, bla bla bla rel scary episode, bla bla bla rel scary episode, bla bla bla rel scary episode, bla bla bla rel scary episode"
        let randLength = Int.random(in: 20..<60)
        
        let epides = Episode(id: id, name: name, season: season, episodeNumber: num + 1, description: desc, length: randLength, thumbnailImageURLString: thumbnail, videoURL: exampleVideoURL)
        
        allEpisodes.append(epides)
    }
    
    return allEpisodes
}

func randomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyz"
    return String((0..<length).map{_ in letters.randomElement()! })
}
