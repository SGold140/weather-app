//
//  DetailsViewController.swift
//  weather-app
//
//  Created by Samuel Goldsmith on 5/26/19.
//  Copyright © 2019 Samuel Goldsmith. All rights reserved.
//

import UIKit
import SnapKit
import MaterialComponents

class DetailsViewController: UIViewController {
    
    var location: Location!
    let card = MDCCard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard location != nil else { return }
        showWindAndClouds(location: self.location)
    }
    
    fileprivate func showWindAndClouds(location: Location) {
        makeCard()
        setWindAndClouds()
    }
    
    fileprivate func makeCard() {
        self.view.addSubview(card)
        card.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(self.view.frame.height).dividedBy(2.0)
            make.center.equalTo(self.view.snp.center)
        }
        card.setBorderColor(.white, for: .normal)
        card.backgroundColor = UIColor.lightGray
        card.setBorderWidth(2.0, for: .normal)
        card.setShadowElevation(.cardResting, for: .normal)
    }
    
    fileprivate func setWindAndClouds() {
        let windLabel = UILabel()
        let cloudsLabel = UILabel()
        card.addSubview(windLabel)
        card.addSubview(cloudsLabel)
        makeWindLabel(windLabel)
        makeCloudsLabel(cloudsLabel, windLabel)
    }
    
    fileprivate func makeWindLabel(_ windLabel: UILabel) {
        windLabel.snp.makeConstraints { (make) in
            make.width.equalTo(card.snp.width)
            make.height.equalTo(card.snp.height).dividedBy(2.0)
            make.top.equalTo(card.snp.top).offset(25.0)
            make.centerX.equalTo(card.snp.centerX)
        }
        setText(windLabel, text: "Wind Speed: \(location.windSpeed) - Degrees: \(location.windDegree)")
        setFont(windLabel, fontSize: 20.0)
        windLabel.textAlignment = .center
    }
    
    fileprivate func makeCloudsLabel(_ cloudsLabel: UILabel, _ windLabel: UILabel) {
        cloudsLabel.snp.makeConstraints { (make) in
            make.width.equalTo(card.snp.width)
            make.height.equalTo(card.snp.height).dividedBy(2.0)
            make.top.equalTo(windLabel.snp.bottom).offset(25.0)
            make.centerX.equalTo(card.snp.centerX)
        }
        setText(cloudsLabel, text: "Clouds: \(location.clouds)")
        setFont(windLabel, fontSize: 20.0)
        cloudsLabel.textAlignment = .center
    }
    
    fileprivate func setText(_ label: UILabel, text: String) {
        label.text = text
    }
    fileprivate func setFont(_ label: UILabel, fontSize: CGFloat) {
        label.font = UIFont(descriptor: .mdc_standardFontDescriptor(forMaterialTextStyle: .caption), size: fontSize)
    }
}
