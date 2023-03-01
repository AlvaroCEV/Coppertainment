
import Foundation
import UIKit

class AbilitiesViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setPopUpButton()
    }
    @IBAction func Home(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: sender)
    }
    @IBAction func Profile(_ sender: Any) {
        performSegue(withIdentifier: "CP", sender: sender)
    }
    @IBAction func Basket(_ sender: Any) {
        performSegue(withIdentifier: "basket", sender: sender)
    }
    @IBOutlet weak var AbilitiesMenu: UIButton!
    
    func setPopUpButton(){
        let optionClosure = {(action: UIAction) in
            if action.title == "Orders" {
                self.performSegue(withIdentifier: "orders", sender: nil)
            }
            if action.title == "Wishlist" {
                self.performSegue(withIdentifier: "wishlist", sender: nil)
            }
            if action.title == "Control panel" {
                self.performSegue(withIdentifier: "CP", sender: nil)
            }
        }
        AbilitiesMenu.menu = UIMenu(children : [
            UIAction(title: "Control panel", handler: optionClosure),
            UIAction(title: "Orders", handler: optionClosure),
            UIAction(title: "Wishlist", handler: optionClosure),
            UIAction(title: "Abilities", state: .on, handler: optionClosure)
        ])
        AbilitiesMenu.showsMenuAsPrimaryAction = true
        AbilitiesMenu.changesSelectionAsPrimaryAction = true
    }
    @IBAction func Ability5(_ sender: Any) {
        performSegue(withIdentifier: "abilityInfo", sender: sender)
    }
}
