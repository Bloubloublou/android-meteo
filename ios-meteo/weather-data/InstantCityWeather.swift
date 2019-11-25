import Foundation

public class InstantCityWeather {
    private var weather: Int
    private var weatherDescription: String
    /// we get the temperature in kelvin since the api give us this metrics by default. It's more efficient to re-compute new temperatures by hand than making an api call each time the user wants to switch temperature unit
    private var kelvinTemperature: Double
    private var humidity: Int
    private var windSpeed: Int
    private var pressure: Int
    
    public init(_ weather: Int,_ weatherDescription: String, _ kelvinTemperature: Double, _ humidity: Int, _ windSpeed: Int, _ pressure: Int) {
        self.weather = weather
        self.weatherDescription = weatherDescription
        self.kelvinTemperature = kelvinTemperature
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.pressure = pressure
    }
    
    /// Getting the temperature in a peculiar unit (see unit at https://openweathermap.org/weather-data)
    /// - Parameter unit: chosen unit
    public func getTemperatureInUnit(_ unit: UnitEnum) -> Double {
        switch (unit) {
        case UnitEnum.IMPERIAL:
            return round((kelvinTemperature-273.15)*9/5+32)
            case UnitEnum.METRIC:
                return round(kelvinTemperature-273.15)
            default:
                return  kelvinTemperature
        }
    }

    public func getWeather() -> Int {
        return weather
    }

    public func getHumidity() -> Int {
        return humidity
    }

    public func getWindSpeed() -> Int {
        return windSpeed
    }

    public func getPressure() -> Int {
        return pressure
    }

    public func getWeatherDescription() -> String {
        return weatherDescription
    }
}

