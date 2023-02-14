//
//  HomeViewController.swift
//  Coppertaiment1
//
//  Created by Apps2M on 10/2/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBAction func botonPerfil(_ sender: UIButton) {
        performSegue(withIdentifier: "pantallaPerfil1", sender: sender)
    }
    
    @IBAction func botonTienda(_ sender: UIButton) {
        performSegue(withIdentifier: "pantallaTienda", sender: sender)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pantallaPerfil1" {
            let svc = segue.destination as? Perfil1ViewController
        }
        if segue.identifier == "pantallaTienda" {
            let svc = segue.destination as? TiendaViewController
        }
    }


}
