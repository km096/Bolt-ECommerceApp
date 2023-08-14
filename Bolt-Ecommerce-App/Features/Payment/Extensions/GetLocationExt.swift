//
//  GetLocationExt.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/25/23.
//

import UIKit
import MapKit
import CoreLocation
import ProgressHUD

extension GetLocationVC: CLLocationManagerDelegate, MKMapViewDelegate {
    
    func configureLocation() {
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            ProgressHUD.showFailed("Authorization restricted")
        case .denied:
            ProgressHUD.showFailed("Please authorize access to location")
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
        @unknown default:
            print("default")
        }
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        getLocationInfo(location: CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude))
    }
    
    
}
