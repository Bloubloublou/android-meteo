import UIKit

class LaunchScreenViewController: UIViewController {
    
    private var apiCaller: ApiCaller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO remove
        UserPrefs.getInstance().addCity("Marseille")
        apiCaller = ApiCaller()
        apiCaller.updateForecasts(UserPrefs.getInstance().getCities())
        print("called api")
    }
}

