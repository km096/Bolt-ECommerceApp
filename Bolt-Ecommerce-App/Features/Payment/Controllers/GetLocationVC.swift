//
//  GetLocationVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/24/23.
//

import UIKit
import MapKit
import CoreLocation
import ProgressHUD

protocol UserLocationInfoDelegate {
    func getUserLocationInfo(_ name: String, _ country: String, _ postalCode: String)
}

class GetLocationVC: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    //Vars
    var locationManager = CLLocationManager()
    var locationDelegate: UserLocationInfoDelegate?
    var isLocationServiceEnabled: Bool {
        return CLLocationManager.locationServicesEnabled()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocation()
        configureLocation()
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    //MARK: - Setup
    private func setupLocation() {
        if isLocationServiceEnabled {
            checkAuthorization()
        } else {
            ProgressHUD.showFailed("Please enable location service.")
        }
    }
    
    private func checkAuthorization() {
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .restricted:
            ProgressHUD.showFailed("Authorization restricted")
        case .denied:
            ProgressHUD.showFailed("Please authorize access to location")
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
        @unknown default:
            print("default")
        }
    }
    
    func getLocationInfo(location: CLLocation) {
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) { placemark, error in
            if let error = error {
                print("Reverse geocoder failed with error: \(error.localizedDescription)")
                return
            }
            
            guard let placemark = placemark?.first else {
                return
            }
            
            self.locationDelegate?.getUserLocationInfo(placemark.name ?? "", placemark.country ?? "", placemark.postalCode ?? "")
        }
    }
    
    //MARK: - UpdateUI
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            zoomToUserLocation(location: location)
        }
        locationManager.stopUpdatingLocation()
    }
    
    private func zoomToUserLocation(location: CLLocation) {
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }
    
    
    
}
