//
//  ErrorResonse.swift
//  On The Map
//
//  Created by Hassan on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation
struct  ErrorRespons:Codable {
    let code:Int
    let error:String
    
    
    
    
}
extension ErrorRespons:LocalizedError{
    var errorDescription: String?{
        return error
    }
}
