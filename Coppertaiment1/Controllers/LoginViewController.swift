import UIKit

import Foundation

class LoginViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func Login(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: sender)
    }
    
    @IBAction func RegisterPage(_ sender: Any) {
        performSegue(withIdentifier: "registerPage", sender: sender)
    }
    
    
}
