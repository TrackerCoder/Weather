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
    var id: Int
    var main: String
    var description: String
    var iconName: String
    
    init(map: Map) throws {
        id = try map.value("id")
        main = try map.value("main")
        description = try map.value("description")
        iconName = try map.value("icon")
    }
    
}
