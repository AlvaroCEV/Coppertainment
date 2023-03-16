import UIKit

import Foundation

class LoginViewController: UIViewController{
    
    static var usuario = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet var name: UITextField!
    @IBOutlet var password: UITextField!
    
    func loadUser(){
        let url = URL(string: "http://127.0.0.1:5000/coppertainment/profile/login")
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        let PostUser: [String : Any] = [
            "usuario" : name.text!,
            "contrasena": password.text!
        ]
            struct ResponseObject<T: Decodable>: Decodable {
                let form: T
            }
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: PostUser, options: .prettyPrinted)
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
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : Any]
                    DispatchQueue.main.async {
                        if json["response"] as! String == "true" {
                            LoginViewController.usuario = self.name.text!
                            self.performSegue(withIdentifier: "login", sender: nil)
                        }else {
                            print("NO VA")
                            print(type(of: "true"))
                            print(type(of: json))
                            
                        }
                    }
                    
                    
                } catch {
                    print(error) // parsing error
                    let responseString = String(data: data, encoding: .utf8)
                        print("1")
                        print(responseString!)
                    print(type(of: responseString!))

                    
                }
                DispatchQueue.main.async{
                    self.navigationController?.popToRootViewController(animated: true)
                }
            }
            task.resume()
    }
    
    @IBAction func LOGIN(_ sender: Any) {
        loadUser()
    }
    
    
    
    @IBAction func RegisterPage(_ sender: Any) {
        performSegue(withIdentifier: "registerPage", sender: sender)
    }
}


//guard let url =  URL(string:"http://127.0.0.1:5000/coppertainment/profile/login")
//else{
//    return
//}
//
////### This is a little bit simplified. You may need to escape `username` and `password` when they can contain some special characters...
//let body = "username=\(name.text!)&password=\(password.text!)"
//let finalBody = body.data(using: .utf8)
//var request = URLRequest(url: url)
//request.httpMethod = "POST"
//request.httpBody = finalBody
//
//URLSession.shared.dataTask(with: request){
//    (data, response, error) in
//    print(response as Any)
//    if let error = error {
//        print(error)
//        return
//    }
//    guard let data = data else{
//        return
//    }
//
//    if String(data: data, encoding: .utf8) == "True" {
//        LoginViewController.usuario = self.name.text!
//        self.performSegue(withIdentifier: "login", sender: nil)
//    }
//    print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
//
//}.resume()
//}
