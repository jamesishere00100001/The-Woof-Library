//
//  DogDetailView.swift
//  The Woof Library
//
//  Created by James Attersley on 23/02/2024.
//

import SwiftUI

struct DogDetailView: View {
    
    @Binding var breed           : String
    @Binding var fullScreenImage : Bool
    @Binding var selectedImageURL: URL?
    @Binding var size            : CGSize
    
    func didDismiss() {
        fullScreenImage = false
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(uiImage: UIImage(named: "imageBackground")!)
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                VStack {
                    AsyncImage(url: selectedImageURL) { image in
                        image.resizable()
                            .scaledToFill()
                            .onTapGesture {
                                didDismiss()
                            }
                    } placeholder: {
                        ProgressView()
                            .onTapGesture {
                                didDismiss()
                            }
                    }
                    .frame(width: size.width, height: size.width)
                    .background(Color.clear)
                }
            }
        .navigationTitle(breed)
        }
    }
}

//#Preview {
//    DogDetailView()
//}
