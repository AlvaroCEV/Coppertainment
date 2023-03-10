
import Foundation

class basketGameBuy : Codable {
    public let id_usuario: String
    public let nombre: String

    init(json: [String: Any]){
    id_usuario = json["id_videojuegos"] as? String ?? ""
    nombre = json["nombre"] as? String ?? ""
    }
}
