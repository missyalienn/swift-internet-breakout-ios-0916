//
//  HourlyWeather.swift
//  niftyFlatironWeather
//
//  Created by Missy Allan on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation


class HourlyWeather {
    
        
        
        var hourlyForecasts: [CurrentWeather] = []
        var summary: String = ""
        
        
        init(hourlyData: [String : Any]) {
            self.summary = hourlyData["summary"] as! String

            
            // for item (which is a dictionary) in hourlyData 
            
            for item in hourlyData["data"] as! Array<[String : Any]> {
                hourlyForecasts.append(CurrentWeather(dictionary: item))
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
