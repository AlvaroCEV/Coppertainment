class habilidadesActivar : Codable{
    public let id_habilidad: String
    public let date: String
    public let id_usuario: String
    public let id_videojuegos: String
    
    init(json: [String: Any]) {
        id_habilidad = json["id_habilidad"] as? String ?? ""
        date = json["date"] as? String ?? ""
        id_usuario = json["id_usuario"] as? String ?? ""
        id_videojuegos = json["id_videojuegos"] as? String ?? ""

    }
}
