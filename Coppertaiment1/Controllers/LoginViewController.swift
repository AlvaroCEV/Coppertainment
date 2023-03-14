import UIKit

import Foundation

class LoginViewController: UIViewController{
    
    static var usuario = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var general : String = ""
    @IBOutlet var name: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBAction func LOGIN(_ sender: Any) {
        struct ResponObject<T: Decodable>: Decodable {
            let form: T
        }
        //var Login: Bool = falses
        func loadUser(){
            let url = URL(string: "")
            var request = URLRequest(url: url!)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.httpMethod = "POST"
            let PostUser: [String : Any] = [
                "user" : name.text,
                "password": password.text
            ]
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                        guard let data = data,
                              let response = response as? HTTPURLResponse,
                              response.statusCode == 200, error == nil else {return}
                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: PostUser, options: .prettyPrinted)
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    self.general = json as! String
                } catch let errorJson {
                    print(errorJson)
                }
            }.resume()
            if general == "True" {
                LoginViewController.usuario = name.text!
                performSegue(withIdentifier: "login", sender: sender)
            }
        }
    }
    
    
    
    @IBAction func RegisterPage(_ sender: Any) {
        performSegue(withIdentifier: "registerPage", sender: sender)
    }
}


