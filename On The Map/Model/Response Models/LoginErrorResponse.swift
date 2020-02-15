//
//  ErrorResonse.swift
//  On The Map
//
//  Created by Hassan on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation
struct  LoginErrorResponse:Codable {
    let status:Int
    let error:String
    
    
    
    
}
extension LoginErrorResponse:LocalizedError{
    var errorDescription: String?{
         print ("The error is : \(error)")
        return error
       
    }
    
    var localizedDescription: String?{
        return error
    }
}

