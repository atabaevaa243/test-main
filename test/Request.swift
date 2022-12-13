import Foundation

class Request{
    var userName: String
    var userSurname: String
    var prodName: String
    var prodAmount: Int
    var countrySend: String
    
    init() {
        print("Введите имя:")
        self.userName = readLine()!
        print("Введите фамилию:")
        self.userSurname = readLine()!
        print("Введите название товара:")
        self.prodName = readLine()!
        print("Введите кол-во товара:")
        self.prodAmount = Int(readLine()!)!
        print("Введите страну куда нужно доставить:")
        self.countrySend = readLine()!
    }
}
