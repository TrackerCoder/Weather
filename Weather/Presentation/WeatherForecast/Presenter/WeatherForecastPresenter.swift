//
//  WeatherWeekPresenter.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import PromiseKit

class WeatherForecastPresenter: WeatherForecastViewOutput {
    
    weak var view: WeatherForecastViewInput!
    var service: WeatherService
    
    var forecastGroupedByDay: [String: [WeatherData]] = [:]
    
    init(view: WeatherForecastViewInput, service: WeatherService) {
        self.view = view
        self.service = service
    }
    
    func viewIsReady() {
        view.startLoading()
        firstly {
            service.getWeatherPerDay()
            }.done { (forecast) in
                self.didLoad(forecast: forecast)
            }.catch { (error) in
                self.view.show(error: error)
            }.finally {
                self.view.stopLoading()
        }
    }
    
    func getSectionTitle(by index: Int) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        let day = Calendar.current.date(byAdding: .day, value: index, to: Date())!
        let dayInWeek = dateFormatter.string(from: day)
        return dayInWeek
    }
    
    func getForecast(by index: Int) -> [WeatherData]? {
        let key = getSectionTitle(by: index) ?? ""
        return forecastGroupedByDay[key]
    }
    
    func didLoad(forecast: WeatherForecast) {
        let dict: [String: [WeatherData]] = [:]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"

        forecastGroupedByDay = forecast.data.reduce(into: dict) { dict, weather in
            let dayInWeek = dateFormatter.string(from: weather.date)
            let existing = dict[dayInWeek] ?? []
            dict[dayInWeek] = existing + [weather]
        }
        view.didLoad(data: forecast)
    }
}
