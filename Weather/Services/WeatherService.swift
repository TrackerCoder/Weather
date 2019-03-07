//
//  WeatherService.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import PromiseKit

protocol WeatherService {
    func getCurrentWeather() -> Promise<WeatherData>
}
