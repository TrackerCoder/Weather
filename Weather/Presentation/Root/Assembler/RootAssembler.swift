//
//  RootAssembler.swift
//  Weather
//
//  Created by Tracker on 08.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import Swinject

class RootAssembler: Assembly, SwinjectInitAssembler {
    
    required init() {}
    
    func assemble(container: Container) {
        container.storyboardInitCompleted(RootViewController.self) { r, vc in
            let weatherService = r.resolve(WeatherService.self)!
            let presenter = RootPresenter(view: vc, service: weatherService)
            vc.output = presenter
        }
    }
}
