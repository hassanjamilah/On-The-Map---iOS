//
//  LocationsViewController.swift
//  On The Map
//
//  Created by Hassan on 06/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import UIKit
import MapKit
class LocationsViewController: UIViewController , UITableViewDelegate , UITableViewDataSource   {
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var locationsTable: UITableView!
    var allStudents = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        locationsTable.refreshControl = refreshControl
        loadData()
    }
    
    
    //MARK: UI Actions
    
    @IBAction func reloadButtonAction(_ sender: Any) {
        loadData()
    }
    
    @IBAction func logOutButtonAction(_ sender: Any) {
        StudentApiCaller.performLogOut(originalController: self)
           
       }
    
    //MARK: Students Table Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageNum = Int.random(in: (1...4))
        
        let cell = UITableViewCell()
        let image = UIImage(named: "location\(imageNum)")
        let student = allStudents[indexPath.row]
        cell.textLabel!.text = student.firstName + " " + student.lastName
        cell.imageView?.contentMode = .scaleAspectFit
        cell.imageView?.image = image
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
       /* let controller = self.storyboard!.instantiateViewController(identifier: "MainTabViewController") as! MainTabViewController
       
        MapViewController.currentStudentIndex = indexPath.row
        present(controller, animated: true, completion: nil)*/
        
        
        UIApplication.shared.open(URL(string: allStudents[indexPath.row].mediaURL)!, options: [:], completionHandler: nil)
        
    }
    
    
    
    //MARK: Handle Indicator
    func handleIndicator(value:Bool){
        indicatorView.center = self.view.center
        
        
        if value {
            indicatorView.isHidden = false
            indicatorView.startAnimating()
            
        }else {
            indicatorView.isHidden = true
            indicatorView.stopAnimating()
            if let refreshControl1 = locationsTable.refreshControl{
                refreshControl1.endRefreshing()
            }
        }
        
    }
    
    
    //MARK: Helper Functions
    @objc func loadData(){
        handleIndicator(value: true)
        StudentApiCaller.getStudents(limit: 100, skip: 0, order: "", uniqueKey: "") { (students, response, error) in
            guard error == nil else {
                UIHelper.showAlertDialog(msg: .errorLoadingLocations, title: .errorLoadingLocations, orignialViewController: self)
                return
            }
            Student.updateSharedAllStudents(students: students)
            self.allStudents = Student.getSharedAllStudents()
            self.locationsTable.reloadData()
            self.handleIndicator(value: false)
            
            
        }
    }
}
