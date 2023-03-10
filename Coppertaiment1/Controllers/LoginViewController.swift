import UIKit

import Foundation

class LoginViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    var userName: [login] = []
    
    var userPass: [login] = []
    
    @IBAction func LOGIN(_ sender: Any) {
        struct ResponObject<T: Decodable>: Decodable {
            let form: T
        }

        //var Login: Bool = false
        let url = URL(string: "")
        func loadGames(){
            URLSession.shared.dataTask(with: url!) {(data, response, error) in
                        guard let data = data,
                              let response = response as? HTTPURLResponse,
                              response.statusCode == 200, error == nil else {return}
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    self.userName.removeAll()
                    for element in json as! [[String : Any]] {
                        self.userName.append(login(json: element))
                    }
                    //self.userPass.removeAll()
                    //for element in json as! [[String : Any]] {
                    //    self.userPass.append(login(json: element))
                    //}
                } catch let errorJson {
                    print(errorJson)
                }
            }.resume()
        }
        if {
            performSegue(withIdentifier: "login", sender: sender)
        }
    }
    @IBOutlet var loginPassword: UITextField!
    @IBOutlet var loginName: UITextField!

    
    @IBAction func RegisterPage(_ sender: Any) {
        performSegue(withIdentifier: "registerPage", sender: sender)
    }
    

    
    
    

    
    
}


