//
//  DogView.swift
//  The Woof Library
//
//  Created by James Attersley on 21/02/2024.
//

import SwiftUI

struct DogView: View {
    
    @State private var imageResult = [ImageResult]()
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: 2 )
    @State private var network     = Networking()
    @State var method  = Methods()
    @State var size    = CGSize()
    @State var URLs    : [URL] = []
    @State var breed   : String
    
    
    private var selectedBreed  : String {method.selectedBreedString(breed: breed)}
    private var breedURLString : String {method.imageURLString(selectedBreed: selectedBreed)}
    private var imageURLs      : [URL] {method.createImageURLs(data: imageResult)}
    
    var body: some View {
        ZStack {
            Color("backgroundColor").ignoresSafeArea()
            GeometryReader { proxy in
                NavigationStack {
                    ScrollView {
                        LazyVGrid(columns: gridColumns) {
                            ImageView(breed: $breed, urls: $URLs, size: $size)
                        }
                    }
                    .task {
                        await imageResult = network.loadImageData(breedURLString: breedURLString)
                        self.URLs = imageURLs
                    }
                    .navigationTitle(breed)
                    .onAppear { self.size = proxy.size }
                }
            }
            .safeAreaPadding(.all)
        }
    }
}

#Preview {
    NavigationStack {
        DogView(breed: "Cocker Spaniel")
    }
}
