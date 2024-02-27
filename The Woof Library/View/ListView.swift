//
//  ListView.swift
//  The Woof Library
//
//  Created by James Attersley on 21/02/2024.
//

import SwiftUI

struct ListView: View {
    
    @State private var results = [Result]()
    @State private var network = Networking()
    @State private var searchString: String = ""
    @State var method  = Methods()
    
    private var breedStrings: [String] {method.generateBreedStrings(from: results)}
    private var search: [String] {
        if searchString.isEmpty {
            return breedStrings
        } else {
            return breedStrings.filter {$0.contains(searchString)}
        }
    }
    
    var body: some View {
            NavigationStack {
                List {
                    ForEach(search, id: \.self) { string in
                        NavigationLink(string, destination: DogView(breed: string))
                            .font(.headline)
                    }
                    .listRowBackground(Color("listColor"))
                    .listRowSeparatorTint(Color("frameColor"))
                }
                .scrollContentBackground(.hidden)
                .background(Color("backgroundColor"))
                .task {
                    await results = network.loadListData()
                }
                .navigationTitle("The Woof Library")
            }
            .tint(Color("textColor"))
            .searchable(text: $searchString)
            .overlay {
                if search.isEmpty {
                    ContentUnavailableView.search(text: searchString)
                }
        }
    }
}

#Preview {
    ListView()
}
