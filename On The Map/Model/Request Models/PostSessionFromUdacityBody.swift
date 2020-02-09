//
//  PostSessionFromUdacityBody.swift
//  On The Map
//
//  Created by Hassan on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation
struct PostSessionFromUdacityBody:Codable{
    let udacity:AccountInfo
    
    
    struct AccountInfo:Codable{
        let userName:String
        let password:String
        
        enum CodingKeys:String , CodingKey{
            case userName = "username"
            case password
        }
    }
}


