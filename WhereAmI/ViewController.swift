//
//  ViewController.swift
//  WhereAmI
//
//  Created by Evan on 4/19/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!

    @IBOutlet weak var latLabel: UILabel!
    
    @IBOutlet weak var longLabel: UILabel!
    
    @IBOutlet weak var courseLabel: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var altLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        var userLocation: CLLocation = locations[0]
        
        self.latLabel.text = String(userLocation.coordinate.latitude)
        self.longLabel.text = String(userLocation.coordinate.longitude)
        
        self.courseLabel.text = String(userLocation.course)
        
        self.speedLabel.text = String(userLocation.speed)
        
        self.altLabel.text = String(userLocation.altitude)
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            
            if (error != nil) {
                print(error)
            } else {
                if placemarks!.count > 0 {
                    let p = (placemarks![0])
                    if(p.subThoroughfare != nil) {
                        let subThoroughFare = p.subThoroughfare
                        
                        self.addressLabel.text = "\(subThoroughFare!) \n \(p.thoroughfare!) \n \(p.locality!) \n \(p.subAdministrativeArea!) \(p.postalCode!) \n \(p.country!)"
                    }
                }
                
                }
            }
        }
    }
















