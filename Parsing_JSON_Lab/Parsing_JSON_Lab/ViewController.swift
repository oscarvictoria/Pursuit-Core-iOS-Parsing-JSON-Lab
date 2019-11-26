//
//  ViewController.swift
//  Parsing_JSON_Lab
//
//  Created by Oscar Victoria Gonzalez  on 11/25/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var theWeather = [CurrentWeather]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        theWeather = WeatherData.getWeather()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let weatherDVC = segue.destination as? DetailWeatherController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("err,err")
        }
        let weather = theWeather[indexPath.row]
        weatherDVC.currentWeather = weather
    }

}
extension ViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        let weather = theWeather[indexPath.row]
        
        cell.textLabel?.text = weather.name
        cell.backgroundColor = .systemRed
        return cell
    }
}
