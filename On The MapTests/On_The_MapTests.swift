//
//  On_The_MapTests.swift
//  On The MapTests
//
//  Created by user on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import XCTest
@testable import On_The_Map
class On_The_MapTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testGetAllStudents(){
        let promise = expectation(description: "Call succeeded")
        Student.getStudents(limit: 10, skip: 0, order: "", uniqueKey: "") { (students,response, error) in
            if let error = error {
                XCTFail("Error : \(error.localizedDescription)")
            }else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 && students.count == 10{
                    promise.fulfill()
                }else {
                    XCTFail("Error in getting response : \(statusCode)")
                }
            }
            
        }
        wait(for: [promise], timeout: 5)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
