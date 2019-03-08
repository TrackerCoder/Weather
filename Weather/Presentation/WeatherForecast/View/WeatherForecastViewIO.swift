//
//  WeatherWeekViewIO.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation

protocol WeatherForecastViewInput: class, UIViewInput {
    func startLoading()
    func stopLoading()
    func didLoad(data: WeatherForecast)
}

protocol WeatherForecastViewOutput {
    var forecastGroupedByDay: [String: [WeatherData]] {get}
    func viewIsReady()
    func getSectionTitle(by index: Int) -> String?
    func getForecast(by index: Int) -> [WeatherData]?
}
