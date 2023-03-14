
import Foundation
import UIKit

class ControlPanelViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setPopUpButton()
        loadControlPanel()
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
    
   
    
    @IBOutlet var wishlistNumero: UILabel!
    @IBOutlet var gamesNumero: UILabel!
    @IBOutlet var puntosNumero: UILabel!
    @IBOutlet var walletNumero: UILabel!
    var general: generalData?
    
    let url = URL(string: "")
    func loadControlPanel(){
        URLSession.shared.dataTask(with: url!) { [self](data, response, error) in
                    guard let data = data,
                          let response = response as? HTTPURLResponse,
                          response.statusCode == 200, error == nil else {return}
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                general = generalData(json: json as! [String : Any])
                let WL = self.general?.wishlist.count
                wishlistNumero.text = String(describing: WL)
                let GM = self.general?.pedidos.count
                gamesNumero.text = String(describing: GM)
                let PT = self.general?.puntos
                puntosNumero.text = PT
                let WT = self.general?.puntos
                walletNumero.text = WT
                
            } catch let errorJson {
                print(errorJson)
            }
        }.resume()
    }
    

    
}
