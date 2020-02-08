//
//  Student.swift
//  On The Map
//
//  Created by user on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation

struct  Student:Codable {
    let json = """
   {"results":[{"firstName":"Foster","lastName":"Turcotte","longitude":100.5012893,"latitude":13.7539392,"mapString":"Bangkok","mediaURL":"https://www.google.com","uniqueKey":"21888362661","objectId":"ID10","createdAt":"2019-05-17T00:53:33.941Z","updatedAt":"2020-01-24T12:41:21.847Z"},{"firstName":"first name","lastName":"last name","longitude":39.8161028,"latitude":21.4029047,"mapString":"mecca","mediaURL":"aa","uniqueKey":"1234","objectId":"ID11","createdAt":"2019-05-17T00:53:33.961Z","updatedAt":"2019-05-17T00:53:33.961Z"},{"firstName":"John","lastName":"Doe","longitude":39.8161028,"latitude":21.4029047,"mapString":"Mountain View, CA","mediaURL":"https://udacity.com","uniqueKey":"1234","objectId":"ID12","createdAt":"2019-05-17T00:53:33.969Z","updatedAt":"2019-05-17T00:53:33.969Z"},{"firstName":"John","lastName":"Doe","longitude":-122.083851,"latitude":37.386052,"mapString":"Mountain View, CA","mediaURL":"https://udacity.com","uniqueKey":"1234","objectId":"ID13","createdAt":"2019-05-17T00:53:33.981Z","updatedAt":"2019-05-17T00:53:33.981Z"},{"firstName":"John","lastName":"Doe","longitude":37.42764249444008,"latitude":55.755697940622454,"mapString":"moscow","mediaURL":"didit","uniqueKey":"1234","objectId":"ID14","createdAt":"2019-05-17T00:53:33.984Z","updatedAt":"2019-05-17T00:53:33.984Z"},{"firstName":"John","lastName":"Doe","longitude":39.8161028,"latitude":21.4029047,"mapString":"Mountain View, CA","mediaURL":"https://udacity.com","uniqueKey":"1234","objectId":"ID9","createdAt":"2019-05-17T00:53:33.934Z","updatedAt":"2019-05-17T00:53:33.934Z"},{"firstName":"Alison","lastName":"Altenwerth","longitude":46.7070906,"latitude":24.6312527,"mapString":"Riyadh","mediaURL":"hatoun.re","uniqueKey":"49258871","objectId":"ID15","createdAt":"2019-05-17T00:53:34.024Z","updatedAt":"2019-05-17T00:53:34.024Z"},{"firstName":"first name","lastName":"last name","longitude":39.8161028,"latitude":21.4029047,"mapString":"mecca","mediaURL":"ddd","uniqueKey":"1234","objectId":"ID16","createdAt":"2019-05-17T00:53:34.033Z","updatedAt":"2019-05-17T00:53:34.033Z"},{"firstName":"first name","lastName":"last name","longitude":139.6917,"latitude":35.689506,"mapString":"tokyo","mediaURL":"d","uniqueKey":"1234","objectId":"ID17","createdAt":"2019-05-17T00:53:34.033Z","updatedAt":"2019-05-17T00:53:34.033Z"},{"firstName":"first name","lastName":"last name","longitude":39.8161028,"latitude":21.4029047,"mapString":"mecca","mediaURL":"ddd","uniqueKey":"1234","objectId":"ID18","createdAt":"2019-05-17T00:53:34.039Z","updatedAt":"2019-05-17T00:53:34.039Z"}]}
   }
   """.data(using: .utf8)!
    
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
