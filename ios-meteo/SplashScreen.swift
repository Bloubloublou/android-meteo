import UIKit

class SplashScreen: UIViewController,ApiCallerDelegate{
    private var apiCaller: ApiCaller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        apiCaller = ApiCaller(self)
   
        apiCaller.updateForecasts(UserPrefs.getInstance().getCities())
    }
    
    func callHasFinished() {
        performSegue(withIdentifier: "launchToList", sender: self)
    }
}

