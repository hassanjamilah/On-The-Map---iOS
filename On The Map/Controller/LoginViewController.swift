//
//  LoginViewController.swift
//  On The Map
//
//  Created by user on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Student.getStudents(limit: 10, skip: 0, order: "", uniqueKey: "") { (students,response ,  error) in
            for x in students {
                print (x.longitude)
                
            }
        }
        
    }
    

   

}
