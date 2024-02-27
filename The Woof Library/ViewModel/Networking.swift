//
//  Networking.swift
//  The Woof Library
//
//  Created by James Attersley on 26/02/2024.
//

import Foundation

struct Networking {
    
    func loadListData() async -> [Result] {
        guard let url = URL(string: "https://dog.ceo/api/breeds/list/all") else {
            print("Failed to convert String to URL")
            return []
        }
        var result = [Result]()
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Result.self, from: data) {
                
              result = [Result(message: decodedResponse.message)]
            }
        } catch {
            print("Breed list network request failed")
        }
        return result
    }
    
    func loadImageData(breedURLString: String) async -> [ImageResult] {

        guard let url = URL(string: breedURLString) else {
            print("Failed to convert String to URL")
            return []
        }
        var imageResult = [ImageResult]()
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(ImageResult.self, from: data) {
                
                imageResult = [ImageResult(message: decodedResponse.message)]
            }
        } catch {
            print("Image list network request failed")
        }
        return imageResult
    }
    
}
