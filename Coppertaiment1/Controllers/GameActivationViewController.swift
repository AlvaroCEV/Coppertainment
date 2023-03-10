
import Foundation
import UIKit

class GameActivationViewController: UIViewController{
    
    var buyData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func Home(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: sender)
    }
    
    
    
}
