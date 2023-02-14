
import Foundation
import UIKit

class ControlPanelViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func Home(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: sender)
    }
    @IBAction func Basket(_ sender: Any) {
        performSegue(withIdentifier: "basket", sender: sender)
    }
    
}
