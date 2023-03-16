
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
        let url = URL(string: "")
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        let SendUser: [String : Any] = [
            "usuario" : LoginViewController.usuario
        ]
            struct ResponseObject<T: Decodable>: Decodable {
                let form: T
            }
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: SendUser, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard
                    let data = data,
                    let response = response as? HTTPURLResponse,
                    error == nil
                else {                                                               // check for fundamental networking error
                    print("error", error ?? URLError(.badServerResponse))
                    return
                }
                
                // do whatever you want with the `data`, e.g.:
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    self.general = generalData(json: json as! [String : Any])
                    let WL = self.general?.wishlist.count
                    self.wishlistNumero.text = String(describing: WL)
                    let GM = self.general?.pedidos.count
                    self.gamesNumero.text = String(describing: GM)
                    let PT = self.general?.puntos
                    self.puntosNumero.text = PT
                    let WT = self.general?.puntos
                    self.walletNumero.text = WT
                } catch {
                    print(error) // parsing error
                    
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("responseString = \(responseString)")
                    } else {
                        print("unable to parse response as string")
                    }
                }
            }
            task.resume()
    }
    

    
}
