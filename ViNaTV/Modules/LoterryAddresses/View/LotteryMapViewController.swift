//
//  LotteryMapViewController.swift
//  ViNaTV
//
//  Created by Alan Silva on 23/04/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LotteryMapViewController: UIViewController {
    
    //private var mapsController: MapsController?
    private let locationManager: CLLocationManager = CLLocationManager()
    private let zoomInMeters: CLLocationDistance = 1000
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //        if mapsController == nil {
        //            mapsController = MapsController()
        //        }
        
        setupLocationManager()
        
        mapView.delegate = self
        
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func centerLocation() {
        
        if let currentLocation = locationManager.location?.coordinate {
            
            print(currentLocation)
            
            let region = MKCoordinateRegion(center: currentLocation, latitudinalMeters: zoomInMeters, longitudinalMeters: zoomInMeters)
            self.mapView.setRegion(region, animated: true)
            self.mapView.showsUserLocation = true
        }
        
    }
    
    func checkLocationAutorization() {
        
        if CLLocationManager.locationServicesEnabled() {
            
            switch CLLocationManager.authorizationStatus() {
                
            case .authorizedWhenInUse:
                centerLocation()
                break
            case .denied:
                //alerta de erro
                break
            case .notDetermined:
                self.locationManager.requestWhenInUseAuthorization()
                break
            case .restricted:
                //alerta de erro
                break
            case .authorizedAlways:
                break
            @unknown default:
                break
            }
        } else {
            //Show alerta de erro
        }
        
    }
    
}

extension LotteryMapViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        centerLocation()
        
        if let currentLocation = locationManager.location?.coordinate {
            
            /*    mapsController?.getMedicalCenters(latitude: (currentLocation.latitude), longitude: (currentLocation.longitude)) { (array, error) in
             
             if let arrayLocals = array {
             self.mapView.addAnnotations(arrayLocals)
             }
             }
             */
        }
        
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAutorization()
    }
    
}

extension LotteryMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        /*
         displayView(enable: true)
         titleLbl.text = view.annotation?.title ?? ""
         addressLbl.text = view.annotation?.subtitle ?? ""
         mapsController?.selectedMKAnnotation = view
         */
    }
}
