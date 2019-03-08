//
//  WeatherService.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import PromiseKit
import CoreLocation

protocol WeatherService {
    var userLocation: CLLocationCoordinate2D! {get set}
    func getCurrentWeather() -> Promise<WeatherData>
    func getWeatherPerDay() -> Promise<WeatherForecast>
}
