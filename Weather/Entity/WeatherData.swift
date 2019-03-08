//
//  WeatherData.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import ObjectMapper

struct WeatherData: ImmutableMappable {
    var date: Date
    var weather: Weather
    var wind: Wind
    var dashboard: Dashboard
    var clouds: Int
    var location: Location?
    
    init(map: Map) throws {
        weather = (try map.value("weather") as [Weather])[0] // why weather is array in JSON?
        wind = try map.value("wind")
        clouds = try map.value("clouds.all")
        dashboard = try map.value("main")
        
        var seconds: Int
        seconds = try map.value("dt")
        date = Date(timeIntervalSince1970: TimeInterval(seconds))
        
        var city: String?
        city = try map.value("name")
        var country: String?
        country = try map.value("sys.country")
        if let city = city, let country = country {
            location = Location(country: country, city: city)
        }
    }
}
