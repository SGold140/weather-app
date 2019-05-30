//
//  WeatherViewModel.swift
//  weather-app
//
//  Created by Samuel Goldsmith on 5/26/19.
//  Copyright © 2019 Samuel Goldsmith. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class WeatherViewModel {
    
    let cities = ["Queens", "London", "Tokyo"]
    let BASE_URL = "https://api.openweathermap.org/data/2.5/weather?q="
    let API_KEY = "a60b6fb4a29ce898e4d43023e1b64b88"
    var locations: [Location] = []
    
    func getLocations(completion: @escaping ([Location]) -> Void) {
        for city in cities {
            if let url = URL(string: "\(BASE_URL)\(city)&appid=\(API_KEY)") {
                Alamofire.request(url).responseJSON { (response) in
                    if let json = response.result.value as? [String: Any] {
//                        print(json)
                        self.getWeather(fromJson: json)
                        if self.locations.count == self.cities.count {
                            completion(self.locations)
                        }
                    }
                }
            }
        }
    }
    
    fileprivate func getWeather(fromJson json: [String:Any]) {
        if let weather = json["weather"] as? [[String:Any]],
            let name = json["name"] as? String
        {
            
            if let description = weather[0]["description"] as? String,
                let icon = weather[0]["icon"] as? String,
                let main = json["main"] as? [String:Any],
                let temp = main["temp"] as? Double,
                let tempMax = main["temp_max"] as? Double,
                let tempMin = main["temp_min"] as? Double,
                let wind = json["wind"] as? [String: Any], let windDeg = wind["deg"] as? Double, let windSpeed = wind["speed"] as? Double,
                let clouds = json["clouds"] as? [String: Any], let all = clouds["all"] as? Double
            {
                let loc = Location.init(name: name, temperature: String(kelvinToFahrenheit(kelvin: temp)), tempMax: String(kelvinToFahrenheit(kelvin: tempMax)), tempMin: String(kelvinToFahrenheit(kelvin: tempMin)), description: description, icon: icon, windDegree: String(windDeg), windSpeed: String(windSpeed), clouds: String(all))
                    locations.append(loc)
                
//                let realm = try! Realm()
//                
//                try! realm.write {
//                    
//                    let location = RealmLocation()
//                    location.name = name
//                    location.temperature = String(temp)
//                    location.tempMax = String(tempMax)
//                    location.tempMin = String(tempMin)
//                    location.desc = description
//                    location.icon = icon
//                    location.windSpeed = String(windSpeed)
//                    location.windDegree = String(windDeg)
//                    location.clouds = String(all)
//                    
//                    realm.add(location)
//                }
            }
        }
    }
    
    fileprivate func kelvinToFahrenheit(kelvin: Double) -> Double {
        var fahrenheit: Double?
        fahrenheit = 1.8 * (kelvin - 273) + 32
        return (fahrenheit?.rounded(toPlaces: 1))!
    }
}

