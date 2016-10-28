//
//  WeatherAPIClient.swift
//  niftyFlatironWeather
//
//  Created by Missy Allan on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation

struct WeatherAPIClient {
    
    
    static func getApi(lat: Double, long: Double, with completion: @escaping ([String:Any]) -> ()) {
        
        
        let darkSkyURLString = "https://api.darksky.net/forecast/\(clientID)/\(lat),\(long)"
        
        let url = URL(string: darkSkyURLString)
        
        guard let unwrapURL = url else {
            print("No url")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: unwrapURL) { (data, response, error) in
            print("start")
            guard let unwrapData = data else {
                return
            }
            
            do {
                
                let responseJSON = try JSONSerialization.jsonObject(with: unwrapData, options: []) as!
                    [String : Any]
                
                completion(responseJSON)
                print(3)
                
            }catch{
                
                print("Error")
                
                
            }
            
        }
        task.resume()
        
    }
    
    
// this closes class 
}

    
    
    
    
    
    
    
    
    
    
    
    
    
