
import Foundation
import UIKit

class HomeViewController: UIViewController{
    @IBAction func Profile(_ sender: UIButton) {
        performSegue(withIdentifier: "profile", sender: sender)
    }
    @IBAction func Basket(_ sender: Any) {
        performSegue(withIdentifier: "basket", sender: sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
