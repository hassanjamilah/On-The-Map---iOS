//
//  LoginViewController.swift
//  On The Map
//
//  Created by user on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginWithFacebookButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    //MARK: Controls Actions
    
    @IBAction func loginButtonAction(_ sender: Any) {
        let userName = emailTextField.text!
        let password = passwordTextField.text!
        if UIHelper.checkEmptyField(value: userName, msg: .emptyUserName, originalViewController: self){return}
        if UIHelper.checkEmptyField(value: password, msg: .emptyPassword, originalViewController: self){return}
        
        
        
        
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
    }
    
    @IBAction func loginWithFaceBookAction(_ sender: Any) {
    }
    
    
    
    
    
}
