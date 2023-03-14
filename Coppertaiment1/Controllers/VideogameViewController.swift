import UIKit
import Foundation

class VideogameViewController: UIViewController {
    
    var recibirJuegoFinal: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet var GameImage: UIImageView!
    @IBOutlet var Precio: UILabel!
    @IBOutlet var VideoGame: UILabel!
    @IBOutlet var Genero: UILabel!
    @IBOutlet var Consola: UILabel!
    @IBOutlet var Visuales: UIImageView!
    
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
    
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
            let imageData = Data(base64Encoded: imageBase64String)
            let image = UIImage(data: imageData!)
            return image!
    }
    
    var general: gameInfo?
    
    func loadControlPanel(){
        let url = URL(string: "")
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        let getGame: [String : Any] = [
            "videogame" : recibirJuegoFinal?.nombre
        ]
        URLSession.shared.dataTask(with: url!) { [self](data, response, error) in
                    guard let data = data,
                          let response = response as? HTTPURLResponse,
                          response.statusCode == 200, error == nil else {return}
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: getGame, options: .prettyPrinted)
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                general = gameInfo(json: json as! [String : Any])
                let C = self.general?.plataforma
                Consola.text = C
                let P = self.general?.precio
                Precio.text = P
                let G = self.general?.genero
                Genero.text = G
                let VG = self.general?.nombre
                VideoGame.text = VG
                let IM = self.general?.portada
                GameImage.image = convertBase64StringToImage(imageBase64String: IM!)
                
            } catch let errorJson {
                print(errorJson)
            }
        }.resume()
    }
    
    
}

