//
//  UIHelper.swift
//  On The Map
//
//  Created by user on 09/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation
import UIKit

class UIHelper{
    
    enum UIErrorMsgs:String{
        case emptyUserName = "The user name is empty.\nPlease try to fill the user name field"
        case emptyPassword = "The password is empty.\nPlease try to fill the password field"
        case errorInLogin = "The user name or password is incorrect.\nPlease try again"
        case errorFindingLocation = "Can not find your location.\nPlease try another location"
        case errorLoadingLocations = "Unable to load the locations.\nPlease try to press the refresh button"
        case errorInLogOut = "Unable to log out.\nPlease try again"
        case errorInPostingLocation = "Unable to post the info.\nPlease try again"
        case errorInURL = "Unable to open the url"
        case firstNameEmpty = "The first name can not be empty.\nPlease enter your first name."
        case lastNameEmpty = "The last name can not be empty.\nPlease enter your last name."
        case locationEmpty = "The location can not be empty.\nPlease enter your location."
    }
    
    enum UIErrorTitles:String{
        case emptyField = "Empty Field"
        case errorLoginTitle = "Login info are incorrect"
        case errorFindingLocation = "Unknown location"
        case errorLoadingLocations = "Error In Loading"
        case errorInLogOut = "Can not log out!"
        case errorInPostingLocation = "Unable to post"
        case errorInOpenURL = "Invalid URL"
        case firstNameEmpty = "Empty First Name"
        case lastNameEmpty = "Empty Last Name"
        case locationEmpty = "Empty Location"
    }
    
    
    /**
     Show alert dialog
     */
    class func showAlertDialog(msg:UIErrorMsgs , title:UIErrorTitles ,orignialViewController:UIViewController){
        let controller = UIAlertController(title: title.rawValue, message: msg.rawValue, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        orignialViewController.present(controller, animated: true, completion: nil)
    }
    
    /**
        Show alert dialog
        */
       class func showAlertDialog(messageText msg:String , title:String ,orignialViewController:UIViewController){
           let controller = UIAlertController(title: title, message: msg, preferredStyle: .alert)
           controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           orignialViewController.present(controller, animated: true, completion: nil)
       }
    
    
    /**
     Check if the enterd value is null to display error message
     */
    class func checkEmptyField(value:String , msg:UIErrorMsgs , originalViewController:UIViewController )->Bool{
        if (value.trimmingCharacters(in: .whitespaces) == ""){
            showAlertDialog(msg: msg, title: .emptyField, orignialViewController: originalViewController)
            return true
        }
        return false
    }
    
 
    
}
