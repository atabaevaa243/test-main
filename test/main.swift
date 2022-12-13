import Foundation

var apple = Organization(name: "Apple")

var productApple1: Product = Product(name: "MacBook Pro 16", price: 210000, weight: 2356, barcode: "A23786")
var productApple2: Product = Product(name: "Iphone 12", price: 91000, weight: 162, barcode: "A23786")
var productApple3: Product = Product(name: "Iphone X", price: 43000, weight: 184, barcode: "A89764")

var shoro = Organization(name: "Shoro")

var productShoro1: Product = Product(name: "Чалап", price: 100, weight: 1000, barcode: "SH9653")
var productShoro2: Product = Product(name: "Максым Шоро", price: 120, weight: 1000, barcode: "SH7865")
var productShoro3: Product = Product(name: "Kurut", price: 50, weight: 125, barcode: "SH4532")

var products1: Products = Products(product: productApple1, amount: 12)
var products2: Products = Products(product: productApple2, amount: 0)
var products3: Products = Products(product: productApple3, amount: 2)

var product4: Products = Products(product: productShoro1, amount: 25)
var product5: Products = Products(product: productShoro2, amount: 15)
var product6: Products = Products(product: productShoro3, amount: 10)

var storage1: Storage = Storage(country: "USA")
var storage2: Storage = Storage(country: "China")
var storage3: Storage = Storage(country: "France")
var storage4: Storage = Storage(country: "Kyrgyzstan")
apple.addStorage(model: storage1)
apple.addStorage(model: storage2)
apple.addStorage(model: storage3)
shoro.addStorage(model: storage4)

storage1.addProducts(model: products1)
storage2.addProducts(model: products2)
storage3.addProducts(model: products3)
storage4.addProducts(model: product4)
storage4.addProducts(model: product5)
storage4.addProducts(model: product6)
//dump(apple)

var storageArray = [storage1, storage2, storage3, storage4]
var productsArray = [productApple1, productApple3, productApple3, productShoro1, productShoro2, productShoro3]
var productAmountArray = [products1, products2, products3, product4, product5, product6]

var ildamExpress: DomesticDeliveryService = DomesticDeliveryService(name: "Ылдам-express", price: 500)
var dhl: InternationalShippingService = InternationalShippingService(name: "DHL", price: 1000)

var request = Request()

var newPrice = 0
var newName = ""
var totalPrice = 0
var newCountry = ""
var prodWeight = 0
var newBarcode = ""
var bool = false

func findInStorage(name: String, amount: Int){

    for (indexStor, itemStor) in storageArray.enumerated(){
        for (indexProd,itemProd) in productsArray.enumerated(){
            if name == itemProd.name{
                for (indexAmount, itemAmount) in productAmountArray.enumerated(){
                    if itemAmount.amount != 0 && amount <= itemAmount.amount && indexProd == indexAmount && indexStor == indexProd {
                        bool = true
                        totalPrice = amount * itemProd.price
                        newPrice = itemProd.price
                        newBarcode = itemProd.barcode
                        newName = itemProd.name
                        newCountry = itemStor.country
                        prodWeight = itemProd.weight
                    }
                }
            }
        }
    }
    if bool == true{
        delivery(countrySend: request.countrySend, countryStor: newCountry, weight: prodWeight)
        
    }
}

var totalDelivery = 0

func delivery(countrySend: String, countryStor: String, weight: Int){
    var deliveryPrice = 0
    var newWeight = weight
    if countrySend == countryStor{
        while newWeight  > 1000{
            deliveryPrice += 200
            newWeight  -= 1000
        }
        totalDelivery = request.prodAmount * (ildamExpress.price + deliveryPrice)
    }else{
        while newWeight  > 1000{
            deliveryPrice += 500
            newWeight  -= 1000
        }
        totalDelivery = request.prodAmount * (dhl.price + deliveryPrice)
    }
    
}

findInStorage(name: request.prodName, amount: request.prodAmount)

var newStr = ""
var discount = 0
func randomDiscount(){
    let randomInt = Int.random(in: 1..<3)
    if randomInt == 1{
        newStr += "5%"
        discount = (totalDelivery + totalPrice) * 5 / 100
    }else if randomInt == 3{
        newStr += "20%"
        discount = (totalDelivery + totalPrice) * 20 / 100
    }else{
        newStr += "0%"
    }
}
randomDiscount()

if bool == true {
    print("\nНаименование: \(newName) \nШтрихкод: \(newBarcode) \nВес: \(prodWeight) \nЦена за единицу: \(newPrice) \nКол-во заказа: \(request.prodAmount) \nИмя: \(request.userName) \nФамилия: \(request.userSurname) \nАдрес получателя: \(request.countrySend) \nСумма за доставку: \(totalDelivery) \nИтоговая сумма с учетом доставки: \(totalDelivery + totalPrice) \nСкидка: \(newStr) \nИтоговая сумма с учетом скидки: \((totalDelivery + totalPrice) - discount )")
} else {
    print("Tovara net")
}


