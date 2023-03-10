
import Foundation
import UIKit

class PaymentViewController: UIViewController{
    
    var basketDataGame: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func Home(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: sender)
    }
    @IBAction func paymentConfirm(_ sender: Any) {
        performSegue(withIdentifier: "activation", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "activation" {
            let terceraVista = segue.destination as! GameActivationViewController
            terceraVista.buyData = basketDataGame
        }
    }
    
}
