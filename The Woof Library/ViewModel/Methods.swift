//
//  Methods.swift
//  The Woof Library
//
//  Created by James Attersley on 26/02/2024.
//

import Foundation

struct Methods {
    
    func generateBreedStrings(from data: [Result]) -> [String] {
        
        var strings: [String] = []
        
        for result in data {
            for breedName in result.message.keys {
                let subBreeds = result.message[breedName, default: []]
                if subBreeds.isEmpty {
                    strings.append(breedName.capitalized)
                } else {
                    for subBreed in subBreeds {
                        strings.append("\(subBreed.capitalized) \(breedName.capitalized)")
                    }
                }
            }
        }
        return strings.sorted()
    }
    
    func imageURLString(selectedBreed: String) -> String {
        
        let imageUrl = "https://dog.ceo/api/breed/\(selectedBreed)/images/random/10"
        return imageUrl
    }
    
    func selectedBreedString(breed: String) -> String {
        if breed.contains(" ") {
            let splitString = breed.components(separatedBy: " ")
            let w0 = splitString[0].lowercased()
            let w1 = splitString[1].lowercased()
            
            return ("\(w1)/\(w0)")
        } else {
            return breed.lowercased()
        }
    }
    
    func createImageURLs(data: [ImageResult]) -> [URL] {
        
        var urls: [URL] = []
        for message in data {
            for string in message.message {
                if let url = URL(string: string) {
                    urls.append(url)
                }
            }
        }
        return urls
    }
}
