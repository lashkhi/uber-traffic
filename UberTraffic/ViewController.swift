//
//  ViewController.swift
//  UberTraffic
//
//  Created by David Lashkhi on 26/07/16.
//  Copyright © 2016 David Lashkhi. All rights reserved.
//

import UIKit
import GoogleMaps
import Foundation
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        self.setupGoogleMaps()
        self.setupGeolocation()
    }
    
    func setupGoogleMaps() {
        let camera = GMSCameraPosition.cameraWithLatitude(-33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.mapWithFrame(CGRect.zero, camera: camera)
        mapView.myLocationEnabled = true
        mapView.settings.myLocationButton = true
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView

    }
    
    func setupGeolocation() {
        let manager = CLLocationManager ()
        manager.delegate = self
        if CLLocationManager.locationServicesEnabled() {
            manager.startUpdatingLocation()
        }
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedAlways || status == .AuthorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }


}

