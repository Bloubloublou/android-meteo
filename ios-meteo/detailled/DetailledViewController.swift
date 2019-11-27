import UIKit

class DetailledViewController: UIViewController,ApiCallerDelegate{
    private var apiCaller: ApiCaller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("henlo launch")
        UserPrefs.getInstance().addCity("Marseille")
        apiCaller = ApiCaller(self)
   
        apiCaller.updateForecasts(UserPrefs.getInstance().getCities())
    }
    
    func callHasFinished() {
        print("henlo segue")
        performSegue(withIdentifier: "launchToList", sender: self)
    }
}

