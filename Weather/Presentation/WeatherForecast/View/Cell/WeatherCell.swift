//
//  WeatherCell.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        statusImage.kf.indicatorType = .activity
    }
    
    func fill(with data: WeatherData) {
        let url = data.weather.iconURL
        statusImage.kf.setImage(with: url)
        
        degreeLabel.text = "\(data.dashboard.temp.fromKelvinToCelcius().description)°"
        descriptionLabel.text = data.weather.description
        
        configureTimeLabel(with: data.date)
    }
    
    private func configureTimeLabel(with date: Date) {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        let hourComponent = hour < 10 ? "0\(hour)" : hour.description
        let minuteComponent = minute < 10 ? "0\(minute)" : minute.description
        
        timeLabel.text = "\(hourComponent):\(minuteComponent)"
    }
}
