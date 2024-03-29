import UIKit

import Foundation

class RegisterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet var newName: UITextField!
    @IBOutlet var newPassword: UITextField!

    @IBOutlet var confirmNewPassword: UITextField!
    
    
    @IBAction func Register(_ sender: Any) {
        
        
        let newUser : String = newName.text!
        let newPassword: String = newPassword.text!
        let confirmNewPassword: String = confirmNewPassword.text!
        
        let url = URL(string: "http://127.0.0.1:5000/coppertainment/profile/register")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        let postUser: [String : Any] = [
            "usuario" : newUser,
            "contrasena" : newPassword
        ]
        
        if newPassword == confirmNewPassword {
        
            struct ResponseObject<T: Decodable>: Decodable {
                let form: T
            }
            
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: postUser, options: .prettyPrinted)
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
                    let responseObject = try JSONDecoder().decode(ResponseObject<register>.self, from: data)
                    print(responseObject)
                } catch {
                    print(error) // parsing error
                    
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("responseString = \(responseString)")
                    } else {
                        print("unable to parse response as string")
                    }
                }
                DispatchQueue.main.async{
                    self.navigationController?.popToRootViewController(animated: true)
                }
            }
            task.resume()
        } else {
            return
        }
        
        performSegue(withIdentifier: "log", sender: sender)
    }
    
}
