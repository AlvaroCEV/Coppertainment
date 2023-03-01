
import Foundation
import UIKit

class ControlPanelViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setPopUpButton()
    }
    @IBAction func Home(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: sender)
    }
    @IBAction func Basket(_ sender: Any) {
        performSegue(withIdentifier: "basket", sender: sender)
    }
    @IBOutlet weak var ProfileMenu: UIButton!
    
    func setPopUpButton(){
        let optionClosure = {(action: UIAction) in
            if action.title == "Orders" {
                self.performSegue(withIdentifier: "orders", sender: nil)
            }
            if action.title == "Wishlist" {
                self.performSegue(withIdentifier: "wishlist", sender: nil)
            }
            if action.title == "Abilities" {
                self.performSegue(withIdentifier: "abilities", sender: nil)
            }
        }
        ProfileMenu.menu = UIMenu(children : [
            UIAction(title: "Abilities", handler: optionClosure),
            UIAction(title: "Wishlist", handler: optionClosure),
            UIAction(title: "Orders", handler: optionClosure),
            UIAction(title: "Control panel", state: .on, handler: optionClosure)
        ])
        ProfileMenu.showsMenuAsPrimaryAction = true
        ProfileMenu.changesSelectionAsPrimaryAction = true
    }
    
}
