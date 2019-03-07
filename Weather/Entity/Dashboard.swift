//
//  Dashboard.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import ObjectMapper

struct Dashboard: ImmutableMappable {
    var temp: Double
    var pressure: Int
    var humidity: Int
    var tempMin: Double
    var tempMax: Double
    
    init(map: Map) throws {
        temp = try map.value("temp")
        pressure = try map.value("pressure")
        humidity = try map.value("humidity")
        tempMin = try map.value("temp_min")
        tempMax = try map.value("temp_max")
    }
}
