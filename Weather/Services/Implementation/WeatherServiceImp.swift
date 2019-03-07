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

class WeatherServiceImp: WeatherService {
    
    private var appId: String
    private var baseURL: String
    
    private var currentWeatherURL: URL!
    
    init(baseURL: String, appId: String) {
        self.appId = appId
        self.baseURL = baseURL
        
        currentWeatherURL = try! "\(baseURL)weather".asURL()
    }
    
    func getCurrentWeather() -> Promise<WeatherData> {
        
        let params: Parameters = ["lat": 35, "lon": 139, "APPID": self.appId]
        return Promise { seal in
            Alamofire.request(currentWeatherURL, parameters: params).validate().responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    guard let data = try? Mapper<WeatherData>().map(JSONObject: value) else {
                        fatalError("Mapping error") // Make default error for this case to show for user
                    }
                    seal.fulfill(data)
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
        
    }
}
