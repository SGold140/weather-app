//
//  WeatherViewController.swift
//  weather-app
//
//  Created by Samuel Goldsmith on 5/26/19.
//  Copyright © 2019 Samuel Goldsmith. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

class WeatherViewController: UITableViewController {
    
    @IBOutlet var weatherTable: UITableView!
    
    let viewModel = WeatherViewModel()
    var locations: [Location] = []
    var realmLocations: Results<RealmLocation>?
    var idx: Int?
    let weatherToDetails = "weather_to_details"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTable.dataSource = self
        weatherTable.delegate = self
        viewModel.getLocations() { [weak self] (response) in
            self?.locations = response
//            let realm = try! Realm()
//            self?.realmLocations = realm.objects(RealmLocation.self).filter("name = %@ or name = %@ or name = %@", "Queens", "London", "Tokyo")
            DispatchQueue.main.async {
                self?.weatherTable.reloadData()
            }
        }
    }
}

extension WeatherViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTable.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as! WeatherTableViewCell
        cell.configure(location: locations[indexPath.row])
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.weatherTable.frame.height / 3.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let dvc = DetailsViewController()
        dvc.location = locations[indexPath.row]
//        let realm = try! Realm()
//        let location = realm.objects(RealmLocation.self).filter("name = %@", locations[indexPath.row])
        navigationController?.pushViewController(dvc, animated: true)
    }
}
