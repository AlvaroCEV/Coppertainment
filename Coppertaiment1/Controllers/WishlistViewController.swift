
import Foundation
import UIKit

class WishlistViewController: UIViewController{
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
    @IBOutlet weak var WishlistMenu: UIButton!
    
    func setPopUpButton(){
        let optionClosure = {(action: UIAction) in
            if action.title == "Control panel" {
                self.performSegue(withIdentifier: "CP", sender: nil)
            }
            if action.title == "Orders" {
                self.performSegue(withIdentifier: "orders", sender: nil)
            }
            if action.title == "Abilities" {
                self.performSegue(withIdentifier: "abilities", sender: nil)
            }
        }
        WishlistMenu.menu = UIMenu(children : [
            UIAction(title: "Control panel", handler: optionClosure),
            UIAction(title: "Orders", handler: optionClosure),
            UIAction(title: "Wishlist", state: .on, handler: optionClosure),
            UIAction(title: "Abilities", handler: optionClosure)
        ])
        WishlistMenu.showsMenuAsPrimaryAction = true
        WishlistMenu.changesSelectionAsPrimaryAction = true
    }
}
