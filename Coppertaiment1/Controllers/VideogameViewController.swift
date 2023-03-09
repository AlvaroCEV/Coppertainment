import UIKit
import Foundation

class VideogameViewController: UIViewController {
    
    var recibirJuegoFinal: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Home(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: sender)
    }
    @IBAction func Profile(_ sender: Any) {
        performSegue(withIdentifier: "profile", sender: sender)
    }
    @IBAction func Basket(_ sender: Any) {
        performSegue(withIdentifier: "basket", sender: sender)
    }
}
