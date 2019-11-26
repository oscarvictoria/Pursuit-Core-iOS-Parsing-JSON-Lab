//
//  DetailWeatherController.swift
//  Parsing_JSON_Lab
//
//  Created by Oscar Victoria Gonzalez  on 11/26/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class DetailWeatherController: UIViewController {
    
    @IBOutlet weak var detailTemperatureLabel: UILabel!
    @IBOutlet weak var detailWeatherLabel: UILabel!
    
    var currentWeather: CurrentWeather?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    func updateUI() {
        guard let weather = currentWeather else {
            fatalError("error")
        }
        navigationItem.title = weather.name
        detailTemperatureLabel.text = ("\(weather.main["temp"]?.description ?? "0") ℃ ")
        detailWeatherLabel.text = weather.weather[0].description
    }

}
