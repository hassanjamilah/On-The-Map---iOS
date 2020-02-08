//
//  StudentClient.swift
//  On The Map
//
//  Created by user on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation

class  StudentClient {
    
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
    
    enum EndPoints{
        static let baseURL = "https://onthemap-api.udacity.com/v1"
        
        case studentLocation (Int , Int , String , String)
        case postStudentInfo
        
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
    
    
    
    class func taskForPostRequest<ResponseType: Decodable , RequestType:Encodable>(url:URL , body:RequestType , responseType:ResponseType.Type , completionHandler:@escaping(ResponseType? ,URLResponse? ,  Error?)->Void)->URLSessionTask{
        
        let url = EndPoints.postStudentInfo.url
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTask(with: url)
    }
    
    
    class func taskForPutRequest<ResponseType:Decodable , RequestType:Encodable>(url:URL , body:RequestType , responseType:ResponseType.Type , completionHandler:(ResponseType? , Error?)->Void)->URLSessionTask{
        return URLSession.shared.dataTask(with: url)
    }
    
    class func taskForDeleteRequest<ResponseType:Decodable , RequestType:Encodable>(url:URL , body:RequestType , responseType:ResponseType.Type , completionHandler:(ResponseType? , Error?)->Void)->URLSessionTask{
        return URLSession.shared.dataTask(with: url)
    }
    
   
    
    
   
}
