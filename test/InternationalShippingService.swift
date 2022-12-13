import Foundation

class InternationalShippingService: DeliveryAbroadProtocol{
    var name: String
    var price: Int
    var countryArray = ["USA", "China", "France"]
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
}
