//
//  LoginViewController.swift
//  On The Map
//
//  Created by user on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import UIKit
import FacebookLogin

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginWithFacebookButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginIndicator.isHidden  = true
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    //MARK: Controls Actions
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
  
        
        let userName = emailTextField.text!
        let password = passwordTextField.text!
        if UIHelper.checkEmptyField(value: userName, msg: .emptyUserName, originalViewController: self){return}
        if UIHelper.checkEmptyField(value: password, msg: .emptyPassword, originalViewController: self){return}
        handleLoginIndicators(value: true)
        StudentApiCaller.getNewSession(userName: userName, password: password) { (success, res, error) in
            self.handleLoginIndicators(value: false)
            if success{
               
                self.performSegue(withIdentifier: "completeLogin", sender: nil)
               
                
                
            }else {
                UIHelper.showAlertDialog(messageText: error?.localizedDescription ?? "Unknown Error", title: "Login Error", orignialViewController: self)
            }
            
        }
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        UIApplication.shared.open(StudentClient.EndPoints.udacitySignUp.url, options: [:], completionHandler: nil)
    }
    
    @IBAction func loginWithFaceBookAction(_ sender: Any) {
    }
    
    
    //MARK: Helper Functions
    func handleLoginIndicators(value:Bool){
        loginIndicator.isHidden = !value
            loginIndicator.startAnimating()
            emailTextField.isEnabled = !value
            passwordTextField.isEnabled = !value
            loginButton.isEnabled  = !value
            signUpButton.isEnabled = !value
        if value {
            loginIndicator.startAnimating()
        }else {
            loginIndicator.stopAnimating()
        }
    }
    
   
    
}
