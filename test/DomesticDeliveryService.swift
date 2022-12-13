import Foundation

class DomesticDeliveryService: DomesticDeliveryProtocol{
    var name: String
    var price: Int
    var countryArray = ["Kyrgystan"]
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
}
