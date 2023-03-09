class habilidades : Codable{
    public let nombre: String
    public let descripcion: String
    public let cooldown: String
    public let portada: String
    
    init(json: [String: Any]) {
        nombre = json["nombre"] as? String ?? ""
        descripcion = json["descripcion"] as? String ?? ""
        cooldown = json["cooldown"] as? String ?? ""
        portada = json["portada"] as? String ?? ""
        
    }
}
