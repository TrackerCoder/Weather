//
//  WeatherWeekViewController.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import UIKit

class WeatherForecastViewController: UIViewController {
    var output: WeatherForecastViewOutput!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var forecastTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        setupTableView()
    }
    
    func setupTableView() {
        let nib = UINib(nibName: "WeatherCell", bundle: nil)
        forecastTableView.register(nib, forCellReuseIdentifier: "WeatherCell")
        forecastTableView.rowHeight = 70
        forecastTableView.dataSource = self
    }

}

extension WeatherForecastViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let array = output.getForecast(by: section) {
            return array.count
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return output.forecastGroupedByDay.keys.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return output.getSectionTitle(by: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as? WeatherCell else {
            fatalError()
        }
        guard let array = output.getForecast(by: indexPath.section) else {
            return UITableViewCell()
        }
        cell.fill(with: array[indexPath.row])
        return cell
    }
}

extension WeatherForecastViewController: WeatherForecastViewInput {
    
    func didLoad(data: WeatherForecast) {
        navigationItem.title = data.location.city
        forecastTableView.reloadData()
    }
    
    func startLoading() {
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
    }
}
