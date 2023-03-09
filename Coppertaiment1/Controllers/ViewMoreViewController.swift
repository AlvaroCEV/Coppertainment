//
//  ViewmoreViewController.swift
//  Coppertaiment1
//
//  Created by Apps2M on 13/2/23.
//

import Foundation
import UIKit

class ViewMoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITabBarControllerDelegate {
    
    
    
    @IBAction func Home(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: sender)
    }
    @IBAction func Profile(_ sender: Any) {
        performSegue(withIdentifier: "profile", sender: sender)
    }
    @IBAction func Basket(_ sender: Any) {
        performSegue(withIdentifier: "basket", sender: sender)
    }
    @IBOutlet var viewMoreTable: UITableView!
    
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
            let imageData = Data(base64Encoded: imageBase64String)
            let image = UIImage(data: imageData!)
            return image!
    }
    
    var games: [Game] = []
    
    let url = URL(string: "")
    func loadGames(){
        URLSession.shared.dataTask(with: url!) {(data, response, error) in
                    guard let data = data,
                          let response = response as? HTTPURLResponse,
                          response.statusCode == 200, error == nil else {return}
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                self.games.removeAll()
                for element in json as! [[String : Any]] {
                    self.games.append(Game(json: element))
                }
                DispatchQueue.main.async{
                    self.viewMoreTable.reloadData()
                }
            } catch let errorJson {
                print(errorJson)
            }
        }.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewMoreTable.dataSource = self
        viewMoreTable.delegate = self
        loadGames()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeRow: HomeRow = tableView.dequeueReusableCell(withIdentifier: "homeRowID", for: indexPath) as! HomeRow
        let gamess = games[indexPath.row]
  
        homeRow.portada.image = convertBase64StringToImage(imageBase64String: gamess.portada)
        homeRow.nombre.text = gamess.nombre
        
        
        return homeRow
    }
    
}
