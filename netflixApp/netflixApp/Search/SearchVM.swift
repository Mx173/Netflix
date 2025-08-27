//
//  SearchVM.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/23.
//

import Foundation

class SearchVM: ObservableObject { //obs - basic setup for vm
    
    @Published var isLoding: Bool = false //observable
    
    @Published var viewState: ViewState = .ready
    
    @Published var popularMovies: [Movie] = []
    @Published var searchResults: [Movie] = []
    
    @Published var isShowingPopularMovies = true
    
    init() {
        getPopularMovies()
    }
    
    func updateSearchText(with text: String) {
        setViewState(to: .loading)
        //check without it
        if text.count > 0 {//
            isShowingPopularMovies = false//
            getSearchResults(for: text)
        } else {//
            isShowingPopularMovies = true//
        }//
        
    }
    
    private func getPopularMovies() {
        self.popularMovies = generateMovies(40)
    }
    
    private func getSearchResults(for text: String) {
        //simulating request to server
        let haveResult = Int.random(in: 0...3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if haveResult == 0 {
                //empty view
                self.searchResults = []
                self.setViewState(to: .empty)
            } else {
                //ready view
                let movies = generateMovies(21)
                self.searchResults = movies
                self.setViewState(to: .ready)
            }
        }
    }
    
    private func setViewState(to state: ViewState) {
        DispatchQueue.main.async { //main thread for UI changes(spinner etc.)
            self.viewState = state
            self.isLoding = state == .loading//???
        }
    }
}

enum ViewState { //good thing to do for VMs
    case empty
    case loading
    case ready
    case error
}
