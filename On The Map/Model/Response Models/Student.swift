//
//  Student.swift
//  On The Map
//
//  Created by Hassan on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation
import UIKit
struct  Student:Codable {
    static var allStudents = [Student]()
    
    let createDate:String
    let firstName:String
    let lastName:String
    let latitude:Double
    let longitude:Double
    let mapString:String
    let mediaURL:String
    let objectID:String
    let uniqueKey:String
    let updatedDate:String
    
    enum CodingKeys:String , CodingKey{
        case createDate =  "createdAt"
        case firstName
        case lastName
        case latitude
        case longitude
        case mapString
        case mediaURL
        case objectID =  "objectId"
        case uniqueKey
        case updatedDate =  "updatedAt"
    }
    
    
  
   
    
}
