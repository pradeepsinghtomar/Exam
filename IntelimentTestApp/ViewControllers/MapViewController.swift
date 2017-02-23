//
//  MapViewController.swift
//  IntelimentTestApp
//
//  Created by Pradeep Singh on 23/02/17.
//  Copyright © 2017 Pradeep Singh. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    lazy var locationManager : CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        return locationManager
    }()
    
    var currentCoordinates : CLLocationCoordinate2D {
        get {
            return self.currentCoordinates
        }
        
        set {
            self.addAnnotationAtCoordinates(coordinate: newValue)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // start tracking user's location
        locationManager.startUpdatingLocation()
    }
    
    private func addAnnotationAtCoordinates(coordinate : CLLocationCoordinate2D){
        // update the map's regio to the user's location.
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        
        // mark an annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "User's Location"
        mapView.addAnnotation(annotation)
        
        let currentLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(currentLocation) { (placemarkArray, error) in
            if error != nil {
                // display an alert or print error.
                print("Unable to geo-code")
            }
            else{
                let placemark = placemarkArray?.last
                DispatchQueue.main.async {
                    annotation.title = placemark?.name
                    annotation.subtitle = placemark?.country
                }
            }
        }
    }
}


extension MapViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        manager.stopUpdatingLocation()
        
        let currentLocation = locations.last
        currentCoordinates = CLLocationCoordinate2D(latitude: (currentLocation?.coordinate.latitude)!, longitude: (currentLocation?.coordinate.longitude)!)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Display Error to the user \(error.localizedDescription)")
    }
}

