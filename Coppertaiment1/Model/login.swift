class login : Codable{
    public let id_usuario: String
    public let usuario: String
    public let contraseña: String
    
    init(json: [String: Any]) {
        id_usuario = json["id_usuario"] as? String ?? ""
        usuario = json["usuario"] as? String ?? ""
        contraseña = json["contraseña"] as? String ?? ""
        
    }
}
