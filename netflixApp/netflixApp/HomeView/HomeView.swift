//
//  HomeView.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2023/09/06.
//

import SwiftUI

struct HomeView: View {
    var vm = HomeVM()
    
    let screen = UIScreen.main.bounds
    
    @State private var movieDetailToShow: Movie? = nil
    
    @State private var homeTopSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .AllGenres
    
    @State private var showHomeTopSelection = false
    @State private var showHomeGenreSelection = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            //main Vstack
            ScrollView(showsIndicators: false) {
                
                TopRowButtons(homeTopSelection: $homeTopSelection, homeGenre: $homeGenre, showHomeTopSelection: $showHomeTopSelection, showHomeGenre: $showHomeGenreSelection)
                
                TopMoviePreview(movie: exampleMovie6)
                    .frame(width: screen.width)
                    .padding(.top, -135)
                    .zIndex(-1)
                
                MoviePreviewRow(movies: exampleMovies)
                
                LazyVStack {
                    HomeContentGrid(vm: vm, homeTopSelection: homeTopSelection, genreSelection: homeGenre, movieDetailToShow: $movieDetailToShow)
                }
            }
            
            if movieDetailToShow != nil {
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
            }
            
            //TO DO: when chose season - hide tabbar
            if showHomeTopSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        Spacer()
                        
                        ForEach(HomeTopRow.allCases, id: \.self) { topRow in
                            Button {
                                homeTopSelection = topRow //SHOULD I USE SELF???
                                showHomeTopSelection = false
                            } label: {
                                Text(topRow.rawValue)
                                    .foregroundColor(homeTopSelection == topRow ? .white : .gray)
                                    .fontWeight(homeTopSelection == topRow ? .bold : .regular)
                                    .font(homeTopSelection == topRow ? .system(size: 30) : .system(size: 24))
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            showHomeTopSelection = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 56)) //maybe refactor font.title
                        }
                        .padding(.bottom, 40) //maybe do that button higher but list still in the center
                    }
                }
            }
            
            if showHomeGenreSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    ZStack(alignment: .bottom) {
                        
                        Spacer()
                        ScrollView {
                            
                            ForEach(vm.allGenres, id: \.self) { genre in
                                Button {
                                    homeGenre = genre //SHOULD I USE SELF???
                                    showHomeGenreSelection = false
                                } label: {
                                    Text(genre.rawValue)
                                        .foregroundColor(homeGenre == genre ? .white : .gray)
                                        .fontWeight(homeGenre == genre ? .bold : .regular)
                                        .font(homeGenre == genre ? .system(size: 30) : .system(size: 24))
                                }
                                .padding(.bottom, 40)
                                .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.top, 80)
                        
                        
                        Spacer()
                        
                        
                        Button {
                            showHomeGenreSelection = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 56)) //maybe refactor font.title
                        }
                        .padding(.bottom, 40) //maybe do that button higher but list still in the center
                    }
                }
            }
            
            
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButtons: View {
    @Binding var homeTopSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    
    @Binding var showHomeTopSelection: Bool
    @Binding var showHomeGenre: Bool
    
    var body: some View {
        switch homeTopSelection {
        case .home:
            HStack {
                Button(action: {
                    homeTopSelection = .home
                }, label: {
                    Image("netflixLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42)
                })
                Spacer()
                Button(action: {
                    homeTopSelection = .tvShows
                }, label: {
                    Text(HomeTopRow.tvShows.rawValue)
                })
                Spacer()
                Button(action: {
                    homeTopSelection = .movies
                }, label: {
                    Text(HomeTopRow.movies.rawValue)
                })
                Spacer()
                Button(action: {
                    homeTopSelection = .myList
                }, label: {
                    Text(HomeTopRow.myList.rawValue)
                })
                Spacer()
            }
            .padding(.leading, 16)
            .padding(.top, -15)
        case .tvShows, .movies, .myList:
            HStack {
                Button(action: {
                    homeTopSelection = .home
                }, label: {
                    Image("netflixLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42)
                })
                HStack(spacing: 20) {
                    Button(action: {
                        showHomeTopSelection = true
                    }, label: {
                        Text(homeTopSelection.rawValue)
                            .font(.system(size: 18))
                        Image(systemName: "triangle.fill")
                            .rotationEffect(.degrees(180), anchor: .center)
                            .font(.system(size: 6))
                            .scaleEffect(x: 1.5)
                    })
                    
                    Button(action: {
                        showHomeGenre = true
                    }, label: {
                        Text(homeGenre.rawValue)
                            .font(.system(size: 12))
                        Image(systemName: "triangle.fill")
                            .rotationEffect(.degrees(180), anchor: .center)
                            .font(.system(size:5))
                            .scaleEffect(x: 1.5)
                    })
                    Spacer()
                }
                .padding(.leading, 6)
            }
            .padding(.leading, 16)
            .padding(.top, -15)
        }
    }
}

enum HomeTopRow: String, CaseIterable { //if switch cases(of state) - than enum
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String {
    case AllGenres
    case Action
    case Adventure
    case Comedy
    case Horror
    case Thriller
    case Anime
    case Cartoon
    case Documentary
    case Biopic
}


