//
//  LogInViewController.swift
//  Coppertaiment1
//
//  Created by Apps2M on 10/2/23.
//

import UIKit

class LogInViewController: UIViewController {
    
    
    @IBOutlet var inputNombre: UITextField!
    
    
    @IBOutlet var inputContraseña: UITextField!
    
    
    @IBAction func Home(_ sender: UIButton) {
        performSegue(withIdentifier: "pantallaHome", sender: sender)
    }
    
    @IBAction func pantallaCrearUsuario(_ sender: UIButton) {
        performSegue(withIdentifier: "pantallaCrearUsuario", sender: sender)
    }
    
    
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pantallaHome" {
            let svc = segue.destination as? HomeViewController
        }
        if segue.identifier == "pantallaCrearUsuario" {
            let svc = segue.destination as? CrearUsuarioViewController
        }
    }


}
