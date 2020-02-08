//
//  StudentClient.swift
//  On The Map
//
//  Created by user on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation

class  StudentClient {
    
    
    
    enum EndPoints{
        static let baseURL = "https://onthemap-api.udacity.com"
        
        case studentLocation
        
        var queryString:String{
            switch self {
            case .studentLocation:
                return ""
            }
            
        }
        
        var url:URL{
            return URL(string: queryString)!
        }
    }
    
    
    class func taskForGetRequest<ResponseType: Decodable>(url:URL ,  responseType:ResponseType.Type , completionHandler:@escaping(ResponseType? , Error?)->Void  )->URLSessionTask{
        
        return URLSession.shared.dataTask(with: url)
    }
    
    
    
    class func taskForPostRequest<ResponseType: Decodable , RequestType:Encodable>(url:URL , body:RequestType , responseType:ResponseType.Type , completionHandler:@escaping(ResponseType? , Error?)->Void)->URLSessionTask{
        return URLSession.shared.dataTask(with: url)
    }
    
 
    class func taskForPutRequest<ResponseType:Decodable , RequestType:Encodable>(url:URL , body:RequestType , responseType:ResponseType.Type , completionHandler:(ResponseType? , Error?)->Void)->URLSessionTask{
        return URLSession.shared.dataTask(with: url)
    }
    
    class func taskForDeleteRequest<ResponseType:Decodable , RequestType:Encodable>(url:URL , body:RequestType , responseType:ResponseType.Type , completionHandler:(ResponseType? , Error?)->Void)->URLSessionTask{
        return URLSession.shared.dataTask(with: url)
    }
}
