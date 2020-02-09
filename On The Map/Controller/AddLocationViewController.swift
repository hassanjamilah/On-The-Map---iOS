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

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var addLocationTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        addLocationTextField.attributedPlaceholder = NSAttributedString(string: "Enter Your Location Here", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
    }
    

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
    
    
    func findLocation (location:String , completionHandler:@escaping(CLLocationCoordinate2D? , Error?)->Void){
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (clPlaceMark, error) in
            guard let clPlaceMark = clPlaceMark else {
                completionHandler(nil , error)
                print ("Error in location")
                return
            }
            completionHandler(clPlaceMark.first?.location?.coordinate , nil )
        }
    }

    
    
    
    //MARK: Text Field Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        findLocationButtonAction(textField)
        return true
    }
}
