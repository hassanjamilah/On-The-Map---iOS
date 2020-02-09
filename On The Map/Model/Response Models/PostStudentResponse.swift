//
//  PostStudentResponse.swift
//  On The Map
//
//  Created by Hassan on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation
struct  PostStudentResponse:Codable {
    let objectID:String
    let createdAt:String
    
    enum CodingKeys:String , CodingKey{
        case objectID = "objectId"
        case createdAt
    }
}
