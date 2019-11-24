import Foundation

public class ApiCaller {
    private let API_KEY = "7b5e590c39152ca6c17f04f0c32fd980"
    private let FORECAST_WEATHER = "https://api.openweathermap.org/data/2.5/forecast?q="
    
    /// Getting datas from cities array
    /// - Parameter cities: wanted cities
    public func updateForecasts(_ cities : [String]) {
        for city in cities {
            let session = URLSession.shared
            let weatherURL = URL(string: "\(FORECAST_WEATHER)\(city)&APPID=\(API_KEY)")!
            let dataTask = session.dataTask(with: weatherURL) {
                (data: Data?, response: URLResponse?, error: Error?) in
                if let error = error {
                    print("Error:\n\(error)")
                }
                else {
                    if let data = data {
                        let dataString = String(data: data, encoding: String.Encoding.utf8)
                        print("Response is :\n\(dataString!)")
                        if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                            CitiesWeatherForecast.getInstance().putForecast(city, self.jsonToForecast(jsonObj))
                            
                            print("blou \(CitiesWeatherForecast.getInstance().getForecastFrom(city)[0].getTemperatureInUnit(UnitEnum.METRIC))")
                        } else {
                            print("Error: unable to convert json data")
                        }
                    } else {
                        print("Error: did not receive data")
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    /// Extracts forecasts for one city from a json object
    /// - Parameter json: given json
    private func jsonToForecast(_ json: NSDictionary) -> [InstantCityWeather]{
        var forecasts = [InstantCityWeather](repeating: InstantCityWeather(0, "", 0.0, 0, 0, 0),count: 40)
        let tmpArray = json["list"] as! [NSDictionary]
        
        var weather: NSDictionary
        var main: NSDictionary
        var wind: NSDictionary
        for i in 0...CitiesWeatherForecast.MAX_NB_OF_DATA-1 {
            weather = (tmpArray[i]["weather"] as! [NSDictionary])[0]
            main = tmpArray[i]["main"] as! NSDictionary
            wind = tmpArray[i]["wind"] as! NSDictionary
            
            forecasts[i] = InstantCityWeather(weather.value(forKey: "id") as! Int,
                                             weather.value(forKey: "description") as! String,
                                             main.value(forKey: "temp") as! Double,
                                             main.value(forKey: "humidity") as! Int,
                                             (wind.value(forKey: "speed") as! NSNumber).intValue,
                                             main.value(forKey: "pressure") as! Int)
        }
        
        return forecasts
    }
}
