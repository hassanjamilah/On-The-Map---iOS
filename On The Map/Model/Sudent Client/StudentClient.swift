//
//  StudentClient.swift
//  On The Map
//
//  Created by user on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation

class  StudentClient {
    
    //MARK: Error Messages
    enum ErrorMsgs{
        case errorParsingData(String)
        case errorParsingJson(String)
        case success(String)
        
        var finalMsg:String{
            switch self {
            case .errorParsingData(let msg):
                return "Error in getting the data : \(msg)"
            case .errorParsingJson(let msg):
                return "Error in parsing the json from data : \(msg)"
            case .success(let msg):
                return "The request finished successfully \(msg)"
            }
        }
        
        
    }
    
    
    //MARK: The Endpoints enumeration
    enum EndPoints{
        static let baseURL = "https://onthemap-api.udacity.com/v1"
        
        case studentLocation (Int , Int , String , String)
        case postStudentInfo
        case modifyStudentInfo(String)
        case postNewSession
        case deleteSession
        case getUserInfo(String)
        case udacitySignUp
        
        var queryString:String{
            switch self {
            case .studentLocation(let limit  ,let escape ,let order ,let uniqueKey):
                var query = ""
                if limit != 0 {
                    query += "limit=\(limit)"
                }
                if escape != 0 {
                    query += "&skip=\(escape)"
                }
                query += "&order=\(order)"
                query += "&uniqueKey=\(uniqueKey)"
                
                if query.starts(with: "&"){
                    let startIndex = query.index(query.startIndex, offsetBy: 1)
                    let endIndex = query.index (query.startIndex , offsetBy: query.count )
                    let query1 = query[startIndex..<endIndex]
                    return EndPoints.baseURL + "/StudentLocation?\(query1)"
                }else {
                    return EndPoints.baseURL + "/StudentLocation?\(query)"
                }
                
                
            case .postStudentInfo:
                return EndPoints.baseURL + "/StudentLocation"
                
            case .modifyStudentInfo(let objectID):
                return EndPoints.baseURL + "/StudentLocation/\(objectID)"
                
            case .postNewSession:
                return EndPoints.baseURL + "/session"
            
            case .deleteSession:
                return EndPoints.baseURL + "/session"
            
            case .getUserInfo(let userID):
                return EndPoints.baseURL + "/users/\(userID)"
            case .udacitySignUp:
                return "https://auth.udacity.com/sign-up?next=https://classroom.udacity.com/authenticated"
            
            }
            
            
            
            
            
            
        }
        
        var url:URL{
            return URL(string: queryString)!
        }
    }
    
    
    class func taskForGetRequest<ResponseType: Decodable>(url:URL ,  responseType:ResponseType.Type , completionHandler:@escaping(ResponseType? ,URLResponse , Error?)->Void  )->URLSessionTask{
        print ("The url for the get request is : \(url)")
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print (ErrorMsgs.errorParsingData(error!.localizedDescription))
                DispatchQueue.main.async {
                    
                    completionHandler(nil ,response! ,  error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(ResponseType.self, from: data)
                print (ErrorMsgs.success(" in get request and reponse \(ResponseType.Type.self)"))
                DispatchQueue.main.async {
                    
                    completionHandler(result , response! , nil)
                }
                
            }catch{
                print (ErrorMsgs.errorParsingJson(" for type \(ResponseType.Type.self) with error \(error.localizedDescription)"))
                DispatchQueue.main.async {
                    
                    completionHandler(nil ,response! ,  error)
                }
            }
        }
        
        task.resume()
        
        return task
    }
    
    
    
    class func taskForPostRequest<ResponseType: Decodable , RequestType:Encodable>(url:URL , body:RequestType , responseType:ResponseType.Type , isEncodedData:Bool , completionHandler:@escaping(ResponseType? ,URLResponse? ,  Error?)->Void)->URLSessionTask{
        
        print ("The url for the post request is : \(url)")
        var request = URLRequest(url: url)
        request.addValue("applicaiton/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod="POST"
        do{
            let requestBody = try JSONEncoder().encode(body)
            request.httpBody = requestBody
        }catch{
            print (ErrorMsgs.errorParsingJson("For type : \(RequestType.Type.self) with error : \(error.localizedDescription)"))
            DispatchQueue.main.async {
                completionHandler(nil , nil , error)
            }
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print (ErrorMsgs.errorParsingData(" for type : \(ResponseType.Type.self) with error : \(error!.localizedDescription)"))
                completionHandler(nil , response , error)
                return
            }
            do{
                var newData:Data
                if isEncodedData{
                     newData = data.subdata(in: (5..<data.count))
                }else {
                    newData  = data
                }
                let result  = try JSONDecoder().decode(ResponseType.self, from:newData )
                completionHandler(result , response , nil)
                print (ErrorMsgs.success("in type : \(ResponseType.Type.self) \(result)"))
            }catch{
                if  let newError = try? JSONDecoder().decode(ErrorRespons.self, from: data){
                    completionHandler(nil , response , newError)
                }else {
                    let stringData = String(data: data , encoding: .utf8)!
                    print (ErrorMsgs.errorParsingJson(" in type :\(ResponseType.Type.self) with erorr : \(error.localizedDescription) data is : \(stringData)"))
                    completionHandler(nil , response , error)
                }
                
            }
        }
        task.resume()
        return task
        
    }
    
    
    class func taskForPutRequest<ResponseType:Decodable , RequestType:Encodable>(url:URL , body:RequestType , responseType:ResponseType.Type , completionHandler:@escaping(ResponseType? ,URLResponse?  , Error?)->Void)->URLSessionTask{
        var request = URLRequest(url: url)
        request.httpMethod="PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do{
            let body = try JSONEncoder().encode(body)
            request.httpBody = body
        }catch{
            print (ErrorMsgs.errorParsingJson("for type \(RequestType.Type.self)"))
            completionHandler(nil , nil , error)
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print (ErrorMsgs.errorParsingData("in type : \(ResponseType.Type.self)"))
                completionHandler(nil , response , error)
                return
            }
            do{
                let dataResult = String(data: data, encoding: .utf8)!
                print ("The data is : \(dataResult)")
                let result = try? JSONDecoder().decode(ResponseType.self, from: data)
                completionHandler(result , response , nil )
            }catch{
                print(ErrorMsgs.errorParsingJson( "in tyep :\(ResponseType.Type.self) with error : \(error.localizedDescription)"))
                completionHandler(nil , response , error)
                
            }
            
        }
        
        task.resume()
        return task
    }
    
    class func taskForDeleteRequest<ResponseType:Decodable , RequestType:Encodable>(url:URL , body:RequestType , responseType:ResponseType.Type , completionHandler:@escaping(ResponseType? , URLResponse?  ,   Error?)->Void)->URLSessionTask{
        
        var request = URLRequest(url: url)
        request.httpMethod="DELETE"
        
        var xsrfCookie:HTTPCookie? = nil
        let cookieStorage = HTTPCookieStorage.shared
        for cookie in cookieStorage.cookies!{
            if cookie.name == "XSRF-TOKEN" {
                xsrfCookie  = cookie
            }
        }
        
        if let xsrfCookie = xsrfCookie {
            request.setValue(xsrfCookie.value, forHTTPHeaderField: "X-XSRF-TOKEN")
        }
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(nil , response , error)
            }else {
                
                let newData = data?.subdata(in: (5..<data!.count))
                print (String(data:newData! , encoding: .utf8)!)
            }
        }
        
        task.resume()
        return task
    }
    
    
    class func  getCompletionHandlerInMainThread<ResponseType: Decodable>(handler:(ResponseType? , URLResponse? , Error?)->Void){
        
    }
    
    
    
    
}
