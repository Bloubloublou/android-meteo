import Foundation

class UserPrefs {
    static var instance: UserPrefs?
    let preferences = UserDefaults.standard
    
    static let PREFIX_KEY = "com.weather.KEY"
    static let CITIES_KEY = "\(PREFIX_KEY)_CITIES"
    
    public static func getInstance() -> UserPrefs {
        if(instance == nil) {
            instance = UserPrefs()
        }
        
        return instance!
    }
    
    public func addCity(_ city: String) {
        var cities:[String] = getCities()
        cities.append(city)
        setCities(cities)
        
    }
    
    public func setCities(_ cities: [String]) {
        preferences.set(cities, forKey: UserPrefs.CITIES_KEY)
        preferences.synchronize()
    }
    
    public func getCities() -> [String] {
        return preferences.array(forKey: UserPrefs.CITIES_KEY) as! [String]
    }
}
