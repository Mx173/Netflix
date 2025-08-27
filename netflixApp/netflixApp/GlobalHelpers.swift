//
//  GlobalHelpers.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2023/09/06.
//

import Foundation
import SwiftUI

let exampleImageURL1 = URL(string: "https://picsum.photos/200/100")!
let exampleImageURL2 = URL(string: "https://picsum.photos/200/100/")!
let exampleImageURL3 = URL(string: "https://picsum.photos/200/101")!

//random
var randomExampleImage: URL {
    return [exampleImageURL1, exampleImageURL2, exampleImageURL3].randomElement() ?? exampleImageURL1
}

let exampleVideoURL = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")!

let exampleTrailer1 = Trailer(name: "Season 1 Trailer", videoUrl: exampleVideoURL, thumbnailImageURL: exampleImageURL1)
let exampleTrailer2 = Trailer(name: "Season 2 Trailer", videoUrl: exampleVideoURL, thumbnailImageURL: exampleImageURL2)
let exampleTrailer3 = Trailer(name: "Final Season 3 Trailer", videoUrl: exampleVideoURL, thumbnailImageURL: exampleImageURL3)

let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]



let currentEpisodeInfo1 = CurrentEpisodeInfo(season: 2, episode: 8, title: "Darknes is Comming", description: "Bla bla bla rel scary episode, bla bla bla rel scary episode, bla bla bla rel scary episode, bla bla bla rel scary episode, bla bla bla rel scary episode")
let currentEpisodeInfo2 = CurrentEpisodeInfo(season: 1, episode: 7, title: "Darknes is Comming", description: "bla bla bla rel scary episode")
let currentEpisodeInfo3 = CurrentEpisodeInfo(season: 3, episode: 6, title: "Darknes is Comming", description: "bla bla bla rel scary episode")
let currentEpisodeInfo4 = CurrentEpisodeInfo(season: 4, episode: 5, title: "Darknes is Comming", description: "bla bla bla rel scary episode")
let currentEpisodeInfo5 = CurrentEpisodeInfo(season: 5, episode: 4, title: "Darknes is Comming", description: "bla bla bla rel scary episode")

//cmd opt ctr F to fix all

let exampleMovie1 = Movie(id: UUID().uuidString, name: "Dark", thumbnailUrl: URL(string: "https://picsum.photos/200/300")!, categories: ["Comedy","Action", "Adventure"], year: 2020, rating: "TV-MA", numberOfSeasons: 5, defaultEpisodeInfo: currentEpisodeInfo1, cast: "Leonardo Di Caprio, Rob De Niro", creators: "mr Nolan", moreLikeThisMovies: [exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie2, exampleMovie5], episodes: exampleEpisodes, promotionalHeadline: "Watch me right Now", trailers: exampleTrailers
                          , previewImageName: "bettercallsaul_logo", previewVideoURL: exampleVideoURL
)
let exampleMovie2 = Movie(id: UUID().uuidString, name: "And", thumbnailUrl: URL(string: "https://picsum.photos/200/300/")!, categories: ["",""], year: 2020, rating: "TV-MA", numberOfSeasons: 2, defaultEpisodeInfo: currentEpisodeInfo2, cast: "Leonardo Di Caprio, Rob De Niro", creators: "mr Nolan", moreLikeThisMovies: [], trailers: exampleTrailers
                          , previewImageName: "breakingbad_logo", previewVideoURL: exampleVideoURL
)
let exampleMovie3 = Movie(id: UUID().uuidString, name: "Even", thumbnailUrl: URL(string: "https://picsum.photos/200/301")!, categories: ["",""], year: 2020, rating: "Movie", defaultEpisodeInfo: currentEpisodeInfo3, cast: "Leonardo Di Caprio, Rob De Niro", creators: "mr Nolan", moreLikeThisMovies: [], promotionalHeadline: "Watch me right Now", trailers: exampleTrailers
                          , previewImageName: "stranger_logo", previewVideoURL: exampleVideoURL
)
let exampleMovie4 = Movie(id: UUID().uuidString, name: "Darker", thumbnailUrl: URL(string: "https://picsum.photos/200/302")!, categories: ["",""], year: 2020, rating: "TV-MA", defaultEpisodeInfo: currentEpisodeInfo4, cast: "Leonardo Di Caprio, Rob De Niro", creators: "mr Nolan", moreLikeThisMovies: [], trailers: exampleTrailers
                          , previewImageName: "jessicajones_logo", previewVideoURL: exampleVideoURL
)
let exampleMovie5 = Movie(id: UUID().uuidString, name: "Than It", thumbnailUrl: URL(string: "https://picsum.photos/200/303")!, categories: ["Action","Adventure"], year: 2020, rating: "TV-MA", numberOfSeasons: 4, defaultEpisodeInfo: currentEpisodeInfo5, cast: "Leonardo Di Caprio, Rob De Niro", creators: "mr Nolan", moreLikeThisMovies: [], trailers: exampleTrailers
                          , previewImageName: "siliconvalley_logo", previewVideoURL: exampleVideoURL
)
let exampleMovie6 = Movie(id: UUID().uuidString, name: "Dark",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/303/")!,
                          categories: ["Comedy","Action", "Adventure"],
                          year: 2021,
                          rating: "TV-MA",
                          numberOfSeasons: 4,
                          defaultEpisodeInfo: currentEpisodeInfo1,
                          cast: "Leonardo Di Caprio, Rob De Niro",
                          creators: "mr Nolan",
                          moreLikeThisMovies: [exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie2, exampleMovie5],
                          episodes: exampleEpisodes,
                          promotionalHeadline: "Watch me right Now",
                          trailers: exampleTrailers
                          ,previewImageName: "dark_logo",
                          previewVideoURL: exampleVideoURL
)

var exampleMovies: [Movie] {
    return [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6].shuffled()
}
let exampleEpisodeInfo: [CurrentEpisodeInfo] = [currentEpisodeInfo1, currentEpisodeInfo2, currentEpisodeInfo3, currentEpisodeInfo4, currentEpisodeInfo5]

var exampleEpisodes = [exampleEpisode1, exampleEpisode2, exampleEpisode3]

let exampleEpisode1 = Episode(name: "First Episode wow", season: 1, episodeNumber: 1, description: "This is beginning of the legendary TV show, veeeery good one.", length: 52, thumbnailImageURLString: "https://picsum.photos/150/104", videoURL: exampleVideoURL)

let exampleEpisode2 = Episode(name: "Revelation", season: 1, episodeNumber: 2, description: "In this episode you will find out who is vilian of this story.", length: 56, thumbnailImageURLString: "https://picsum.photos/150/103", videoURL: exampleVideoURL)

let exampleEpisode3 = Episode(name: "Second season PILOT? bla bla bla", season: 2, episodeNumber: 1, description: "Does second seasons even have pilots?? I thisnk so loong title, bla bla bla rel scary episode, bla bla bla rel scary episode, bla bla bla rel scary episode, bla bla bla rel scary episode", length: 63, thumbnailImageURLString: "https://picsum.photos/150/105", videoURL: exampleVideoURL)

extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        colors: [Color.white.opacity(0.0), Color.black.opacity(0.9)],
        startPoint: .top,
        endPoint: .bottom)
}

extension View { //is it still relevant?
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
