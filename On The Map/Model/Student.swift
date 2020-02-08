//
//  Student.swift
//  On The Map
//
//  Created by user on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation

struct Student:Codable {
   /* let data:String =  " {\"results\":[{
                \"createdAt\" : \"2015-02-25T01:10:38.103Z\",
                "firstName\": \"Jarrod\",
                "lastName\": \"Parkes\",
                "latitude\": 34.7303688,
                "longitude\": -86.5861037,
                "mapString\": \"Huntsville, Alabama \",
                "mediaURL\": \"https://www.linkedin.com/in/jarrodparkes\",
                "objectId\": \"JhOtcRkxsh\",
                "uniqueKey\": \"996618664\",
                "updatedAt\": \"2015-03-09T22:04:50.315Z\"}]}"*/
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
