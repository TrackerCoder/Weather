//
//  CurrentWeatherViewController.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class CurrentWeatherViewController: UIViewController {
    
    @IBOutlet weak var weatherTypeImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mainInformationLabel: UILabel!
    
    var output: CurrentWeatherViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    func didLoad(data: WeatherData) {
        let url = data.weather.iconURL
        weatherTypeImageView.kf.indicatorType = .activity
        weatherTypeImageView.kf.setImage(with: url)
        
        locationLabel.text = "\(data.location.city), \(data.location.country)"
        let temperature = data.dashboard.temp.fromKelvinToCelcius()
        let description = data.weather.description
        mainInformationLabel.text = "\(temperature)°C | \(description)"
        
    }
    
    @IBAction func share(_ sender: UIButton) {
    }
    
}

extension CurrentWeatherViewController: CurrentWeatherViewInput {
    
}
