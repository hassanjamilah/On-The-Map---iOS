//
//  MapViewController.swift
//  On The Map
//
//  Created by Hassan on 06/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController , MKMapViewDelegate {
    static var currentStudentIndex = 0
    var allStudents = [Student]()
    var studentCoordinate:CLLocationCoordinate2D!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        loadData()
    }
    
    //MARK: Views Actions
    
    @IBAction func gotoLocationButtonAction(_ sender: Any) {
        gotoLocation(lat: 13.7539392 , long: 39.8161028)
    }
    
    
    @IBAction func logOutButtonAction(_ sender: Any) {
        StudentApiCaller.performLogOut(originalController: self)
        
    }
    
    @IBAction func refreshData(_ sender: Any) {
        loadData()
    }
    
    
    @IBAction func rightHandButtonAction(_ sender: Any) {
        MapViewController.currentStudentIndex += 1
        if MapViewController.currentStudentIndex >= allStudents.count {MapViewController.currentStudentIndex = 0}
        gotoStudent()
    }
    
    @IBAction func leftHandButtonAction(_ sender: Any) {
        MapViewController.currentStudentIndex -= 1
        if MapViewController.currentStudentIndex <= 0 {MapViewController.currentStudentIndex = allStudents.count - 1}
        gotoStudent()
    }
    
    
    
    //MARK: The Map View Delegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let id = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: id) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = .red
            pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }else {
            pinView!.annotation = annotation
        }
        
        return pinView
        
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView{
            if let urlStr = view.annotation?.subtitle{
                UIApplication.shared.open(URL(string: urlStr!)!, options: [:], completionHandler: nil)
            }
            
        }
        
    }
    
    
    
    //MARK: Helper functions
    
    /**
     Load the students data
     */
    func loadData(){
        StudentApiCaller.getStudents(limit: 100, skip: 0, order: "-updatedAt", uniqueKey: "") { (students, response, error) in
            Student.updateSharedAllStudents(students: students)
            self.allStudents = Student.getSharedAllStudents()
            
            var pins = [MKPointAnnotation]()
            for student in self.allStudents{
                let lat = CLLocationDegrees(student.latitude )
                let longitued = CLLocationDegrees(student.longitude )
                let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: longitued)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = "\(student.firstName) \(student.lastName)"
                annotation.subtitle = student.mediaURL
                
                pins.append(annotation)
            }
            
            self.mapView.addAnnotations(pins)
            self.gotoStudent()
            
        }
    }
    
    /**
     Goto student
     */
    func gotoStudent(){
        let student = allStudents[MapViewController.currentStudentIndex]
        gotoLocation(lat: student.latitude, long: student.longitude)
    }
    
    /**
     Goto location
     */
    func gotoLocation (lat:Double , long:Double){
        print ("\(lat)   \(long)")
        let center = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        self.mapView.setRegion(region, animated: true)
    }
    
    
    
}
