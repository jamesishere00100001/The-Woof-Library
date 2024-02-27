//
//  ImageView.swift
//  The Woof Library
//
//  Created by James Attersley on 22/02/2024.
//

import SwiftUI

struct ImageView: View {
    
    @State private var fullScreenImage : Bool = false
    @State private var selectedImageURL: URL?
    @Binding var breed: String
    @Binding var urls : [URL]
    @Binding var size : CGSize
    
    private var sizeW: CGFloat { size.width / 100 * 47 }
    
    func didDismiss() {
        fullScreenImage = false
    }
    
    var body: some View {
        ForEach(urls, id: \.self) { url in
            AsyncImage(url: url) { image in
                image.resizable()
                    .scaledToFill()
                    .onTapGesture {
                        selectedImageURL = url
                        self.fullScreenImage.toggle()
                    }
            } placeholder: {
                ProgressView()
            }
            .fullScreenCover(isPresented: $fullScreenImage) {
                DogDetailView(breed: $breed, fullScreenImage: $fullScreenImage, selectedImageURL: $selectedImageURL, size: $size)
            }
            .frame(width: sizeW, height: sizeW)
            .clipShape(ButtonBorderShape.roundedRectangle)
            .overlay(ButtonBorderShape.roundedRectangle.stroke(Color("frameColor"), lineWidth: 2))
        }
    }
}

//#Preview {
//    ImageView()
//}
