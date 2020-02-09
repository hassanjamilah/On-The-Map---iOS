//
//  PostStudentBody.swift
//  On The Map
//
//  Created by Hassan on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation

struct PostStudentBody:Codable {
    /*  //request.httpBody = "{\"uniqueKey\": \"1234\",
     \"firstName\": \"John\",
     \"lastName\": \"Doe\",
     \"mapString\": \"Mountain View, CA\",
     \"mediaURL\": \"https://udacity.com\"
     ,\"latitude\": 37.386052,
     \"longitude\": -122.083851}".data(using: .utf8)
     */
    let uniqueKey:String
    let firstName:String
    let lastName:String
    let mapString:String
    let mediaURL:String
    let latitude:Double
    let longitude:Double
    
    enum CodingKeys:String , CodingKey{
        case uniqueKey = "uniqueKey"
        case firstName
        case lastName
        case mapString
        case mediaURL
        case latitude
        case longitude
    }
}
