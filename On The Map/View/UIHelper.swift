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
    }
    
    enum UIErrorTitles:String{
        case emptyField = "Empty Field"
        case errorLoginTitle = "Login info are incorrect"
        case errorFindingLocation = "Unknown location"
        case errorLoadingLocations = "Error In Loading"
        case errorInLogOut = "Can not log out!"
    }
    
    
    class func showAlertDialog(msg:UIErrorMsgs , title:UIErrorTitles ,orignialViewController:UIViewController){
        let controller = UIAlertController(title: title.rawValue, message: msg.rawValue, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        orignialViewController.present(controller, animated: true, completion: nil)
    }
    
    
    class func checkEmptyField(value:String , msg:UIErrorMsgs , originalViewController:UIViewController )->Bool{
        if (value.trimmingCharacters(in: .whitespaces) == ""){
            showAlertDialog(msg: msg, title: .emptyField, orignialViewController: originalViewController)
            return true
        }
        return false
    }
    
 
    
}
