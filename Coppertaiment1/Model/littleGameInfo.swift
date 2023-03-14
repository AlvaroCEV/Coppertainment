
import Foundation

class littleGameInfo : Codable{
    public let id_videojuegos: String
    public let nombre: String
    public let precio: String
    public let portada: String
    public let consola: String


    init(json: [String: Any]) {
        id_videojuegos = json["id_videojuegos"] as? String ?? ""
        nombre = json["nombre"] as? String ?? ""
        precio = json["precio"] as? String ?? ""
        portada = json["portada"] as? String ?? ""
        consola = json["consola"] as? String ?? ""
    }
}
