//
//  WeatherWeekAssembler.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import Swinject

class WeatherForecastAssembler: Assembly, SwinjectInitAssembler {
    
    required init() {}
    
    func assemble(container: Container) {
        container.storyboardInitCompleted(WeatherForecastViewController.self) { r, vc in
            let weatherService = r.resolve(WeatherService.self)!
            let presenter = WeatherForecastPresenter(view: vc, service: weatherService)
            vc.output = presenter
        }
    }
}
