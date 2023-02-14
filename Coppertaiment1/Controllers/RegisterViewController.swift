import UIKit

import Foundation

class RegisterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Register(_ sender: Any) {
        performSegue(withIdentifier: "register", sender: sender)
    }
    
}
