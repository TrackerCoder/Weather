//
//  RootPresenter.swift
//  Weather
//
//  Created by Tracker on 08.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import CoreLocation

// also request all weather details and forecast at this module.
// As a result, it will be possible to prompt the user to re-request if an error occurs
// For this module was created in first place. Otherwise, it’s not possible to try request again.
class RootPresenter: NSObject, RootViewOutput {
    weak var view: RootViewInput!
    var service: WeatherService
    private let locationManager = CLLocationManager()

    init(view: RootViewInput, service: WeatherService) {
        self.view = view
        self.service = service
    }
    
    func viewIsReady() {
        getUserLocation()
    }
    
    // move to service
    func getUserLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        locationManager.requestLocation()
    }
}

// should move to service
extension RootPresenter: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first?.coordinate else { return }
        service.userLocation = location
        view.openApp()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            manager.requestLocation()
        } else if status == .denied {
            view.showError(type: .accessDenied)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        view.showError(type: .requestError)
    }
}
