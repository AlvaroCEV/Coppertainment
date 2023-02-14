//
//  Perfil1ViewController.swift
//  Coppertaiment1
//
//  Created by Apps2M on 10/2/23.
//

import UIKit

class Perfil1ViewController: UIViewController {
    
    @IBAction func botonHome(_ sender: UIButton) {
        performSegue(withIdentifier: "pantallaHome", sender: sender)
    }
    
    
    
    
    @IBAction func botonTienda(_ sender: UIButton) {
        performSegue(withIdentifier: "pantallaTienda", sender: sender)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    



}
