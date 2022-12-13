import Foundation

class Product{
    var name: String
    var price: Int
    var weight: Int
    var barcode: String
    
    init(name: String, price: Int, weight: Int, barcode: String) {
        self.name = name
        self.price = price
        self.weight = weight
        self.barcode = barcode
    }
}
