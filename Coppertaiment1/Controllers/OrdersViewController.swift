
import Foundation
import UIKit

class OrdersViewController: UIViewController{
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
    @IBOutlet weak var OrdersMenu: UIButton!
    
    func setPopUpButton(){
        let optionClosure = {(action: UIAction) in
            if action.title == "Control panel" {
                self.performSegue(withIdentifier: "CP", sender: nil)
            }
            if action.title == "Wishlist" {
                self.performSegue(withIdentifier: "wishlist", sender: nil)
            }
            if action.title == "Abilities" {
                self.performSegue(withIdentifier: "abilities", sender: nil)
            }
        }
        OrdersMenu.menu = UIMenu(children : [
            UIAction(title: "Control panel", handler: optionClosure),
            UIAction(title: "Orders", state: .on, handler: optionClosure),
            UIAction(title: "Wishlist", handler: optionClosure),
            UIAction(title: "Abilities", handler: optionClosure)
        ])
        OrdersMenu.showsMenuAsPrimaryAction = true
        OrdersMenu.changesSelectionAsPrimaryAction = true
    }
}
