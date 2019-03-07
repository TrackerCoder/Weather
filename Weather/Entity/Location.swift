//
//  City.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import ObjectMapper

struct Location: ImmutableMappable {
    var country: String
    var city: String
    
    init(country: String, city: String) {
        self.country = country
        self.city = city
    }
    
    init(map: Map) throws {
        country = try map.value("country")
        city = try map.value("name")
    }
}
