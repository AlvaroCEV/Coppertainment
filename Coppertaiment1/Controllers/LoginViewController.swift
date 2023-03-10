import UIKit

import Foundation

class LoginViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Login(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: sender)
    }
    
    @IBAction func login(_ sender: Any) {
        struct ResponObject<T: Decodable>: Decodable {
            let form: T
        }
        
        //var Login: Bool = false
        
        let url = URL(string: "https://superapi.netlify.app/api/login")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        let postUsers: [String : Any] = [
            "user" : loginName.text!,
            "pass" : loginPassword.text!
        ]
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: postUsers, options: .prettyPrinted)
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
            
            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }
            
            // do whatever you want with the `data`, e.g.:
            
            do {
                let responseObject = try JSONDecoder().decode(ResponObject<login>.self, from: data)
                print(responseObject)
            } catch {
                print(error) // parsing error
                
                if let responseString = String(data: data, encoding: .utf8) {
                    print("responseString = \(responseString)")
                    DispatchQueue.main.async{
                        self.performSegue(withIdentifier: "CorrectUser", sender: sender)
                    }
                } else {
                    print("unable to parse response as string")
                }
            }
        }
        
        
        task.resume()
    }
    @IBOutlet var loginPassword: UITextField!
    @IBOutlet var loginName: UITextField!
    @IBAction func RegisterPage(_ sender: Any) {
        performSegue(withIdentifier: "registerPage", sender: sender)
    }
    
    
    
    

    
    
}


