//
//  WeatherTableViewCell.swift
//  weather-app
//
//  Created by Samuel Goldsmith on 5/26/19.
//  Copyright © 2019 Samuel Goldsmith. All rights reserved.
//

import UIKit
import SnapKit
import MaterialComponents

class WeatherTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let weatherIcon = UIImageView()
    let tempLabel = UILabel()
    let highLowLabel = UILabel()
    let offset = 5.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for sv in [titleLabel, tempLabel, highLowLabel, weatherIcon] {
            self.addSubview(sv)
        }
    }
    
    func configure(location: Location) {
        setFonts()
        setTitle(name: location.name)
        setImage(icon: location.icon)
        setTemperature(temp: location.temperature)
        setHighLow(high: location.tempMax, low: location.tempMin)
    }
    
    fileprivate func setFonts() {
        for label in [titleLabel, tempLabel, highLowLabel] {
            label.textColor = UIColor.darkGray
        }
        titleLabel.font = UIFont(descriptor: .mdc_standardFontDescriptor(forMaterialTextStyle: .title), size: 24.0)
        tempLabel.font = UIFont(descriptor: .mdc_standardFontDescriptor(forMaterialTextStyle: .headline), size: 20.0)
        highLowLabel.font = UIFont(descriptor: .mdc_standardFontDescriptor(forMaterialTextStyle: .subheadline), size: 18.0)
    }

    fileprivate func setTitle(name: String) {
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.snp.top).offset(offset)
        }
        titleLabel.text = "\(name.uppercased())"
    }
    
    fileprivate func setImage(icon: String) {
        weatherIcon.snp.makeConstraints { (make) in
            make.top.equalTo(tempLabel.snp.bottom).offset(offset)
            make.centerX.equalTo(self.snp.centerX)
            make.height.width.equalTo(self.snp.height).dividedBy(2.0)
        }
        weatherIcon.image = UIImage(named: icon)
        
        
    }
    fileprivate func setTemperature(temp: String) {
       
        tempLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(offset)
            make.centerX.equalTo(self.snp.centerX)
        }
        tempLabel.text = "\(temp)°"
    }
    
    fileprivate func setHighLow(high: String, low: String) {
        
        highLowLabel.snp.makeConstraints { (make) in
            make.top.equalTo(weatherIcon.snp.bottom).offset(offset)
            make.centerX.equalTo(self.snp.centerX)
        }
        highLowLabel.text = "\(high)°/\(low)°"
    }
    
}
