//
//  LoginViewController.swift
//  On The Map
//
//  Created by user on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
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
         performSegue(withIdentifier: "completeLogin", sender: nil)
        return
        
        //============== delete before this
        let userName = emailTextField.text!
        let password = passwordTextField.text!
        if UIHelper.checkEmptyField(value: userName, msg: .emptyUserName, originalViewController: self){return}
        if UIHelper.checkEmptyField(value: password, msg: .emptyPassword, originalViewController: self){return}
        
       /* StudentApiCaller.getNewSession(userName: userName, password: password) { (success, res, error) in
            if success{
                self.dismiss(animated: true) {
                    let controller = MapViewController()
                    self.present(controller, animated: true, completion: nil)
                }
                
                
            }else {
                UIHelper.showAlertDialog(msg: .errorInLogin, title: .errorLoginTitle, orignialViewController: self)
            }
        }*/
        
        
       
        
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        UIApplication.shared.open(StudentClient.EndPoints.udacitySignUp.url, options: [:], completionHandler: nil)
    }
    
    @IBAction func loginWithFaceBookAction(_ sender: Any) {
    }
    
    
    
    
    
    
    
}
