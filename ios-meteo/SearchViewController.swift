import UIKit

class SearchViewController: UIViewController,ApiCallerDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    var apiCaller: ApiCaller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.addTarget(self, action: #selector(self.textFieldDidReturn), for: .editingDidEndOnExit)

        apiCaller = ApiCaller(self)
    }
    
    @objc func textFieldDidReturn() {
        print("need to close")
        searchTextField.resignFirstResponder()
        if(searchTextField.text != "") {
              UserPrefs.getInstance().addCity(searchTextField.text!)
            apiCaller.updateForecasts(UserPrefs.getInstance().getCities())
        }
    }
    
    func callHasFinished() {
        performSegue(withIdentifier: "searchToList", sender: self)
    }
}

