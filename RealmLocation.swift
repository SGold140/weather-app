//
//  RealmLocation.swift
//  weather-app
//
//  Created by Samuel Goldsmith on 5/29/19.
//  Copyright © 2019 Samuel Goldsmith. All rights reserved.
//

import Foundation
import RealmSwift

class RealmLocation: Object {
    @objc dynamic var name = ""
    @objc dynamic var temperature = ""
    @objc dynamic var tempMax = ""
    @objc dynamic var tempMin = ""
    @objc dynamic var desc = ""
    @objc dynamic var icon = ""
    @objc dynamic var windSpeed = ""
    @objc dynamic var windDegree = ""
    @objc dynamic var clouds = ""
}

