//
//  Weather.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import ObjectMapper

struct Weather: ImmutableMappable {
    var status: String
    var description: String
    var iconURL: URL
    
    init(map: Map) throws {
        status = try map.value("main")
        description = try map.value("description")
        
        var iconName: String
        iconName = try map.value("icon")
        iconURL = try! "https://openweathermap.org/img/w/\(iconName).png".asURL()
    }
    
}
