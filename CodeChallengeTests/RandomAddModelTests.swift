//
//  RandomAddModelTests.swift
//  CodeChallengeTests
//
//  Created by Tarun on 27/04/2021.
//

import XCTest
@testable import CodeChallenge

class RandomAddModelTests: XCTestCase {
    
    func testAddModel() {
        // Given
        let model = RandomAddModel.AddModel(adId: "TestId", title: "TestTitle", image: "testImage", priceAmount: 123)
        
        //Then
        XCTAssertEqual(model.adId,"TestId")
        XCTAssertEqual(model.title,"TestTitle")
        XCTAssertEqual(model.image,"testImage")
        XCTAssertEqual(model.priceAmount,123)
    }
    
    
    func testRandomAdvertisement() throws {
        //Given
        let randomAddTestsMock = RandomAddTestsMock()
        //When
        randomAddTestsMock.getRandomAdvertisement()
        //Then
        XCTAssertTrue(randomAddTestsMock.getRandomAdvertisementCalled)
    }
    
    func testGetRandomAdvertisement(){
        // Given
        let randomAdd = RandomAdd()
        let testModel = RandomAddModel.AddModel(adId: "TestId123", title: "TestTitle", image: "testImage", priceAmount: 123)
        
        randomAdd.$randomAdd.sink(receiveValue:  { value in
            guard  let adId = value.adId else {
                XCTFail("Received more values than expected.")
                return
            }
            XCTAssertEqual(adId, "Add123")
            guard  let title = value.title else {
                XCTFail("Received more values than expected.")
                return
            }
            XCTAssertEqual(title, "NoAdd")
            guard  let image = value.image else {
                XCTFail("Received more values than expected.")
                return
            }
            XCTAssertEqual(image, "")
            guard  let price = value.priceAmount else {
                XCTFail("Received more values than expected.")
                return
            }
            XCTAssertEqual(price, 000)
        })
        
        //When
        randomAdd.randomAdd = testModel
        
        //Then
        
        randomAdd.$randomAdd.sink(receiveValue:  { value in
            guard  let adId = value.adId else {
                XCTFail("Received more values than expected.")
                return
            }
            XCTAssertEqual(adId, "TestId123")
            guard  let title = value.title else {
                XCTFail("Received more values than expected.")
                return
            }
            XCTAssertEqual(title, "TestTitle")
            guard  let image = value.image else {
                XCTFail("Received more values than expected.")
                return
            }
            XCTAssertEqual(image, "testImage")
            guard  let price = value.priceAmount else {
                XCTFail("Received more values than expected.")
                return
            }
            XCTAssertEqual(price, 123)
        })
    }
    
}

/// Mock class to check get Advertisement method s
class RandomAddTestsMock: RandomAdd {
    var getRandomAdvertisementCalled = false
    override func getRandomAdvertisement(){
        getRandomAdvertisementCalled = true
    }
}


