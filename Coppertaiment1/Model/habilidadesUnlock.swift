class habilidadesUnlock : Codable{
    public let puntos: String
    public let id_habilidad: String
    public let id_usuario: String
    
    init(json: [String: Any]) {
        puntos = json["puntos"] as? String ?? ""
        id_habilidad = json["id_habilidad"] as? String ?? ""
        id_usuario = json["id_usuario"] as? String ?? ""
        
    }
}
