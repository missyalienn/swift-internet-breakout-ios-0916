//
//  Today.swift
//  niftyFlatironWeather
//
//  Created by Missy Allan on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation


class CurrentWeather {
    
    
    var temperature: Double
    var humidity: Double
    var precipProb: Double
    var summary: String
    var time: Double

    
    init(dictionary: [String: Any], isDaily: Bool = false) {
        
        self.time = dictionary["time"] as! Double
        self.humidity = dictionary["humidity"] as! Double
        self.precipProb = dictionary["precipProbability"] as! Double
        self.summary =  dictionary["summary"] as! String 
        
        if isDaily {
            self.temperature = dictionary["temperatureMax"] as! Double
            
        }else{
            
            self.temperature = dictionary["temperature"] as! Double
            
        }
        

    }
    
    
    
    
    
    
    

    
}
