//
//  The_Woof_LibraryTests.swift
//  The Woof LibraryTests
//
//  Created by James Attersley on 25/02/2024.
//

import XCTest
@testable import The_Woof_Library

final class The_Woof_LibraryTests: XCTestCase {
    
    let listView = ListView()
    let dogView  = DogView(breed: "")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testGenerateStrings() {
        let resultExample = Result(message: ["spaniel" : ["cocker"]])
        
        XCTAssertEqual(listView.method.generateBreedStrings(from: [resultExample]) , ["Cocker Spaniel"], "String from JSON data conversion failed.")
    }
    
    func testStringForImageURL() {
        let listStringExample = "French Bulldog"
        
        XCTAssertEqual(dogView.method.selectedBreedString(breed: listStringExample), "bulldog/french", "List display String to image URL search String incorrect.")
    }
    
    func testImageURLGeneration() {
        let imageResultExample = ImageResult(message: ["https://testURLString/imageResultExample"])
        
        XCTAssertEqual(dogView.method.createImageURLs(data: [imageResultExample]), [URL(string: "https://testURLString/imageResultExample")], "ImageResult to URLs conversion failed.")
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
