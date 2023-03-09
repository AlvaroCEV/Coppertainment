//
//  ViewmoreViewController.swift
//  Coppertaiment1
//
//  Created by Apps2M on 13/2/23.
//

import Foundation
import UIKit

class ViewMoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITabBarControllerDelegate {
    
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
            let imageData = Data(base64Encoded: imageBase64String)
            let image = UIImage(data: imageData!)
            return image!
        }
    
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
    
//    var tendences: [Game] = [
//        .init(id_videojuegos: "id1", nombre: "God of War: Ragnarok", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Elden Ring", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "The Legend of Zelda: Tears of the Kingdom", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Doom", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Fallout 76", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Hollow Knight", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "God of War: Ragnarok", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Elden Ring", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "The Legend of Zelda: Tears of the Kingdom", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Doom", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Fallout 76", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Hollow Knight", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "God of War: Ragnarok", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Elden Ring", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "The Legend of Zelda: Tears of the Kingdom", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Doom", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Fallout 76", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Hollow Knight", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "God of War: Ragnarok", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Elden Ring", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "The Legend of Zelda: Tears of the Kingdom", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Doom", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Fallout 76", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Hollow Knight", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "God of War: Ragnarok", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Elden Ring", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "The Legend of Zelda: Tears of the Kingdom", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Doom", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Fallout 76", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Hollow Knight", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "God of War: Ragnarok", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Elden Ring", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "The Legend of Zelda: Tears of the Kingdom", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Doom", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Fallout 76", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Hollow Knight", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "God of War: Ragnarok", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Elden Ring", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "The Legend of Zelda: Tears of the Kingdom", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Doom", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Fallout 76", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Hollow Knight", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "God of War: Ragnarok", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Elden Ring", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "The Legend of Zelda: Tears of the Kingdom", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Doom", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Fallout 76", portada: "https://picsum.photos/100/200"),
//        .init(id_videojuegos: "id1", nombre: "Hollow Knight", portada: "https://picsum.photos/100/200")
//    ]
    
    var games: [Game] = []
    
    let url = URL(string: "https://superapi.netlify.app/api/db/eventos")
    func loadEvents(){
        URLSession.shared.dataTask(with: url!) {(data, response, error) in
                    guard let data = data,
                          let response = response as? HTTPURLResponse,
                          response.statusCode == 200, error == nil else {return}
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                self.games.removeAll()
                for name in json as! [[String : Any]] {
                    self.games.append(Game(json: name))
                }
                DispatchQueue.main.async{
                    self.viewMoreTable.reloadData()
                }
            } catch let errorJson {
                print(errorJson)
            }
        //            do {
        //                print(data)
        //                let event = try JSONDecoder().decode([Events].self, from: data)
        //                print(event)
        //            } catch {
        //                print("error: ", error)
        //                print(error.localizedDescription)
        //            }
                }.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewMoreTable.dataSource = self
        viewMoreTable.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewMoreRow: ViewMoreRow = tableView.dequeueReusableCell(withIdentifier: "viewMoreRowID", for: indexPath) as! ViewMoreRow
        let gamess = games[indexPath.row]
  
        
        viewMoreRow.portada.image = UIImage(named: gamess.portada)
        viewMoreRow.name.text = gamess.nombre
        
        
        return viewMoreRow
    }
    
}
