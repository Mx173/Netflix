//
//  PreviewView.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/31.
//

import SwiftUI
import VideoPlayer

struct PreviewView: View { //TO DO: struct vs class
    
    @ObservedObject var vm: PreviewVM
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            TrailerPlayerView(videoURL: vm.movie.trailers.first?.videoUrl, playVideo: .constant(false))
        }
    }
}

#Preview {
    PreviewView(vm: PreviewVM(movie: exampleMovie1))
}
