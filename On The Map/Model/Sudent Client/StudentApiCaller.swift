//
//  StudentApiCaller.swift
//  On The Map
//
//  Created by user on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation

class StudentApiCaller{
    
    //MARK: Get Students
    /**
     
     This funciton is used to get the students info from the api
     */
    class  func getStudents (limit:Int , skip:Int , order:String  , uniqueKey:String , completion:@escaping([Student] ,URLResponse, Error?)->Void){
        let url:URL = StudentClient.EndPoints.studentLocation(limit, skip, order, uniqueKey).url
        _ = StudentClient.taskForGetRequest(url: url, responseType: [String:[Student]].self) { (data,response , error) in
            DispatchQueue.main.async {
                
                guard let data = data else {
                    print (StudentClient.ErrorMsgs.errorParsingData(" in get Studendts for error : \(String(describing: error))"))
                    completion([] ,response, error)
                    return
                }
                if let finalData = data["results"]{
                    completion(finalData , response , nil)
                }else {
                    completion([] , response , nil)
                }
            }
            
        }
        
    }
    
    
    //MARK: Post new student
    /**
     Used to insert new student in the api
     */
    class func postNewStudent(student:Student , completion:@escaping(PostStudentResponse? , URLResponse? , Error?)->Void){
        let url:URL = StudentClient.EndPoints.postStudentInfo.url
        let uniqueKey  = "\(Int.random(in: 1...1000000))"
        let body = PostStudentBody(uniqueKey: uniqueKey, firstName: student.firstName, lastName: student.lastName, mapString: student.mapString, mediaURL: student.mediaURL, latitude: student.latitude, longitude: student.longitude)
        
        StudentClient.taskForPostRequest(url: url, body: body, responseType: PostStudentResponse.self, isEncodedData: false) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    completion(data , response , nil)
                }else {
                    completion(nil , response , error)
                }
            }
            
        }
        
    }
    
    
    
    //MARK: Modify student data
    /**
     
     */
    class func ModifyStudent(student:Student , completion:@escaping(ModifyStudentResponse? , URLResponse? , Error?)->Void){
        let url:URL = StudentClient.EndPoints.modifyStudentInfo(student.objectID).url
        let body = PostStudentBody(uniqueKey: student.uniqueKey, firstName: student.firstName, lastName: student.lastName, mapString: student.mapString, mediaURL: student.mediaURL, latitude: student.latitude, longitude: student.longitude)
        
        StudentClient.taskForPutRequest(url: url, body: body, responseType: ModifyStudentResponse.self) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data{
                    completion(data , response , nil)
                }else {
                    completion(nil , response , error)
                }
            }
            
        }
        
    }
    
    
    //MARK: Get new Udacity Session
    /**
     Get a new session form the Udacity API
     */
    class func getNewSession( userName:String ,  password:String , completion:@escaping(Bool , URLResponse? , Error?)->Void){
        let url = StudentClient.EndPoints.postNewSession.url
        let accountInfo = PostSessionFromUdacityBody.AccountInfo(userName: userName, password: password)
        let body = PostSessionFromUdacityBody(udacity: accountInfo)
        StudentClient.taskForPostRequest(url: url ,  body: body, responseType: SessionFromUdacity.self, isEncodedData: true) { (data, response, error) in
            DispatchQueue.main.async {
                if data != nil {
                    completion(true , response , nil)
                }else {
                    completion(false , response , nil )
                }
            }
            
        }
    }
    
    
    //MARK: Get User Info
    /**
     Get the user info from the udacity api
     */
    class func getUserInfo( userId:String , completion:()->Void ){
        
    }
}
