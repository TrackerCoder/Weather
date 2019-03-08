//
//  ServiceAssembler.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import Swinject

class ServiceAssembler: Assembly, SwinjectInitAssembler {
    
    required init() {}

    func assemble(container: Container) {
        
        let appId = "d2e2d10114054cb600e3d0bf422f0dcb"
        let baseURL = "https://api.openweathermap.org/data/2.5/"
        let weatherService = WeatherServiceImp(baseURL: baseURL, appId: appId)
        
        container.register(WeatherService.self) { _ in
            return weatherService
        }.inObjectScope(.container)
        
    }
}
