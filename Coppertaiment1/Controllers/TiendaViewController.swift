//
//  TiendaViewController.swift
//  Coppertaiment1
//
//  Created by Apps2M on 10/2/23.
//

import UIKit

class TiendaViewController: UIViewController {
    
    @IBAction func botonHome(_ sender: UIButton) {
        performSegue(withIdentifier: "pantallaHome", sender: sender)
    }
    
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "pantallaHome" {
            let svc = segue.destination as? HomeViewController
        }
    }


}
