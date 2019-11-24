import Foundation

///Enum which defines big families of weather.
public enum WeatherEnum {
    case THUNDERSTORM
    case DRIZZLE
    case RAIN
    case SNOW
    case CLEAR
    case CLOUDS

    public func getWeather(id: Int) -> WeatherEnum {
        let firstDigit = id / 100;

        switch (firstDigit) {
            case 2:
                return WeatherEnum.THUNDERSTORM
            case 3:
                return WeatherEnum.DRIZZLE
            case 5:
                return WeatherEnum.RAIN
            case 6:
                return WeatherEnum.SNOW
            case 8:
                if(id == 800) {
                    return WeatherEnum.CLEAR
                } else {
                    return WeatherEnum.CLOUDS
                }
            default:
                return WeatherEnum.CLEAR
        }
    }
}
