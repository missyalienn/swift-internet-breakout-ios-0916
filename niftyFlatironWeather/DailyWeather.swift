//
//  DailyWeather.swift
//  niftyFlatironWeather
//
//  Created by Missy Allan on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation


class DailyWeather {
    
    var dailyForecasts: [CurrentWeather] = []
    var summary: String = ""
    
    init(data: [String : Any ]) {
        self.summary = data["summary"] as! String
        
        for item in data["data"] as! Array< [ String : Any ] > {
    
            dailyForecasts.append(CurrentWeather(dictionary: item, isDaily: true))
    
        }
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
