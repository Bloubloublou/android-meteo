import Foundation

/// This class contains the forecast of all needed cities, for five days and every three hours (this has been chosen because  it is the max data we'll get if using the api for free)
public class CitiesWeatherForecast {
    static var instance: CitiesWeatherForecast?
    
    /// max stored data
    static public let MAX_NB_OF_DATA = 40
    
    private var forecasts: [String : [InstantCityWeather]]
    
    init() {
        forecasts = [:]
    }
    
    /// Gets the uniquecitiesweatherforecast object
    public static func getInstance() -> CitiesWeatherForecast {
        if(instance == nil) {
            instance = CitiesWeatherForecast()
        }
        return instance!
    }
    
    
    /// returns the min and max temperatures for one city and on day, in one peculiar unit
    /// - Parameter cityName: city name
    /// - Parameter indexOfDay: the index of the day, it needs to be from 0 to 4
    /// - Parameter unit: chosen unit
    
    public func getMinMaxTempOfDay(_ cityName: String,_ indexOfDay: Int,_ unit: UnitEnum) -> [Double]{
        let weatherArray: [InstantCityWeather] = forecasts[cityName]!
        let minDataIndex: Int = 8 * indexOfDay
        let maxDataIndex: Int = minDataIndex + 8

        var resultMin: Double = weatherArray[minDataIndex].getTemperatureInUnit(unit)
        var resultMax: Double = resultMin

        var temperatureAtI = 0.0
        for i in minDataIndex+1...maxDataIndex {
            temperatureAtI = weatherArray[i].getTemperatureInUnit(unit)
            resultMin = resultMin <  temperatureAtI ? resultMin : temperatureAtI
            resultMax = resultMax >  temperatureAtI ? resultMax : temperatureAtI
        }

        return [resultMin,resultMax]
    }
    
    /// Gets forecasts for one city
    /// - Parameter city: city name
    public func getForecastFrom(_ city: String) -> [InstantCityWeather] {
        return forecasts[city]!
    }
    
    /// Adds one forecast for a new city, or overwrites it
    /// - Parameter city: city name
    /// - Parameter weathers: forecast of city
    public func putForecast(_ city: String, _ weathers: [InstantCityWeather]) {
        forecasts[city] = weathers
    }
    
    /// remove forecasts for one city
    /// - Parameter city: city name
    public func deleteForecast(_ city: String) {
        forecasts[city] = nil
    }
}
