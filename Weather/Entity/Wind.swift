//
//  Wind.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import ObjectMapper

struct Wind: ImmutableMappable {
    
    var speed: Double
    var degree: Double
    
    init(map: Map) throws {
        degree = try map.value("deg")
        speed = try map.value("speed")
    }
}
