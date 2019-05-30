//
//  Extensions.swift
//  weather-app
//
//  Created by Samuel Goldsmith on 5/29/19.
//  Copyright © 2019 Samuel Goldsmith. All rights reserved.
//

import Foundation

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
