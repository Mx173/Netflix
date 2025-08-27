//
//  PagerView.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/30.
//

import SwiftUI

struct PagerView<Content: View>: View {
    
    let pageCount: Int
    @Binding var currentIndex: Int //current page
    @Binding var translation: CGFloat //current offset
    let content: Content
    
    init(pageCount: Int, currentIndex: Binding<Int>, translation: Binding<CGFloat>, @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex //why "_"
        self._translation = translation
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                
                HStack(spacing: 0) {
                    self.content //TO DO: self??
                        .frame(width: geo.size.width)
                }
                .frame(width: geo.size.width, alignment: .leading)
                .offset(x: -CGFloat(self.currentIndex) * geo.size.width)
                .offset(x: self.translation)
                .animation(.interactiveSpring)
                .gesture(DragGesture()
                    .onChanged({ value in
                        translation = value.translation.width
                    })
                    .onEnded({ value in
                        //option1
//                        let offset = value.translation.width / geo.size.width
//                        let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
//                        currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
                        
                        //option2
                        currentIndex = min(pageCount - 1, max(0, currentIndex + (-translation > geo.size.width / 2 ? 1 : (translation > geo.size.width / 2 ? -1 : 0))))
                        
                        //less "))))"
//                        currentIndex = min(max(currentIndex + (-translation > geo.size.width / 2 ? 1 : (translation > geo.size.width / 2 ? -1 : 0)), 0), pageCount - 1)
                        
                        translation = 0
                    })
                         
                    
                )
                
                
// Debug swipes
//                VStack {
//                    Text(String(Double(self.translation)))
//                    Text("indx \(String(self.currentIndex))")
//                }
                
            }
            
            
            
        }
    }
}

struct DummyView: View {
    @State private var currentIndex: Int = 0
    @State private var translation: CGFloat = .zero
    var body: some View {
        PagerView(pageCount: 3, currentIndex: $currentIndex, translation: $translation) {
            Color.red
            Color.orange
            Color.indigo
        }
    }
}


#Preview {
    DummyView()
}
