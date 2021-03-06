//
//  SubmitLocationViewController.swift
//  On The Map
//
//  Created by Hassan on 09/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import UIKit
import MapKit
class SubmitLocationViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    
    var coordinate:CLLocationCoordinate2D!
    var mapString:String!
    var firstName:String!
    var lastName:String!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewLocation()
    
    }
    

    /**
     View the location on the map
     */
    func viewLocation(){
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        mapView.setRegion(region, animated: true)
        
    }

    
    //MARK: UI Actions
    @IBAction func submitButtonAction(_ sender: Any) {
        let uniqueKey = Int.random(in: (1000...100000))
        let student = Student(createDate: "\(Date())", firstName: firstName, lastName: lastName, latitude: coordinate.latitude, longitude: coordinate.longitude, mapString: mapString, mediaURL: urlTextField.text!, objectID: "", uniqueKey: "\(uniqueKey)", updatedDate: "")
        
        StudentApiCaller.postNewStudent(student: student) { (rsult, reponse, error) in
            guard error == nil  else {
                print ("Error posting a new location")
                UIHelper.showAlertDialog(msg: .errorInPostingLocation, title: .errorInPostingLocation, orignialViewController: self)
                return
            }
            print ("Successfully added new location")
            let controller  = self.storyboard!.instantiateViewController(identifier: "MapViewController") as! MapViewController
            self.present(controller, animated: true, completion: nil)
            
        }
    }


    //MARK: TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
