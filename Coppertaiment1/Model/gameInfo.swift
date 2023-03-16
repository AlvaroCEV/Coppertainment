class gameInfo : Codable{
    public let id_videojuegos: Double
    public let nombre: String
    public let categoria: String
    public let genero: String
    public let visuales: String
    public let plataforma: String
    public let precio: String
    public let portada: String
    
    init(json: [String: Any]) {
        id_videojuegos = json["id_videojuegos"] as? Double ?? 0
        nombre = json["nombre"] as? String ?? ""
        categoria = json["categoria"] as? String ?? ""
        genero = json["genero"] as? String ?? ""
        visuales = json["visuales"] as? String ?? ""
        plataforma = json["plataforma"] as? String ?? ""
        precio = json["precio"] as? String ?? ""
        portada = json["portada"] as? String ?? ""
    }
}
