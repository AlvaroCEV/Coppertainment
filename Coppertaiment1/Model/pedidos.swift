class pedidos : Codable{
    public let nombre: String
    public let portada: String
    public let precio: String
    public let plataforma: String

    
    init(json: [String: Any]) {
        nombre = json["nombre"] as? String ?? ""
        portada = json["portada"] as? String ?? ""
        precio = json["precio"] as? String ?? ""
        plataforma = json["plataforma"] as? String ?? ""
    }
}
