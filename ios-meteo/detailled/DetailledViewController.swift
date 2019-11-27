import UIKit

class DetailledViewController: UIViewController {
    public var id:Int!
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var degree: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let unit = UserPrefs.getInstance().isImperial() ? UnitEnum.IMPERIAL : UnitEnum.METRIC
        cityName.text = UserPrefs.getInstance().getCities()[id]
        hourLabel.text = CitiesWeatherForecast.getInstance().getForecastFrom(cityName.text!)[0].getWeatherDescription()
        degree.text = "\(CitiesWeatherForecast.getInstance().getForecastFrom(cityName.text!)[0].getTemperatureInUnit(unit))°"
    }
}

