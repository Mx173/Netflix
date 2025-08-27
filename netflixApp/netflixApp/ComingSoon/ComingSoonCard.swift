//
//  ComingSoonCard.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/26.
//

import SwiftUI
import Kingfisher

struct ComingSoonCard: View {
    
    func isCategoryLast(_ cat: String) -> Bool { //TO DO: move it to helper mb and from topMoviePreview
        let catCount = movie.categories.count
        
        if let index = movie.categories.firstIndex(of: cat) {
            if index + 1 != catCount {
                return false
            }
        }
        return true
    }//mb move down?
    
    var movie: Movie
    
    @Binding var movieDetailToShow: Movie?
    
    let screen = UIScreen.main.bounds //TO DO: vs UIScreen().bounds
    let isHighlighted: Bool
    
    var body: some View {
        ZStack {
            VStack {
                VideoPreviewImage(imageURL: exampleImageURL2, videoURL: exampleVideoURL)
                    .frame(height: 200)
                    .clipped() 
                //like that?? ^^
                
                VStack {
                    HStack {
                        KFImage(movie.thumbnailUrl)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: screen.width / 3, height: screen.width / 5)
                            .clipped()
                        
                        Spacer()
                        
                        Button {
                            //
                        } label: {
                            VStack(spacing: 6) {
                                Image(systemName: "bell")
                                    .font(.title3)
                                Text("Remind Me")
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        
                        Button { //TO DO: use VerticalTextButton!
                            movieDetailToShow = movie
                        } label: {
                            VStack(spacing: 6) {
                                Image(systemName: "info.circle")
                                    .font(.title3)
                                Text("Info")
                                
                            }
                        }
                        .padding(.trailing, 24)
                    }
                    .font(.caption)
                }
                
                VStack(alignment: .leading) {
                    Text(movie.promotionalHeadline!)
                        .foregroundColor(.gray)
                        .font(.headline)
                        .bold()
                        .padding(.bottom, 1)
                    
                    Text(movie.name)
                        .font(.title2)
                        .bold()
                    
                    Text(movie.currentEpisodeDescription)
                        .foregroundColor(.gray)
                        .font(.headline)
                        .lineLimit(3)
                    
                    HStack {
                        Spacer()
                        ForEach (movie.categories, id: \.self) { category in
                            HStack {
                                Text(category)
                                    .font(.footnote)
                                
                                if !isCategoryLast(category) {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(.blue)
                                        .font(.system(size: 3))
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding(.vertical, 1)
                }
                .padding(.horizontal, 4)
            }
            .foregroundColor(.white)
            .padding(.bottom, 10)
            .shadow(radius: isHighlighted ? 10 : 0)
            
            if !isHighlighted {
                Color.black.opacity(0.8)
            }
        }
    }
}

#Preview {
    ComingSoonCard(movie: exampleMovie6, movieDetailToShow: .constant(nil), isHighlighted: true)
        .background(.black)
}
