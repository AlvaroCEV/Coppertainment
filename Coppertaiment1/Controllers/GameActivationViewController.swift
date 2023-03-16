
import Foundation
import UIKit

class GameActivationViewController: UIViewController{
    
    var buyData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GameActivation()
    }
    @IBAction func Home(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: sender)
    }
    @IBOutlet var gameImage: UIImageView!
    
    @IBOutlet var gameName: UILabel!
    
    @IBOutlet var gamePlatform: UILabel!
    
    @IBOutlet var gameFinalPrice: UILabel!
   
    @IBOutlet var gameCode: UILabel!
    
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
            let imageData = Data(base64Encoded: imageBase64String)
            let image = UIImage(data: imageData!)
            return image!
    }
    
    var gameData: ordersInfo?
    
    func GameActivation(){
        
        
        let url = URL(string: "")
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        let getGame: [String : Any] = [
            "videogame" : buyData.first!
        ]
            struct ResponseObject<T: Decodable>: Decodable {
                let form: T
            }
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: getGame, options: .prettyPrinted)
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
                    request.httpBody = try JSONSerialization.data(withJSONObject: getGame, options: .prettyPrinted)
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    self.gameData = ordersInfo(json: json as! [String : Any])
                    let C = self.gameData?.plataforma
                    self.gamePlatform.text = C
                    let P = self.gameData?.precio
                    self.gameFinalPrice.text = P
                    let G = self.gameData?.code
                    self.gameCode.text = G
                    let VG = self.gameData?.nombre
                    self.gameName.text = VG
                    let IM = self.gameData?.portada
                    self.gameImage.image = self.convertBase64StringToImage(imageBase64String: IM!)
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
