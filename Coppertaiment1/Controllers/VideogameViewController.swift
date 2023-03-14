import UIKit
import Foundation

class VideogameViewController: UIViewController {
    
    var recibirJuegoFinal: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet var Consola: UIStackView!
    @IBOutlet var Precio: UILabel!
    @IBOutlet var stock: UILabel!
    @IBOutlet var VideoGame: UILabel!
    @IBOutlet var Genero: UILabel!
    
    @IBAction func Home(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: sender)
    }
    @IBAction func Profile(_ sender: Any) {
        performSegue(withIdentifier: "profile", sender: sender)
    }
    @IBAction func Basket(_ sender: Any) {
        performSegue(withIdentifier: "basket", sender: sender)
    }
    @IBAction func Comprar(_ sender: Any) {
        
    }
}
