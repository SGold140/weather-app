//
//  Location.swift
//  weather-app
//
//  Created by Samuel Goldsmith on 5/26/19.
//  Copyright © 2019 Samuel Goldsmith. All rights reserved.
//

import Foundation


struct Location {
    let name: String
    let temperature: String
    let tempMax: String
    let tempMin: String
    let description: String
    let icon: String
    let windDegree: String
    let windSpeed: String
    let clouds: String
    
    init(name: String, temperature: String, tempMax: String, tempMin: String, description: String, icon: String, windDegree: String, windSpeed: String, clouds: String) {
        self.name = name
        self.temperature = temperature
        self.tempMax = tempMax
        self.tempMin = tempMin
        self.description = description
        self.icon = icon
        self.windDegree = windDegree
        self.windSpeed = windSpeed
        self.clouds = clouds
    }
}
