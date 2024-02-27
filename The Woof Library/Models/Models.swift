//
//  Models.swift
//  The Woof Library
//
//  Created by James Attersley on 21/02/2024.
//
import SwiftUI

struct Result: Codable, Hashable {
    
    var message: [String : [String]]
}

struct ImageResult: Codable, Hashable {
    
    var message: [String]
}


