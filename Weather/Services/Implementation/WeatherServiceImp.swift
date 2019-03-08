//
//  WeatherServiceImp.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit
import ObjectMapper
import CoreLocation

class WeatherServiceImp: WeatherService {
    
    private var appId: String
    private var baseURL: String
    
    private var currentWeatherURL: URL!
    private var forecastURL: URL!
    
    var userLocation: CLLocationCoordinate2D!
    
    init(baseURL: String, appId: String) {
        self.appId = appId
        self.baseURL = baseURL
        currentWeatherURL = try! "\(baseURL)weather".asURL()
        forecastURL = try! "\(baseURL)forecast".asURL()        
    }
    
    func getCurrentWeather() -> Promise<WeatherData> {
        
        let params: Parameters = ["lat": userLocation.latitude, "lon": userLocation.longitude, "APPID": self.appId]
        return Promise { seal in
            Alamofire.request(currentWeatherURL, parameters: params).validate().responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    guard let data = try? Mapper<WeatherData>().map(JSONObject: value) else {
                        assertionFailure("Mapping error")
                        return seal.reject(SystemError.defaultError)
                    }
                    seal.fulfill(data)
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
        
    }
    
    func getWeatherPerDay() -> Promise<WeatherForecast> {
        let params: Parameters = ["lat": 35, "lon": 139, "APPID": self.appId]
        return Promise { seal in
            Alamofire.request(forecastURL, parameters: params).validate().responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    guard let data = try? Mapper<WeatherForecast>().map(JSONObject: value) else {
                        assertionFailure("Mapping error")
                        return seal.reject(SystemError.defaultError)
                    }
                    seal.fulfill(data)
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
    }
    
}
