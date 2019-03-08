//
//  CurrentWeatherViewIO.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation

protocol CurrentWeatherViewInput: class, UIViewInput {
    func didLoad(data: WeatherData)
    func startLoading()
    func stopLoading()
}

protocol CurrentWeatherViewOutput {
    func viewIsReady()
}
