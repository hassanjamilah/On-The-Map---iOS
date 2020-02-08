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
        StudentApiCaller.getStudents(limit: 10, skip: 0, order: "", uniqueKey: "") { (students,response, error) in
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
    
    //MARK: Test posting new Student
    func testPostNewStudent(){
        let promise = expectation(description: "Status code = 200")
        let  st = Student(createDate: "", firstName: "F1", lastName: "L1", latitude: 2.34332, longitude: 3.34343, mapString: "KL", mediaURL: "https://wwww.google.com", objectID: "", uniqueKey: "", updatedDate: "")
        StudentApiCaller.postNewStudent(student: st) { (studentResponse, response, error) in
            if let error = error {
                XCTFail("Error in posting \(error)")
            }else
            if let studentResponse = studentResponse {
                promise.fulfill()
                print ("Success in response \(studentResponse)")
            }else {
                XCTFail("Error in response of posting")
            }
        }
        wait(for: [promise], timeout: 5)
    }

    
    //MARK: Testing Modifying student data
    func testModifyStudentData(){
        let promise = expectation(description: "Success in modifying data")
        let  st = Student(createDate: "", firstName: "F1", lastName: "L1", latitude: 2.34332, longitude: 3.34343, mapString: "KL", mediaURL: "https://wwww.google.com", objectID: "bov74c3k6uphjft1aplg", uniqueKey: "", updatedDate: "")
        StudentApiCaller.ModifyStudent(student: st) { (result, response, error) in
            if let error = error {
                XCTFail("Error in modifying student \(error.localizedDescription)")
            }else {
                print( "Success with result \(result)")
                promise.fulfill()
            }
        }
        wait(for: [promise], timeout: 5)
    }
    

    //MARK: Check if Student modification applied on the Server
    func testIfModificationAppliedOnServer(){
    
    }
    
    
    //MARK: Test Getting a new Session
    func testGettingNewSession(){
        let promise = expectation(description: "Session created successfully.")
        StudentApiCaller.getNewSession(userName: "hassanjamilahj@outlook.com", password: "gugq849n") { (result, response, error) in
               if let error = error {
                   XCTFail("Failed to get Session \(error)")
               }else {
                   promise.fulfill()
               }
           }
        wait(for: [promise], timeout: 5)
    }
    
   
    

}
