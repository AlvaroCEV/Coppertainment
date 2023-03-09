class register : Codable{
    public let user: String
    public let contraseña: String
    
    init(json: [String: Any]) {
        user = json["user"] as? String ?? ""
        contraseña = json["contraseña"] as? String ?? ""
        
    }
}
