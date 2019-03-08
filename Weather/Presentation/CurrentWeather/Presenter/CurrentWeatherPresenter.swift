//
//  CurrentWeatherPresenter.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import PromiseKit

class CurrentWeatherPresenter {
    
    weak var view: CurrentWeatherViewInput!
    var service: WeatherService
    
    init(view: CurrentWeatherViewInput, service: WeatherService) {
        self.view = view
        self.service = service
    }
    
    func viewIsReady() {
        getWeather()
    }
    
    func getWeather() {
        view.startLoading()
        firstly {
            service.getCurrentWeather()
            }.done { (data) in
                self.view.didLoad(data: data)
            }.catch { (error) in
                self.view.show(error: error)
            }.finally {
                self.view.stopLoading()
        }
    }
    
}

extension CurrentWeatherPresenter: CurrentWeatherViewOutput {
    
}
