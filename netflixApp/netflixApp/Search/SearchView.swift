//
//  SearchView.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/19.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var vm = SearchVM()
    
    @State private var searchText = ""
    @State var movieDetailToShow: Movie? = nil
    
    var body: some View { //giga review needed
        
        //$ access to a binding of a state
        //btw :)
        
        let searchTextBinding = Binding {
            return searchText
        } set: {
            searchText = $0
            vm.updateSearchText(with: $0) //beside this line its just binding
        }
        
        return ZStack { //why return
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            if movieDetailToShow == nil {
                VStack {
                    SearchBar(text: searchTextBinding, isLoading: $vm.isLoding)
                        .padding(6)
                   
                    ScrollView {
                        if vm.isShowingPopularMovies {
                            PopularMoviesView(movies: vm.popularMovies, movieDetailToShow: $movieDetailToShow)
                        } else if vm.viewState == .empty {
                            Text("Your search did not have any results.")
                                .font(.title3) //TO DO: check on smaller screen
                                .bold()
                                .padding(.top, 150)
                                .foregroundColor(.white)
                        } else if vm.viewState == .ready {
                            //TO DO: add wide wallpaper
                            //TO DO: reuse MoreLikeThis instead below
                            SearchResultsGrid(movies: vm.searchResults, movieDetailToShow: $movieDetailToShow)
                        }
                    }
                }
            } else {
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
            }
        }
    }
}

#Preview {
    SearchView()
}
