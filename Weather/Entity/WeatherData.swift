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
    var weather: Weather
    var wind: Wind
    var location: Location
    var dashboard: Dashboard
    //var rain: Double
    var clouds: Int
    
    init(map: Map) throws {
        weather = (try map.value("weather") as [Weather])[0] // why weather is array in JSON?
        wind = try map.value("wind")
        //rain = try map.value("rain.3h")
        clouds = try map.value("clouds.all")
        dashboard = try map.value("main")
        var city: String
        city = try map.value("name")
        var country: String
        country = try map.value("sys.country")
        location = Location(country: country, city: city)
    }
}
