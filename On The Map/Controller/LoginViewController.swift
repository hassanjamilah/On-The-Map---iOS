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

        let  st = Student(createDate: "", firstName: "F1", lastName: "L1", latitude: 2.34332, longitude: 3.34343, mapString: "KL", mediaURL: "https://wwww.google.com", objectID: "", uniqueKey: "", updatedDate: "")
        StudentApiCaller.postNewStudent(student: st) { (result, response, error) in
            
        }
    
        
    }
    

   

}
