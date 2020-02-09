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
    override func viewDidLoad() {
        super.viewDidLoad()

        viewLocation()
    
    }
    

    func viewLocation(){
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        mapView.setRegion(region, animated: true)
        
    }

    @IBAction func submitButtonAction(_ sender: Any) {
        let student = Student(createDate: "\(Date())", firstName: "Hani", lastName: "Abed", latitude: coordinate.latitude, longitude: coordinate.longitude, mapString: mapString, mediaURL: urlTextField.text!, objectID: "", uniqueKey: "3432", updatedDate: "")
        
        StudentApiCaller.postNewStudent(student: student) { (rsult, reponse, error) in
            guard error == nil  else {
                print ("Error posting a new location")
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
