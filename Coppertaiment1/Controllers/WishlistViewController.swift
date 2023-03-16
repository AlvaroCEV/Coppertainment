
import Foundation
import UIKit

class WishlistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        setPopUpButton()
        loadWishlistGames()
        ordersTableView.dataSource = self
        ordersTableView.delegate = self
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
            UIAction(title: "Abilities", handler: optionClosure),
            UIAction(title: "Wishlist", state: .on, handler: optionClosure),
            UIAction(title: "Orders", handler: optionClosure),
            UIAction(title: "Control panel", handler: optionClosure)
                    ])
        WishlistMenu.showsMenuAsPrimaryAction = true
        WishlistMenu.changesSelectionAsPrimaryAction = true
    }
    @IBOutlet var ordersTableView: UITableView!
    
    var games: [littleGameInfo] = []
    
    let url = URL(string: "")
    func loadWishlistGames(){
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
                    self.games.removeAll()
                    for element in json as! [[String : Any]] {
                        self.games.append(littleGameInfo(json: element))
                    }
                    DispatchQueue.main.async{
                        self.ordersTableView.reloadData()
                    }
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
    
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
            let imageData = Data(base64Encoded: imageBase64String)
            let image = UIImage(data: imageData!)
            return image!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let wishlistRow: WishlistRow = tableView.dequeueReusableCell(withIdentifier: "wishlistRowID", for: indexPath) as! WishlistRow
        let gamess = games[indexPath.row]
  
        wishlistRow.WishlistImageRow.image = convertBase64StringToImage(imageBase64String: gamess.portada)
        wishlistRow.WishlistNameRow.text = gamess.nombre
        wishlistRow.WishlistPriceRow.text = gamess.precio
        wishlistRow.WishlistConsolaRow.text = gamess.consola
        
        
        
        return wishlistRow
    }
}
