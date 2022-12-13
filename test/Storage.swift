import Foundation

class Storage{
    var country: String
    var products = [Products]()
    
    init(country: String) {
        self.country = country
    }
    
    func addProducts(model: Products){
        products.append(model)
    }
}
