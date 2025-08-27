//
//  TopMoviePreview.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2023/09/28.
//

import SwiftUI
import Kingfisher

struct TopMoviePreview: View {
    var movie: Movie
    
    func isCategoryLast(_ cat: String) -> Bool {
        let catCount = movie.categories.count
        
        if let index = movie.categories.firstIndex(of: cat) {
            if index + 1 != catCount {
                return false
            }
        }
        return true
    }
    
    var body: some View {
        
        ZStack {
            KFImage(movie.thumbnailUrl)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack {
                Spacer()
                HStack {
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
                }
                
                HStack {
                    Spacer()
                    VertIconTextButton(text: "My List",
                                       isOn: true,
                                       onStateIcon: "checkmark",
                                       offStateIcon: "plus") {
                        //
                    }
                    
                    Spacer()
                    
                    RectangleButton(text: "Play",
                                    iconName: "play.fill") {
                        //
                    }
                    .frame(width: 110)

                    Spacer()
                    
                    VertIconTextButton(text: "Info",
                                       isOn: false,
                                       onStateIcon: "info.circle",
                                       offStateIcon: "info.circle") {
                        //
                    }
                    Spacer()
                }
            }
            .background(LinearGradient.blackOpacityGradient
                .padding(.top, 250))
        }
        .foregroundColor(.white)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie6)
    }
}
