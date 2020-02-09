//
//  SessionFromUdacity.swift
//  On The Map
//
//  Created by Hassan on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation

struct SessionFromUdacity:Codable {
    let account:Account
    let session:UdacitySession
}

struct Account:Codable{
    let registered:Bool
    let key:String
}

struct UdacitySession:Codable{
    let id:String
    let expiration:String
}
