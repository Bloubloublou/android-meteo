//
//  ViewController.swift
//  ios-meteo
//
//  Created by Christelle on 22/11/2019.
//  Copyright © 2019 b_lagouge. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController,ApiCallerDelegate {
    
    private var apiCaller: ApiCaller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserPrefs.getInstance().addCity("Marseille")
        apiCaller = ApiCaller(self)
    apiCaller.updateForecasts(UserPrefs.getInstance().getCities())
        
        print("henlo list")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // adding one because the last one is the botom row
        //return UserPrefs.getInstance().getCities().count + 1
        return UserPrefs.getInstance().getCities().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityList = UserPrefs.getInstance().getCities()
        let forecast: InstantCityWeather = CitiesWeatherForecast.getInstance().getForecastFrom(cityList[indexPath.row])[0]
         
        //if(indexPath.row < cityList.count) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell
            
            cell.cityNameLabel.text = cityList[indexPath.row]
            cell.hourLabel.text = forecast.getWeatherDescription()
            cell.temperatureLabel.text = "\(forecast.getTemperatureInUnit(UnitEnum.METRIC))°"
            //cell.weatherImageView = TODO
        //} else {}
        return cell
    }
    
    func callHasFinished() {
        // nothing
    }
}

