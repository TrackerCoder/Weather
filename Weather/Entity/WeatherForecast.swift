//
//  WeatherForecast.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import ObjectMapper

struct WeatherForecast: ImmutableMappable {
    var data: [WeatherData]
    var location: Location
    
    init(map: Map) throws {
        data = try map.value("list")
        location = try map.value("city")
    }
    
}
