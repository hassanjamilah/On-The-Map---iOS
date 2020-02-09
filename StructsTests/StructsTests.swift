//
//  StructsTests.swift
//  StructsTests
//
//  Created by user on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import XCTest
@testable import On_The_Map
class StructsTests: XCTestCase {
    let decoder = JSONDecoder()
    
    //MARK: JSON Samples
    let sessionJson = """
    {
    "account": {
    "registered": true,
    "key": "229280196734"
    },
    "session": {
    "id": "1481126810Se002636a0cb7acd24e76872a915ae725",
    "expiration": "2020-02-09T11:04:31.056664Z"
    }
    }
    """.data(using: .utf8)!
    
    
    let udacityAccountJson = """
    {
        "udacity": {
            "username": "account@domain.com",
            "password": "1234"
        }
    }
    """.data(using: .utf8)!
    
    
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testSessionFromUdacityStruct(){
        
        do {
            let result = try decoder.decode(SessionFromUdacity.self, from: sessionJson)
        }catch{
            XCTFail("Fail in parsing the session from json : \(error.localizedDescription)")
        }
    }
    
    func testUdacityAccountStruct(){
        do {
            let result = try decoder.decode(PostSessionFromUdacityBody.self, from: udacityAccountJson)
            print ("Succeeded \(result)")
        }catch{
            XCTFail("Fail in parsing the session from json : \(error.localizedDescription)")
        }
    }
    
}
