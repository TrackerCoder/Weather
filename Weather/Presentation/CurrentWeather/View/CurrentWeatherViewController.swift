//
//  CurrentWeatherViewController.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import UIKit

class CurrentWeatherViewController: UIViewController {
    
    var output: CurrentWeatherViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
}

extension CurrentWeatherViewController: CurrentWeatherViewInput {
    
}
