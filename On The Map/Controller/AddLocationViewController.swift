//
//  AddLocationViewController.swift
//  On The Map
//
//  Created by Hassan on 06/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import UIKit
import MapKit
class AddLocationViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var addLocationTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingIndicator.isHidden = true
        
    }
    
    
    
    //MARK: UI Actions
    @IBAction func findLocationButtonAction(_ sender: Any) {
        
        let value = locationTextField.text!
        findLocation(location: value) { (coordinate, error) in
            if let coordinate = coordinate{
                print (coordinate)
                
                DispatchQueue.main.async {
                    let controller = self.storyboard!.instantiateViewController(identifier: "SubmitLocationViewController") as! SubmitLocationViewController
                    controller.coordinate = coordinate
                    controller.mapString = value
                    self.present(controller, animated: true, completion: nil)
                    
                }
            }else {
                UIHelper.showAlertDialog(msg: .errorFindingLocation, title: .errorFindingLocation, orignialViewController: self)
            }
        }
    }
    
    
    
    
    
    
    
    
    
    //MARK: Text Field Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        findLocationButtonAction(textField)
        return true
    }
    
    func showLoadingIndicator (value:Bool){
        loadingIndicator.isHidden = !value
        if value {
            
            loadingIndicator.startAnimating()
        }else {
            loadingIndicator.stopAnimating()
        }
    }
    
    
    //MARK: Helper Functions
    func findLocation (location:String , completionHandler:@escaping(CLLocationCoordinate2D? , Error?)->Void){
        showLoadingIndicator(value: true)
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (clPlaceMark, error) in
            self.showLoadingIndicator(value: false)
            guard let clPlaceMark = clPlaceMark else {
                completionHandler(nil , error)
                print ("Error in location")
                return
            }
            completionHandler(clPlaceMark.first?.location?.coordinate , nil )
        }
    }
}
