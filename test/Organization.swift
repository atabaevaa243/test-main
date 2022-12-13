import Foundation

class Organization{
    var name: String
    var storage = [Storage]()
    
    init(name: String) {
        self.name = name
        
    }
    
    func addStorage(model: Storage){
        storage.append(model)
    }
}
