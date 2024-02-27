//
//  The_Woof_LibraryUITests.swift
//  The Woof LibraryUITests
//
//  Created by James Attersley on 25/02/2024.
//

import XCTest
@testable import The_Woof_Library

final class The_Woof_LibraryUITests: XCTestCase {

    override func setUpWithError() throws {
     
        continueAfterFailure = false
    }

    func testHappyPath() {
        let app = XCUIApplication()
        app.launch()
        
        let listView = app.collectionViews
        XCTAssertTrue(listView.element.exists, "ListView not loading.")
        
        let australianCattleDogItem = app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["Australian Cattledog"]/*[[".cells",".buttons[\"Australian Cattledog\"].staticTexts[\"Australian Cattledog\"]",".staticTexts[\"Australian Cattledog\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(australianCattleDogItem.waitForExistence(timeout: 3), "Austrailian Cattledog breed item not loading.")
        
        australianCattleDogItem.tap()
        
        let firstBreedImage = app.scrollViews.children(matching: .other).element(boundBy: 0).children(matching: .other).element
        XCTAssertTrue(firstBreedImage.waitForExistence(timeout: 3), "First breed image not displaying.")
        
        let breedNavTitle = app.navigationBars["Australian Cattledog"].staticTexts["Australian Cattledog"]
        XCTAssertTrue(breedNavTitle.exists, "Breed nav title not displaying.")
        
        firstBreedImage.tap()
        
        let fullScreenImage = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .image).element(boundBy: 0)
        XCTAssertTrue(fullScreenImage.waitForExistence(timeout: 3), "Full screen image not displaying on tap.")
        
        fullScreenImage.tap()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
