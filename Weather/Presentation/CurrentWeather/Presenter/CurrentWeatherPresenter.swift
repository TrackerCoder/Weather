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
        firstly {
            service.getCurrentWeather()
            }.done { (data) in
                print(data)
            }.catch { (error) in
                print(error)
        }
    }
    
}

extension CurrentWeatherPresenter: CurrentWeatherViewOutput {
    
}
