//
//  Double+FromFarenheitToCelcius.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation

extension Double {
    func fromKelvinToCelcius() -> Int {
        return Int(self - 273.15) // without floating values
    }
}
