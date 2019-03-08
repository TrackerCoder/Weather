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
    
    //dashboard
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel! 
    @IBOutlet weak var cloudsLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var mainContent: UIView!
    @IBOutlet weak var weatherTypeImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mainInformationLabel: UILabel!
    
    var output: CurrentWeatherViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    @IBAction func share(_ sender: UIButton) {
    }
    
}

extension CurrentWeatherViewController: CurrentWeatherViewInput {
    func didLoad(data: WeatherData) {
        let url = data.weather.iconURL
        weatherTypeImageView.kf.indicatorType = .activity
        weatherTypeImageView.kf.setImage(with: url)
        if let location = data.location {
            locationLabel.text = "\(location.city), \(location.country)"
        }
        let temperature = data.dashboard.temp.fromKelvinToCelcius()
        let description = data.weather.description
        mainInformationLabel.text = "\(temperature)°C | \(description)"
        
        pressureLabel.text = "\(data.dashboard.pressure.description)hPa"
        windDirectionLabel.text = data.wind.degree?.description ?? "N/A"
        windLabel.text = "\(data.wind.speed.description) km/h"
        humidityLabel.text = "\(data.dashboard.humidity.description)%"
        cloudsLabel.text = data.clouds.description
    }
    
    func startLoading() {
        activityIndicator.startAnimating()
        mainContent.isHidden = true
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
        mainContent.isHidden = false
    }
}
