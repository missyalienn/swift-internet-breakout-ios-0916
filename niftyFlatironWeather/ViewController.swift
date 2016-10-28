//
//  ViewController.swift
//  niftyFlatironWeather
//
//  Created by Johann Kerr on 10/27/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    var latitude = Double()
    var longitude = Double()
   
    var store = WeatherDataStore.sharedInstance
    
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var tempuratureLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        
        store.getCurrentWeather(lat: latitude, long: longitude) { 
            
            DispatchQueue.main.async {
                self.summaryLabel.text = self.store.currentWeather.summary
                self.tempuratureLabel.text = self.doTimeHarder()
                self.humidityLabel.text = "\(self.store.currentWeather.temperature)"
            }
            
        }
       
    }

    func doTimeHarder() -> String {
        
        let date = Date(timeIntervalSince1970: store.currentWeather.time)
    
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
        let string = dateFormatter.string(from: date)
        return string
    }
    
}


extension ViewController: CLLocationManagerDelegate{
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        if let unwrappedlatitude = locationManager.location?.coordinate.latitude, let unwrappedLongitude = locationManager.location?.coordinate.longitude{
            self.latitude = unwrappedlatitude
            self.longitude = unwrappedLongitude
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

