class generalData : Codable{
    public let wishlist: [String]
    public let pedidos: [String]
    public let puntos: String
    public let cartera: String

    
    init(json: [String: Any]) {
        wishlist = json["wishlist"] as? [String] ?? [""]
        pedidos = json["pedidos"] as? [String] ?? [""]
        puntos = json["puntos"] as? String ?? ""
        cartera = json["cartera"] as? String ?? ""
    }
}
