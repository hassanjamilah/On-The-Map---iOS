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
    
    
  //MARK: Post new student
    /**
     Used to insert new student in the api
     */
    class func postNewStudent(student:Student , completion:@escaping(PostStudentResponse? , URLResponse? , Error?)->Void){
        let url:URL = StudentClient.EndPoints.postStudentInfo.url
        let uniqueKey  = "\(Int.random(in: 1...1000000))"
        let body = PostStudentBody(uniqueKey: uniqueKey, firstName: student.firstName, lastName: student.lastName, mapString: student.mapString, mediaURL: student.mediaURL, latitude: student.latitude, longitude: student.longitude)
        
        
        StudentClient.taskForPostRequest(url: url, body: body, responseType: PostStudentResponse.self) { (data, response, error) in
            if let data = data {
              
                    completion(data , response , nil)
                    
               
            }else {
                completion(nil , response , error)
            }
        }
            
        
    }
    
}
