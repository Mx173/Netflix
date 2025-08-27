//
//  MovieDetail.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/08/26.
//

import SwiftUI

struct MovieDetail: View {
    var movie: Movie
    
    let screen = UIScreen.main.bounds
    @State private var showSeasonPicker = false
    @State private var currentSeason = 1
    
    @Binding var movieDetailToShow: Movie? //DIFFERENCE BETWEEN ! AND ?
    
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        //ADD ANIMATION TO GO BACK!!!!!
                            movieDetailToShow = nil
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 26))
                    })
                }
                .padding(.horizontal, 16)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        StandartHomeMovie(movie: movie)
                            .frame(width: screen.width / 2.5)
                        
                        MoreInfoSubheadLine(movie: movie)
                        
                        if movie.promotionalHeadline != nil {
                            Text(movie.promotionalHeadline!)
                                .bold()
                        }
                        
                        RectangleButton(text: "Play", iconName: "play.fill", backgroundColor: .red) {
                            //
                        }
                        
                        CurrentEpisodeInformation(movie: movie)
                        
                        CastInfo(movie: movie)
                        
                        HStack(spacing: 30) {
                            VertIconTextButton(text: "My List", isOn: true, onStateIcon: "checkmark", offStateIcon: "plus") {
                                //
                            }
                            VertIconTextButton(text: "Rated", isOn: true, onStateIcon: "hand.thumbsup.fill", offStateIcon: "hand.thumbsup") {
                                //
                            }
                            VertIconTextButton(text: "My List", isOn: true, onStateIcon: "square.and.arrow.up", offStateIcon: "square.and.arrow.up") {
                                //
                            }
                            Spacer()
                        }
                        .padding(.leading, 20)
                        
                        CustomTabView(tabs: [.trailers, .episode, .more], movie: movie, showSeasonPicker: $showSeasonPicker, selectedSeason: $currentSeason)
                            .padding(.top, 20)
                    }
                    .padding(.horizontal, 10)
                }
                
                Spacer()
            }
            .foregroundColor(.white)
            
            if showSeasonPicker {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack {
                        Spacer()
                        
                        ForEach(0..<(movie.numberOfSeasons ?? 0)) { season in
                            Button {
                                self.currentSeason = season + 1 //SHOULD I USE SELF???
                                showSeasonPicker = false
                            } label: {
                                Text("Season \(season + 1)")
                                    .foregroundColor(currentSeason == season + 1 ? .white : .gray)
                                    .bold()
                                    .font(currentSeason == season + 1 ? .system(size: 30) : .system(size: 24))
                            }.padding(10)
                            
                        }
                        
                        Spacer()
                        
                        Button {
                            showSeasonPicker = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 56)) //maybe refactor font.title
                        }
                        .padding(.bottom, 40)
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
        }.transition(.opacity)
    }
}

#Preview {
    MovieDetail(movie: exampleMovie1, movieDetailToShow: .constant(nil))
}

struct MoreInfoSubheadLine: View {
    var movie: Movie
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            Text(String(movie.year))
            RatingView(rating: movie.rating)
            Text(movie.numberOfSeasonsDisplay)
        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    var rating: String
    
    var body: some View {
        ZStack {
            Rectangle()
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50, height: 20)
    }
}

struct CastInfo: View {
    var movie: Movie
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text("Cast: \(movie.cast)")
                Spacer()
            }
            HStack {
                Text("Creators: \(movie.creators)")
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical, 5)
    }
}

struct CurrentEpisodeInformation: View {
    var movie: Movie
    
    var body: some View {
        Group {
            HStack {
                Text(movie.currentEpisodeTitle)
                    .font(.headline)
                    .padding(.top, 5)
                    .padding(.vertical, 1)
                Spacer()
            }
            
            HStack {
                Text(movie.currentEpisodeDescription)
                    .font(.subheadline)
                Spacer()
            }
        }
    }
}
