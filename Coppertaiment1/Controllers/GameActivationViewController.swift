
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
    @IBOutlet var gameImage: UIImageView!
    
    @IBOutlet var gameName: UILabel!
    
    @IBOutlet var gamePlatform: UILabel!
    
    @IBOutlet var gameFullPrice: UILabel!
    
    @IBOutlet var gameDiscount: UILabel!
    
    @IBOutlet var gameFinalPrice: UILabel!
   
    @IBOutlet var gameCode: UILabel!
    
    
    
    
    
}
