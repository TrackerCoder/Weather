//
//  CurrentWeatherViewIO.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation

protocol CurrentWeatherViewInput: class {
    func didLoad(data: WeatherData)
}

protocol CurrentWeatherViewOutput {
    func viewIsReady()
}
