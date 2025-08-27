//
//  DownloadsView.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2024/12/30.
//

import SwiftUI

struct DownloadsView: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 1) {
                HStack() {
                    Image(systemName: "info.circle")
                    Text("Smart Downloads")
                    Text("ON")
                        .foregroundStyle(.blue)
                    Spacer()
                }
                .padding()
                .bold()

                
                ZStack {
                    Circle()
                        .foregroundColor(.graySearchBackground)
                        .frame(width: 175)
                    Image(systemName: "arrow.down.to.line.alt")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70)
                        .foregroundColor(.graySearchText)
                }
                .padding(.top, 100)
                .padding(.bottom, 30)
                //TO DO: add vstack and spacing?
                Text("Never be without Netflix")
                    .font(.title2)
                    .bold()
                    .padding(.vertical, 14)
                
                Text("Download shows and movies so you`ll newer be without something to watch - even when you`re offline.")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 15)
                    .padding(.bottom, 40)

                //TO DO: rectangle button
                Button {
                    //
                } label: {
                    Text("See What You Can Download")
                        .foregroundStyle(.black)
                        .padding()
                        .bold()
                        .background(.white)
                }
                Spacer()
            }
            .foregroundColor(.white)
        }
       
    }
}

#Preview {
    DownloadsView()
}
