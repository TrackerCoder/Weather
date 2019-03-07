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
        let weatherService = WeatherServiceImp()
        
        container.register(WeatherService.self) { _ in
            return weatherService
        }.inObjectScope(.container)
        
    }
}
