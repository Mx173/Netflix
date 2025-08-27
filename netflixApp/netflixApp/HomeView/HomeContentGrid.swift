//
//  HomeContentGrid.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/18.
//

import SwiftUI

struct HomeContentGrid: View {
    var vm: HomeVM
    
    var homeTopSelection: HomeTopRow
    var genreSelection: HomeGenre
    
    @Binding var movieDetailToShow: Movie? //<-- bindings match state! so if state "has ?" - so is binding
    
    var body: some View {
        ForEach(vm.allCategories, id: \.self) { categogy in
            VStack {
                HStack {
                    Text(categogy)
                        .font(.title3)
                        .bold()
                    
                    Spacer()
                }
                .padding(.leading, 6)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(vm.getMovie(forCat: categogy, andHomeRow: homeTopSelection, andGenre: genreSelection)) {
                            movie in
                            StandartHomeMovie(movie: movie)
                                .frame(width: 150, height: 225)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        movieDetailToShow = movie
                                    }
                                }
                        }
                    }
                }
            }
        }
    }
}

#Preview { //just modify preview for a conviniance
    
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        
        ScrollView {
            HomeContentGrid(vm: HomeVM(), homeTopSelection: .home, genreSelection: .AllGenres, movieDetailToShow: .constant(exampleMovie1))
        }
        .foregroundColor(.white)
    }
}
