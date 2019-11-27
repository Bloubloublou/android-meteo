//
//  ViewController.swift
//  ios-meteo
//
//  Created by Christelle on 22/11/2019.
//  Copyright © 2019 b_lagouge. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController,ApiCallerDelegate {
    
    @IBOutlet var cityTableView: UITableView!
    
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
        return UserPrefs.getInstance().getCities().count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let unit = UserPrefs.getInstance().isImperial() ? UnitEnum.IMPERIAL : UnitEnum.METRIC
        
        if(indexPath.row < UserPrefs.getInstance().getCities().count) {
            let forecast: InstantCityWeather = CitiesWeatherForecast.getInstance().getForecastFrom(UserPrefs.getInstance().getCities()[indexPath.row])[0]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell
                
            cell.cityNameLabel.text = UserPrefs.getInstance().getCities()[indexPath.row]
            cell.hourLabel.text = forecast.getWeatherDescription()
            cell.temperatureLabel.text = "\(forecast.getTemperatureInUnit(unit))°"
            cell.weatherImageView.image = UIImage(named:WeatherEnum.getWeather(forecast.getWeather()).getImageName())
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "bottomCell", for: indexPath) as! BottomCell
            
            cell.switchDegreeCallBack = self.switchDegree
            // TODO
            return cell
        }
    }
    
    func callHasFinished() {
        // nothing
    }
    
    public func switchDegree() {
       print("henlo clicked !")
        UserPrefs.getInstance().setIsImperial(!UserPrefs.getInstance().isImperial())
        
        cityTableView.reloadData()
    }
}

