//
//  CurrentWeatherPresenter.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation

class CurrentWeatherPresenter {
    
    weak var view: CurrentWeatherViewInput!
    var service: WeatherService
    
    init(view: CurrentWeatherViewInput, service: WeatherService) {
        self.view = view
        self.service = service
    }
    
    func viewIsReady() {
        print("___ViewIsReady___")
        service.foo()
    }
    
}

extension CurrentWeatherPresenter: CurrentWeatherViewOutput {
    
}
