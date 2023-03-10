

import Foundation
import UIKit

class BasketViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        BasketTableView.dataSource = self
        BasketTableView.delegate = self
        WishlistTableView.dataSource = self
        WishlistTableView.delegate = self
        loadGamesBasket()
        loadGamesWishlist()
    }
    var gameData: [String] = []
    
    @IBAction func Home(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: sender)

    }
    
    @IBAction func Payment(_ sender: Any) {
        performSegue(withIdentifier: "payment", sender: sender)
    }
    @IBOutlet var BasketTableView: UITableView!
    
    @IBOutlet var WishlistTableView: UITableView!
    
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
            let imageData = Data(base64Encoded: imageBase64String)
            let image = UIImage(data: imageData!)
            return image!
    }
    
    var gamesBasket: [basket] = []
    var gamesWishlist: [basket] = []
    
    
    func loadGamesBasket(){
        let url = URL(string: "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh")
        URLSession.shared.dataTask(with: url!) {(data, response, error) in
                    guard let data = data,
                          let response = response as? HTTPURLResponse,
                          response.statusCode == 200, error == nil else {return}
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                self.gamesBasket.removeAll()
                for element in json as! [[String : Any]] {
                    self.gamesBasket.append(basket(json: element))
                }
                DispatchQueue.main.async{
                    self.BasketTableView.reloadData()
                }
            } catch let errorJson {
                print(errorJson)
            }
        }.resume()
    }
    
    func loadGamesWishlist(){
        let url = URL(string: "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh")
        URLSession.shared.dataTask(with: url!) {(data, response, error) in
                    guard let data = data,
                          let response = response as? HTTPURLResponse,
                          response.statusCode == 200, error == nil else {return}
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                self.gamesWishlist.removeAll()
                for element in json as! [[String : Any]] {
                    self.gamesWishlist.append(basket(json: element))
                }
                DispatchQueue.main.async{
                    self.WishlistTableView.reloadData()
                }
            } catch let errorJson {
                print(errorJson)
            }
        }.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case WishlistTableView:
            return gamesWishlist.count
        case BasketTableView:
            return gamesBasket.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableView {
        case WishlistTableView:
            let wishlistBasketRow: WishlistBasketRow = tableView.dequeueReusableCell(withIdentifier: "wishlistBaskewtRowID", for: indexPath) as! WishlistBasketRow
            let wishlistBasketGame = gamesWishlist[indexPath.row]
      
            wishlistBasketRow.wishlistBaskerImageGames.image = convertBase64StringToImage(imageBase64String: wishlistBasketGame.portada)
            wishlistBasketRow.wishlistBasketNameGames.text = wishlistBasketGame.nombre
            wishlistBasketRow.wishlistBasketPriceGames.text = wishlistBasketGame.precio

            return wishlistBasketRow
        case BasketTableView:
            let basketRow: BasketRow = tableView.dequeueReusableCell(withIdentifier: "basketRowID", for: indexPath) as! BasketRow
            let basketGame = gamesBasket[indexPath.row]
      
            basketRow.basketImageGames.image = convertBase64StringToImage(imageBase64String: basketGame.portada)
            basketRow.basketNameGames.text = basketGame.nombre
            basketRow.basketPriceGames.text = basketGame.precio
            gameData.append(basketRow.basketNameGames.text!)
            return basketRow
        default: return UITableViewCell()
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "payment" {
            let segundaVista = segue.destination as! PaymentViewController
            segundaVista.basketDataGame = gameData
        }
    }
    
}
