//
//  WeatherDataStore.swift
//  niftyFlatironWeather
//
//  Created by Missy Allan on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation


class WeatherDataStore {
    
    static let sharedInstance = WeatherDataStore()
    var currentWeather: CurrentWeather!
    var daily: DailyWeather!
    var hourly: HourlyWeather!

    
    private init() {}

    func getCurrentWeather(lat: Double, long: Double, with completion: @escaping () -> ()) {
        
        WeatherAPIClient.getApi(lat: lat, long: long) { (data) in
            print(1)
            let current = data["currently"] as! [String: Any]
            
            self.currentWeather = CurrentWeather(dictionary: data["currently"] as! [String: Any])
            completion()
            print(2)
            
            self.daily = DailyWeather(data: data["daily"] as! [String : Any])
            
            self.hourly = HourlyWeather(hourlyData: data["hourly"] as! [String: Any])
            
            
            
        }
        
        
    }
    

    
    
    
    
    
}
